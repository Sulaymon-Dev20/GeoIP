#!/bin/bash

# Check if the directory /usr/share/GeoIP exists. If not, create it.
if [ ! -d /usr/share/GeoIP ]; then
  mkdir -p /usr/share/GeoIP;
fi

# Combine the split GeoLite2-City-Blocks-IPv4 files into a single file
cat GeoLite2-City-Blocks-IPv4.csv.1 > GeoLite2-City-Blocks-IPv4.csv
cat GeoLite2-City-Blocks-IPv4.csv.2 >> GeoLite2-City-Blocks-IPv4.csv

# Move the GeoLite2-City-Blocks-IPv4 file to /usr/share/GeoIP and rename it to GeoLite2-City-Blocks-IPv4.csv
mv GeoLite2-City-Blocks-IPv4 /usr/share/GeoIP/GeoLite2-City-Blocks-IPv4.csv

# Move the GeoLite2-City-Locations-en file to /usr/share/GeoIP and rename it to GeoLite2-City-Locations-en.csv
mv GeoLite2-City-Locations-en /usr/share/GeoIP/GeoLite2-City-Locations-en.csv

# Make the ipinfo file executable
chmod +x ipinfo

# Move the executable ipinfo file to /usr/local/bin for global access
mv ipinfo /usr/local/bin

# Remove the ../GeoIP directory and all its contents recursively and forcefully
rm -vrf ../GeoIP
