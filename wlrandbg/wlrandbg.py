#!/usr/bin/env python3
import os
import sys
import time
import random
import subprocess
import argparse
from pathlib import Path

# Initialize a variable to store the current swaybg process
last_swaybg_process = None

def set_wallpaper(image_path):
    global last_swaybg_process

    # Start swaybg with the new wallpaper
    current_swaybg_process = subprocess.Popen(["swaybg", "-i", str(image_path), "-m", "fill"])
    print(f"Wallpaper set to {image_path}")
    time.sleep(10)
    # Kill any existing swaybg instance
    if last_swaybg_process and last_swaybg_process.poll() is None:
        last_swaybg_process.terminate()
    last_swaybg_process = current_swaybg_process

def cycle_wallpapers(directory, cycle_time, shuffle):
    # Get all image files in the directory
    images = list(Path(directory).glob("*.jpg")) + \
             list(Path(directory).glob("*.jpeg")) + \
             list(Path(directory).glob("*.png"))
    
    if not images:
        print("No image files found in the specified directory.")
        sys.exit(1)

    # Shuffle images if enabled
    if shuffle:
        random.shuffle(images)

    try:
        # Cycle through images indefinitely
        while True:
            for image in images:
                set_wallpaper(image)
                time.sleep(cycle_time - 10)
            # Re-shuffle after each cycle if shuffle is enabled
            if shuffle:
                random.shuffle(images)
    except KeyboardInterrupt:
        print("\nWallpaper cycling interrupted by user. Exiting...")
        if last_swaybg_process and last_swaybg_process.poll() is None:
            last_swaybg_process.terminate()
        sys.exit(0)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Wallpaper Setter for wlroots Compositors")
    parser.add_argument("path", help="Path to an image or directory of images")
    parser.add_argument("--cycle-time", type=int, default=300, help="Time in seconds to cycle wallpapers (default: 300)\nmust be at least 10")
    parser.add_argument("--shuffle", action="store_true", help="Shuffle wallpapers if a directory is provided")
    args = parser.parse_args()

    # Validate and adjust the cycle time if out of bounds
    if args.cycle_time < 10:
        print(f"Cycle time too low. Setting to minimum of 10 seconds.")
        args.cycle_time = 10
    # Check if the provided path is a file or directory
    if os.path.isfile(args.path):
        set_wallpaper(args.path)
    elif os.path.isdir(args.path):
        cycle_wallpapers(args.path, args.cycle_time, args.shuffle)
    else:
        print("Error: Specified path is neither a file nor a directory.")
        sys.exit(1)
