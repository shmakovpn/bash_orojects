#!/bin/bash
# Creates empty bash script
# Usage: touch-bash.sh script_name
# Author: shmakovpn <shmakovpn@yandex.ru>
# Date: 2019-10-10

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

SCRIPT_DIR=`echo ${SCRIPT} | sed -re 's/[^\/]*$//'`
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
echo "#!/bin/bash" >> ${SCRIPT}
echo "# Author: ${AUTHOR}" >> ${SCRIPT}
echo "# Date: "`date +%Y-%m-%d` >> ${SCRIPT}
echo "" >> ${SCRIPT}
echo "# TODO description" >> ${SCRIPT}
echo "" >> ${SCRIPT}
echo "## start config" >> ${SCRIPT}
echo "PROG_ID='`uuid`'  # unique id of the program" >> ${SCRIPT}
echo "SCRIPT_NAME=\`basename \$0\`  # the name of the script" >> ${SCRIPT}
echo "SCRIPT_DIR=\`dirname \$(readlink -f \$0)\`  # the path to the script folder" >> ${SCRIPT}
echo "## end config" >> ${SCRIPT}
echo "" >> ${SCRIPT}

echo "## begin main" >> ${SCRIPT}
echo "## end main" >> ${SCRIPT}
echo "" >> ${SCRIPT}
echo "" >> ${SCRIPT}
echo "# vim: number ts=4 sw=4 expandtab smarttab" >> ${SCRIPT}

echo "The file filled"
chmod +x ${SCRIPT}
echo "__END__"



# vim: number ts=4 sw=4 expandtab smarttab
