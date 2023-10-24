# Hello world docker action

This action prints "MNG:Hello World" or "MNG:Hello" + the name of a person to greet to the log.

## Inputs

## `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

## `time`

The time we greeted you.

## Example usage
```
name: "test docker full url clock-action"
run-name: "${{ github.actor }} is running git hub action docker full url clock-action"
on:
  workflow_dispatch:
    inputs:
      workflow_greeter:
        description: "Workflow Greeter"
        required: true
        default: "Default Greeter by Workflow"
        type: string

jobs:
  what-time-is-it:
    runs-on: ubuntu-latest
    name: A job to call docker time action
    steps:
      - name: Dump Inputs
        run: |
          echo "workflow_greeter=[${{ inputs.workflow_greeter }}]"
      - name: call clock-action step
        uses: moyshale/github-clock-action@main
        id: clock-action1
        with:
          action_greeter: ${{inputs.workflow_greeter}}
      # Use the output from the `hello` step
      - name: Get the outputs
        run: |
          echo "The time was ${{ steps.clock-action1.outputs.time }}"
          echo "The greeter was ${{ steps.clock-action1.outputs.greeter }}"
```

## How to run locally
```
docker run -it -e GITHUB_OUTPUT=/host/output.txt -v `pwd`:/host clock-action yoooo
MNG: Hello [yoooo]
== start dump env==
CHARSET='UTF-8'
GITHUB_OUTPUT='/host/output.txt'
HOME='/root'
HOSTNAME='505af0377214'
IFS='
'
LANG='C.UTF-8'
LINENO=''
OPTIND='1'
PAGER='less'
PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
PPID='0'
PS1='\h:\w\$ '
PS2='> '
PS4='+ '
PWD='/'
SHLVL='1'
TERM='xterm'
script='/etc/profile.d/*.sh'
== end dump env==
```

## about docker based github actions
* https://docs.github.com/en/actions/creating-actions/creating-a-docker-container-action
* https://docs.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions
  * read this for many deatails on specifics on how GHA runs docker container, args, entrypoint, workdir, etc
* https://docs.github.com/en/actions/creating-actions/metadata-syntax-for-github-actions syntax for actions.yml
### Setting an output parameter
* [Setting an output parameter](https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#setting-an-output-parameter)

```
echo "{name}={value}" >> $GITHUB_OUTPUT

```
