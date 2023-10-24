#!/bin/sh -l

# arguments - $1 name of entity to greet
# will output time into $GITHUB_OUTPUT in form of time=Tue Jan 24 16:39:38 CST 2023

echo "MNG: Hello [$1]"
echo "== start dump env=="
set
echo "== end dump env=="
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
echo "greeter=$1" >> $GITHUB_OUTPUT