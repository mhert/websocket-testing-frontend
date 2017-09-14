#!/usr/bin/env sh
set -e

# Get all defined env vars
ENV_VARS=""
for VAR in `env`; do
    VAR=`echo $VAR | cut -f1 -d"="`
    ENV_VARS="${ENV_VARS} \\\$${VAR}"
done

# Replace all defined env vars in config template
envsubst "$ENV_VARS" < /usr/share/nginx/html/index.html > /usr/share/nginx/html/index.html
