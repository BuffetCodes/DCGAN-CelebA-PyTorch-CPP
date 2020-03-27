#! /bin/sh

#COLORS

none='\033[0m'
bold='\033[01m'
disable='\033[02m'
underline='\033[04m'
reverse='\033[07m'
strikethrough='\033[09m'
invisible='\033[08m'

black='\033[30m'
red='\033[31m'
green='\033[32m'
orange='\033[33m'
blue='\033[34m'
purple='\033[35m'
cyan='\033[36m'
lightgrey='\033[37m'
darkgrey='\033[90m'
lightred='\033[91m'
lightgreen='\033[92m'
yellow='\033[93m'
lightblue='\033[94m'
pink='\033[95m'
lightcyan='\033[96m'


# Variables for folder names and paths 
BUILD_F=build
OUTPUT_F=build/output

PATH_ONE=/root/libtorch
PATH_TWO=/root//libtorch/share/cmake/Torch/



if [ -d $BUILD_F ] ; then
	echo "${bold}${yellow}build folder Already Present... !! skipping folder creation"
else
	echo "${bold}${purple}Creating ${bold}build folder"
	mkdir build && echo "${bold}${lightgreen}Done" || (echo "${bold}${red}Folder creation failed.. exiting..." && exit 0)
fi


echo "${none}Running ${bold}${lightblue}Cmake ${none}inside the ${bold}${green}build ${none}folder..."
(cd build && cmake -DCMAKE_PREFIX_PATH=${PATH_ONE} -DCMAKE_MODULE_PATH=${PATH_TWO} ..) || (echo "${bold}${red}cmake command failed... exiting..${none}" && exit 0)


if [ -d ${OUTPUT_F} ] ; then
	echo "${bold}${yellow}output folder already exists inside build...!! skipping folder creation"
else
	echo "${bold}${purple}Creating output folder inside build"
	mkdir -p build/output && echo "${bold}${lightgreen}Done" || (echo "${bold}${red}Folder creation failed.. exiting${none}" && exit 0)
fi

echo "${none}${bold}Running the ${bold}${lightblue}make command"

(cd build && make) && echo "${bold}${lightgreen}Done${none}" || (echo "${bold}${red}make command failed.. exiting ...${none}" && exit 0)
