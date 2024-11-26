// intergient.com refuse to provide service to users in some country/region
// (returning ad loader `ramp.js` of 0-byte)
// extract the key manually
window.onload = () => {
  // context isolation prevents us from accessing webview's object
  // have to fetch the page manually
  fetch('https://addons.wago.io/wowup_ad').then(async function (res) {
    const text = await res.text();
    // do not parse, just match the `atob ( 'base64-encoded/api-key==' )` call
    const match = /atob\s*\(\s*'([A-Za-z0-9+/-_]+={0,2})'\s*\)/.exec(text);
    if (match.length == 2) {
      console.log(`[wago-preload] wago manual key extraction`);
      const key = atob(match[1]);
      ipcRenderer.send("wago-token-received", key);
      window.clearTimeout(keyExpectedTimeout);
      keyExpectedTimeout = undefined;
    }
  });
};
