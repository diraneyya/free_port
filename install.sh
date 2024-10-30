#!/usr/bin/env bash

if ! command -v docker >/dev/null 2>&1; then
echo "This utility uses 'docker' under the hood, which is not installed, aborting..." >&2
exit 1
fi 

docker pull orwa84/free_port:latest >/dev/null 2>&1
if [[ $? -ne 0 ]]; then
echo "Error downloading docker image, check your connection and try again, aborting..." >&2
exit 2
fi 

cat <<'EOF'

[33;1mInstallation complete![0m

[3mPlease append the following code snippet to your shell's run-command file
[2m(depending on the shell you are using this can be [33m.bashrc[39m, [33m.zshrc[39m, etc.)[0m
[100m
function free_port() {                                  
    docker run --rm --network=host orwa84/free_port $1  
}                                                       
[0m

[3;2mOnce added, you will be able to use the command in place of hard-coded
port numbers to avoid command failure, for example:[0m
[4mdocker run -p $(free_port 80):80 nginx[24m

EOF