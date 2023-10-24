#!/bin/bash -eu

echo "DOCKER?"
(ls /.dockerenv && echo Found dockerenv) || (echo No dockerenv)

echo "UNAME"
uname -a

echo "ISSUE?"
if [[ -f /etc/issue ]]; then
    echo "Found /etc/issue"
    cat /etc/issue
else
    echo "Not found /etc/issue"
fi

echo "OS RELEASE?"
if [[ -f /etc/os-release ]]; then
    echo "Found /etc/os-release"
    cat /etc/os-release
else
    echo "Not found /etc/os-release"
fi