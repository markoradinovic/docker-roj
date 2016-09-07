#!/bin/bash
set -e

cat <<'EOT'

 ######
 ##   ##            ##
 ##   ##  #####  ##   ##
 ######  ##   ## ##  ###
 ##      ##   ## ## # ##
 ##      ##   ## ###  ##
 ##       #####  ##   ##

EOT

# Credits: https://github.com/jwilder/nginx-proxy

# Warn if the DOCKER_HOST socket does not exist
if ! [ -e /roj/env ]; then
    cat >&2 <<-EOT
WARNING: No env file for roj found.
EOT
fi

exec "$@"