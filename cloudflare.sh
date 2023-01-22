#!/bin/bash

# Replace these with your own values
auth_email="trew.rad@gmail.com"

auth_key=$(<"test/auth_key.txt") 
zone_id="b4efc0334f3e0a2857917a7b5c456285"
record_id="5f99e383711a371e04e2881f9bc23616"

# Get the current public IP address
public_ip=$(curl -s https://ipv4.icanhazip.com)

# Update the DNS record
curl -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$record_id" \
     -H "Content-Type: application/json" \
     -H "X-Auth-Email: $auth_email" \
     -H "X-Auth-Key: $auth_key" \
     -d "{\"type\":\"A\",\"name\":\"example.com\",\"content\":\"$public_ip\",\"ttl\":120,\"proxied\":false}"
