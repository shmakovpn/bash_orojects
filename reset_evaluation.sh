#!/bin/bash
# This sript reset evaluation period on PyCharm, IntelliJIdea, PhpStorm
#Author: shmakovpn <shmakovpn@yandex.ru>
#Date: 2019-07-31

# 2019-11-05 reset PyCharm,IntelliJIdea,PhpStorm evalueation
echo "removeing evalueation key all versions of PyCharm, IntelliJIdea, PhpStorm"
for I in ~/.{PyCharm,IntelliJIdea,PhpStorm}*; do
    if [[ -d ${I} ]]; then
        echo "Found PyCharm profile folder='${I}'"	    
	    if [[ -d ${I}/config/eval ]]; then
            echo "  Found PyCharm folder: '${I}/config/eval'"	
            for J in ${I}/config/eval/*.key; do
                if [[ -f ${J} ]]; then
                    echo "    Found Pycharm file: '${J}'"               
                    echo "      Removeing '${J}'"
                    rm -f ${J} && echo "      Removed" || echo "      Removeing FAILED!!"
                fi
            done
        fi
        if [[ -d ${I}/config/options ]]; then
            echo "  Found PyCharm forlder: '${I}/config/options'"
            for J in ${I}/config/options/*.xml; do
                if [[ -f ${J} ]]; then
                    cat ${J} | grep evlsprt 2>&1 > /dev/null
                    if [[ $? -eq 0 ]]; then
                        echo "    Found 'evlsprt' config file '${J}'"
                        echo "      Modifying it"
                        sed -i /evlsprt/d ${J}
                        cat ${J} | grep evlsprt 2>&1 > /dev/null
			if [[ $? -eq 0 ]]; then
                            echo "      Modifyind FAILED!!"
                        else
                            echo "      Modified"
                        fi
                    fi
                fi
            done
        fi
    fi
done

echo "Removeing 'evlsprt' files from ~/.java/.userPrefs/jetbrains"
for I in ~/.java/.userPrefs/jetbrains/{pycharm,idea,phpstorm}/*; do
    if [[ -d ${I} ]]; then
        echo "  Found folder: '${I}'"
        for J in ${I}/evlsprt*; do
            if [[ -f ${J} ]]; then
                echo "    Found 'evlsprt' file: '${J}'"
                echo "    Removeing it"
                rm -f ${J} && echo "      Removed" || echo "      Removeing FAILED!!"
            fi
            if [[ -d ${J} ]]; then
                echo "    Found 'evlsprt' folder: '${J}'"
                echo "    Removeing it"
                rm -rf ${J} && echo "      Removed" || echo "      Removeing FAILED!!"
            fi
        done
    fi
done

# vim: set expandtab ts=4 sw=4 ai
