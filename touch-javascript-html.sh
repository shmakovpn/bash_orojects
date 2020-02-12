#!/bin/bash
# Author: shmakovpn <shmakovpn@yandex.ru>
# Date: 2020-02-12

# This script creates a html file for testing javascript code

## start config
PROG_ID='de1d74d0-4d80-11ea-aa3e-7764ce4bf4a4'  # unique id of the program
SCRIPT_NAME=`basename $0`  # the name of the script
SCRIPT_DIR=`dirname $(readlink -f $0)`  # the path to the script folder
## end config

## begin main
SCRIPT=$1
USAGE="Usage: $0 script_name"
AUTHOR='shmakovpn <shmakovpn@yandex.ru>'

if [[ -z ${SCRIPT} ]]; then
    echo "Error: script_name can not be emply"
    echo ${USAGE}
    exit 1
fi

if [[ -f ${SCRIPT} ]]; then
    echo "Error: a file with name '${SCRIPT}' already exists"
    echo ${USAGE}
    exit 1
fi

if [[ -d ${SCRIPT} ]]; then
    echo "Error: a directory with name '${SCRIPT}' already exists"
    echo ${USAGE}
    exit 1
fi

if [[ ${SCRIPT} =~ /$ ]]; then
    echo "Error: Invalid script_name, a script_name can not be ended with '/'"
    echo ${USAGE}
    exit 1
fi

# make the directory of the script if it does not exist and it is not empty
if [[ ! -z ${SCRIPT_DIR} ]]; then
    echo "Info: Creating the directory of the script '${SCRIPT_DIR}'"
    mkdir -p ${SCRIPT_DIR}
    if [[ $? -ne 0 ]]; then
        echo "Error: Could not 'mkdir -p ${SCRIPT_NAME}'"
        exit 1
    fi
    echo "Info: the directory created"
fi

# create the script file
touch ${SCRIPT}
echo "Info: Creating the script file '${SCRIPT}'"
if [[ $? -ne 0 ]]; then
    echo "Error: Could not 'touch ${SCRIPT}"
    exit 1
fi
echo "Info: the file created"

# put content to the created script file
echo "<html>" >> ${SCRIPT}
echo "    <head>" >> ${SCRIPT}
echo "        <meta charset='UTF-8' />" >> ${SCRIPT}
echo "        <title>Testing javascript - TODO</title>" >> ${SCRIPT}
echo "	<meta name='author' content='${AUTHOR}' />" >> ${SCRIPT}
echo "    </head>" >> ${SCRIPT}
echo "    <body>" >> ${SCRIPT}
echo "        <h1>Testing javascript - TODO</h1>" >> ${SCRIPT}
echo "	<div id='creation_date'>Creation Date=</div>" >> ${SCRIPT}
echo "	<div id='prog_id'>PROG_ID=</div>" >> ${SCRIPT}
echo "	<hr />" >> ${SCRIPT}
echo "	<div id='content'></div>" >> ${SCRIPT}
echo "    </body>" >> ${SCRIPT}
echo "    <script>" >> ${SCRIPT}
echo "        let progId = '$(uuid)';" >> ${SCRIPT}
echo "        document.getElementById('prog_id').innerHTML += progId;" >> ${SCRIPT}
echo "        let creationDate = '$(date +%Y-%m-%d)';" >> ${SCRIPT}
echo "        document.getElementById('creation_date').innerHTML += creationDate;" >> ${SCRIPT}
echo "    </script>" >> ${SCRIPT}
echo "    <script>" >> ${SCRIPT}
echo "        // todo - put your javascript code here!!" >> ${SCRIPT}
echo "        // document.getElementById('content').innerHTML = 'Hello World';" >> ${SCRIPT}
echo "        // console.log('Hello World');" >> ${SCRIPT}
echo "    </script>" >> ${SCRIPT}
echo "    <!-- vim: number ts=4 sw=4 expandtab smarttab -->" >> ${SCRIPT}
echo "</html>" >> ${SCRIPT}

echo "The file filled"
echo "__END__"
## end main


# vim: number ts=4 sw=4 expandtab smarttab
