#!/bin/bash
set -e

curl -s -4 --fail 'https://api.ipify.org'

route -n

ifconfig
