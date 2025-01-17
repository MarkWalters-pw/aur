# Script to maintain the PKGBUILD as the launcher receives updates

import requests
from dataclasses import dataclass
import os
import shutil
import hashlib
import re
import subprocess

REPO = "open-goal/launcher"
SCRIPT_HOME = os.path.dirname(os.path.realpath(__file__))
PKGBUILD = os.path.join(SCRIPT_HOME, "PKGBUILD")
API_HEADERS = {
    "User-Agent": "aur-maintain; wasabithumbs@gmail.com"
}


@dataclass
class Release:
    version: str
    tarball: str


def get_latest_release() -> Release:
    resp = requests.get('https://api.github.com/repos/{}/releases?per_page=1'.format(REPO), headers=API_HEADERS)
    print("GitHub API: HTTP {}".format(resp.status_code))
    dat = resp.json()[0]

    version = dat["tag_name"]
    assert isinstance(version, str), "Tag name is not a string!"
    tarball = "https://github.com/open-goal/launcher/archive/refs/tags/" + version + ".tar.gz"
    version = version[1:]

    return Release(version, tarball)


def get_repo_desc() -> str:
    resp = requests.get('https://api.github.com/repos/{}'.format(REPO), headers=API_HEADERS)
    print("GitHub API: HTTP {}".format(resp.status_code))
    dat = resp.json()

    desc = dat["description"]
    assert isinstance(desc, str), "Description is not a string!"

    return desc


def sum_url(url: str) -> str:
    resp = requests.get(url)
    assert (resp.status_code == 200), "Unexpected status code: {}".format(resp.status_code)
    return hashlib.md5(resp.content).hexdigest()


if __name__ == '__main__':
    print("Backing up PKGBUILD...")
    shutil.copyfile(PKGBUILD, PKGBUILD + ".bak")

    print("Fetching latest release...")
    release = get_latest_release()
    dsc = get_repo_desc()
    print("Found release " + release.version)

    print("Computing sum...")
    tar_sum = sum_url(release.tarball)
    print(tar_sum)

    tar_name = release.tarball.split('/')[-1]
    update = {
        'pkgver': release.version,
        'pkgdesc': dsc,
        '_tarball': tar_name.replace(release.version, '${pkgver}'),
        'source': [release.tarball.replace(tar_name, '${_tarball}'), '${pkgname}.desktop'],
        'md5sums': [tar_sum, 'SKIP']
    }

    print("Updating PKGBUILD...")

    lines = []
    with open(PKGBUILD, 'r') as f:
        end_of_cfg = False
        for line in f.readlines():
            empty = len(line) < 1

            if empty or re.match("^\\s+$", line):
                end_of_cfg = True
                lines.append(line)
                continue
            elif line[0] == "#" or end_of_cfg:
                lines.append(line)
                continue

            key = line.split('=')[0]
            if not (key in update):
                lines.append(line)
                continue

            new_value = update[key]

            new_line = ""
            if type(new_value) in [list, tuple]:
                new_line = '('
                space = False
                for entry in new_value:
                    if space:
                        new_line += " "
                    space = True
                    new_line += "\"{}\"".format(entry)
                new_line += ")"
            else:
                new_line = "\"{}\"".format(new_value)

            new_line = "{}={}\n".format(key, new_line)

            lines.append(new_line)

    with open(PKGBUILD, 'w') as f:
        f.write("".join(lines))

    print("Generating .SRCINFO...")
    p = subprocess.Popen(['bash', 'gensrc.sh'], cwd=SCRIPT_HOME)
    p.wait()
    print("Command finished with code {}".format(p.returncode))

    print("Adding files to git...")
    p = subprocess.Popen(['git', 'add', 'PKGBUILD', '.SRCINFO'], cwd=SCRIPT_HOME)
    p.wait()
    print("Command finished with code {}".format(p.returncode))

    print("Done!")
