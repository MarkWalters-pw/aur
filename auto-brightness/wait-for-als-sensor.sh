#!/bin/bash

find_iio_device_with_illuminance() {
    for device in /sys/bus/iio/devices/iio:device*; do
        if [ -f "$device/in_illuminance_raw" ]; then
            echo "$device"
            return 0
        fi
    done
    echo "No device found."
    return 1
}


# Timeout in seconds
TIMEOUT=30
INTERVAL=1

while [ $TIMEOUT -gt 0 ]; do
    DEVICE_PATH=$(find_iio_device_with_illuminance)
    if [[ $DEVICE_PATH != "No device found." ]]; then
        echo "Ambient Light Sensor is ready @ $DEVICE_PATH"
        exit 0
    fi
    sleep $INTERVAL
    TIMEOUT=$(( TIMEOUT - INTERVAL ))
done

echo "Ambient Light Sensor not found within the timeout period."
exit 1
