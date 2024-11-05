#!/bin/bash

subnet=$1
offset=$2

# Extract the base IP and mask
base_ip=$(echo $subnet | cut -d'/' -f1)
mask=$(echo $subnet | cut -d'/' -f2)

# Convert base IP to decimal
IFS='.' read -r i1 i2 i3 i4 <<< "$base_ip"
base_dec=$((i1 * 256 ** 3 + i2 * 256 ** 2 + i3 * 256 + i4))

# Convert offset to decimal
IFS='.' read -r o1 o2 o3 o4 <<< "$offset"
offset_dec=$((o1 * 256 ** 3 + o2 * 256 ** 2 + o3 * 256 + o4))

# Calculate the new IP
new_dec=$((base_dec + offset_dec))

# Convert the new decimal back to IP
new_ip="$((new_dec >> 24 & 255)).$((new_dec >> 16 & 255)).$((new_dec >> 8 & 255)).$((new_dec & 255))"

# Print the result
echo "$new_ip"
