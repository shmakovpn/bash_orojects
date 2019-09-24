#!/bin/bash
# This sript reset evaluation perion on PyCharm
#Author: shmakovpn <shmakovpn@yandex.ru>
#Date: 2019-07-31

echo "removeing evalueation key all versions of PyCharm"
rm ~/.PyCharm*/config/eval/*

echo "resetting evalsprt in options.xml all versions of PyCharm"
sed -i '/evlsprt/d' ~/.PyCharm*/config/options/options.xml

echo "resetting evalsprt ~/.java/.userPrefs/jetbrains/pycharm versions of PyCharm"
rm -rf ~/.java/.userPrefs/jetbrains/pycharm/*/evlsprt*

echo "removeing evaluation key all versions of IntelliJIdea"
rm ~/.IntelliJIdea*/config/eval/*

echo "resetting evalsprt in options all versions of IntelliJIdea"
sed -i '/evlsprt/d' ~/.IntelliJIdea*/config/options/options.xml
sed -i '/evlsprt/d' ~/.IntelliJIdea*/config/options/other.xml

echo "resetting evalsprt ~/.java/.userPrefs/jetbrains/idea versions of IntelliJIdea"
rm -rf ~/.java/.userPrefs/jetbrains/idea/*/evlsprt*

echo "removeing evaluation key all versions of PhpStorm"
rm ~/.PhpStorm*/config/eval/*

echo "resetting evalsprt in options.xml all versions of PhpStorm"
sed -i '/evlsprt/d' ~/.PhpStorm*/config/options/options.xml

echo "resetting evalsprt ~/.java/.userPrefs/jetbrains/phpstorm versions of PhpStorm"
rm -rf ~/.java/.userPrefs/jetbrains/phpstorm/*/evlsprt*
