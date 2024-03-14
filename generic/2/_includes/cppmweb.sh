#!/bin/bash
# This script copies the example and build script files that are automatically loaded into markdown files upon building the website.

source ~/.bashrc

CURRENT_DIR=$(pwd)
echo >&2
echo >&2 "-- current directory: $CURRENT_DIR"
echo >&2


FILE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo >&2
echo >&2 "-- script directory: $FILE_DIR"
echo >&2
PMWEB_INCLUDE_DIR="${FILE_DIR}"

####################################################################################################################################
# parse input arguments
####################################################################################################################################

#KERNEL_DOXYGEN_ENABLED="false"
MLX_ENABLED="false"
ALL_ENABLED="true"

while [ "$1" != "" ]; do
    case $1 in
       #-D | --doxy )           KERNEL_DOXYGEN_ENABLED=true
       #                         ;;
        -M | --mlx )            MLX_ENABLED=true
                                ;;
        -N | --nall )           ALL_ENABLED=false
                                ;;
        -n | --nproc )          shift
                                FOR_COARRAY_NUM_IMAGES="$1"
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                echo >&2 ""
                                echo >&2 "-- ParaMonte - FATAL: The specified flag $1 does not exist."
                                echo >&2 ""
                                echo >&2 "-- ParaMonte - gracefully exiting."
                                echo >&2 ""
                                echo >&2 ""
                                exit 1
    esac
    shift
done

####################################################################################################################################
# generate and copy kernel doxygen documentation. NOT ANYMORE. DOXYGEN HAS NOW ITS OWN REPOSITORY.
####################################################################################################################################

#if [ "${KERNEL_DOXYGEN_ENABLED}" = "true" ] || [ "${ALL_ENABLED}" = "true" ]; then
#    cd "${FILE_DIR}/../../src/doxygen"
#    source build.sh
#    cd "${FILE_DIR}"
#fi

####################################################################################################################################

ParaMonte_GIT_DIR="../../"
ParaMonte_GIT_EXAM_DIR="${ParaMonte_GIT_DIR}/example"

PMWEB_GIT_DIR="${PMWEB_INCLUDE_DIR}/git"
PMWEB_GIT_SRC_DIR="${PMWEB_GIT_DIR}/src"
PMWEB_GIT_SRC_INTERFACE_DIR="${PMWEB_GIT_SRC_DIR}/interface"
PMWEB_GIT_SRC_INTERFACE_C_DIR="${PMWEB_GIT_SRC_INTERFACE_DIR}/C"
PMWEB_GIT_SRC_INTERFACE_CPP_DIR="${PMWEB_GIT_SRC_INTERFACE_DIR}/CPP"
PMWEB_GIT_SRC_INTERFACE_Fortran_DIR="${PMWEB_GIT_SRC_INTERFACE_DIR}/Fortran"
PMWEB_GIT_SRC_INTERFACE_MATLAB_DIR="${PMWEB_GIT_SRC_INTERFACE_DIR}/MATLAB"
PMWEB_GIT_SRC_INTERFACE_Python_DIR="${PMWEB_GIT_SRC_INTERFACE_DIR}/Python"
PMWEB_GIT_SRC_INTERFACE_Python_SETUP_DIR="${PMWEB_GIT_SRC_INTERFACE_Python_DIR}/setup"
PMWEB_GIT_AUXIL_DIR="${PMWEB_GIT_DIR}/auxil"
PMWEB_GIT_EXAM_DIR="${PMWEB_GIT_DIR}/example"

PMWEB_NOTE_DIR="${PMWEB_INCLUDE_DIR}/../notes"
PMWEB_NOTE_EXAMPLES_DIR="${PMWEB_NOTE_DIR}/examples"
PMWEB_NOTE_EXAMPLES_MATLAB_DIR="${PMWEB_NOTE_EXAMPLES_DIR}/matlab"
PMWEB_NOTE_EXAMPLES_MATLAB_MLX_DIR="${PMWEB_NOTE_EXAMPLES_MATLAB_DIR}/mlx"

if ! [ -d "${PMWEB_NOTE_EXAMPLES_MATLAB_MLX_DIR}" ]; then
    #mkdir -p "${PMWEB_NOTE_EXAMPLES_MATLAB_MLX_DIR}"
    echo >&2
    echo >&2 "-- This directory must exist: ${PMWEB_NOTE_EXAMPLES_MATLAB_MLX_DIR}"
    echo >&2 "-- Gracefully exiting..."
    echo >&2
    exit 1
fi

cd ${PMWEB_INCLUDE_DIR}

# remove old folder

rm -rf ${PMWEB_GIT_DIR}

# regenerate the folder structure

if ! [ -d "${PMWEB_GIT_DIR}" ]; then
    echo >&2 "-- creating the folder: ${PMWEB_GIT_DIR}"
    mkdir -p "${PMWEB_GIT_DIR}"
fi
if ! [ -d "${PMWEB_GIT_SRC_DIR}" ]; then
    echo >&2 "-- creating the folder ${PMWEB_GIT_SRC_DIR}"
    mkdir -p "${PMWEB_GIT_SRC_DIR}/"
fi
if ! [ -d "${PMWEB_GIT_SRC_INTERFACE_DIR}" ]; then
    echo >&2 "-- creating the folder ${PMWEB_GIT_SRC_INTERFACE_DIR}"
    mkdir -p "${PMWEB_GIT_SRC_INTERFACE_DIR}/"
fi
if ! [ -d "${PMWEB_GIT_SRC_INTERFACE_C_DIR}" ]; then
    echo >&2 "-- creating the folder ${PMWEB_GIT_SRC_INTERFACE_C_DIR}"
    mkdir -p "${PMWEB_GIT_SRC_INTERFACE_C_DIR}/"
fi
if ! [ -d "${PMWEB_GIT_SRC_INTERFACE_CPP_DIR}" ]; then
    echo >&2 "-- creating the folder ${PMWEB_GIT_SRC_INTERFACE_CPP_DIR}"
    mkdir -p "${PMWEB_GIT_SRC_INTERFACE_CPP_DIR}/"
fi
if ! [ -d "${PMWEB_GIT_SRC_INTERFACE_Fortran_DIR}" ]; then
    echo >&2 "-- creating the folder ${PMWEB_GIT_SRC_INTERFACE_Fortran_DIR}"
    mkdir -p "${PMWEB_GIT_SRC_INTERFACE_Fortran_DIR}/"
fi
if ! [ -d "${PMWEB_GIT_SRC_INTERFACE_MATLAB_DIR}" ]; then
    echo >&2 "-- creating the folder ${PMWEB_GIT_SRC_INTERFACE_MATLAB_DIR}"
    mkdir -p "${PMWEB_GIT_SRC_INTERFACE_MATLAB_DIR}/"
fi
if ! [ -d "${PMWEB_GIT_SRC_INTERFACE_Python_DIR}" ]; then
    echo >&2 "-- creating the folder ${PMWEB_GIT_SRC_INTERFACE_Python_DIR}"
    mkdir -p "${PMWEB_GIT_SRC_INTERFACE_Python_DIR}/"
fi
if ! [ -d "${PMWEB_GIT_SRC_INTERFACE_Python_SETUP_DIR}" ]; then
    echo >&2 "-- creating the folder ${PMWEB_GIT_SRC_INTERFACE_Python_SETUP_DIR}"
    mkdir -p "${PMWEB_GIT_SRC_INTERFACE_Python_SETUP_DIR}/"
fi
if ! [ -d "${PMWEB_GIT_AUXIL_DIR}" ]; then
    echo >&2 "-- creating the folder: ${PMWEB_GIT_AUXIL_DIR}"
    mkdir -p "${PMWEB_GIT_AUXIL_DIR}"
fi
if ! [ -d "${PMWEB_GIT_EXAM_DIR}" ]; then
    echo >&2 "-- creating the folder: ${PMWEB_GIT_EXAM_DIR}"
    mkdir -p "${PMWEB_GIT_EXAM_DIR}"
fi

####################################################################################################################################
#### include the LICENSE agreement file
####################################################################################################################################

thisFile="LICENSE.md"
echo >&2
echo >&2 "-- copying the ParaMonte ${thisFile} file,"
echo >&2 "-- from: ${ParaMonte_GIT_DIR}/${thisFile}"
echo >&2 "--   to: ${PMWEB_GIT_DIR}/${thisFile}"
echo >&2
cp -R "${ParaMonte_GIT_DIR}/${thisFile}" "${PMWEB_GIT_DIR}/${thisFile}"

# include the ACKNOWLEDGMENT.md agreement file

thisFile="ACKNOWLEDGMENT.md"
echo >&2
echo >&2 "-- copying the ParaMonte ${thisFile} file,"
echo >&2 "-- from: ${ParaMonte_GIT_DIR}/${thisFile}"
echo >&2 "--   to: ${PMWEB_GIT_DIR}/${thisFile}"
echo >&2
cp -R "${ParaMonte_GIT_DIR}/${thisFile}" "${PMWEB_GIT_DIR}/${thisFile}"

# include the shields.html file to the _include folder

thisFile="shields.html"
echo >&2
echo >&2 "-- copying the ParaMonte ${thisFile} file,"
echo >&2 "-- from: ${ParaMonte_GIT_DIR}/${thisFile}"
echo >&2 "--   to: ${PMWEB_GIT_DIR}/${thisFile}"
echo >&2
cp -R "${ParaMonte_GIT_DIR}/auxil/${thisFile}" "${PMWEB_GIT_AUXIL_DIR}/${thisFile}"

####################################################################################################################################
#### copy example files
####################################################################################################################################

echo >&2
echo >&2 "-- copying the ParaMonte example files,"
echo >&2 "-- from: $ParaMonte_GIT_EXAM_DIR"
echo >&2 "-- to: $PMWEB_GIT_EXAM_DIR/"
echo >&2
cp -R "${ParaMonte_GIT_EXAM_DIR}/mvn" "${PMWEB_GIT_EXAM_DIR}/"
cp -R "${ParaMonte_GIT_EXAM_DIR}"/main.* "${PMWEB_GIT_EXAM_DIR}/"

#### change the name of the C++ directory to CPP (liquid complains about this)

mv "${PMWEB_GIT_EXAM_DIR}/mvn/C++" "${PMWEB_GIT_EXAM_DIR}/mvn/CPP"

#### copy installation usage files

echo >&2
echo >&2 "-- copying the ParaMonte build-script usage files,"
echo >&2 "-- from: ${ParaMonte_GIT_DIR}/install.*.usage.txt"
echo >&2 "-- to: $PMWEB_GIT_DIR/"
echo >&2
cp "${ParaMonte_GIT_DIR}"/install.*.usage.txt "${PMWEB_GIT_DIR}/"

#### copy C/C++/Fortran interface files

echo >&2
echo >&2 "-- copying the ParaMonte interface files,"
echo >&2 "-- from: ${ParaMonte_GIT_DIR}/src/interface/..."
echo >&2 "-- to: ${PMWEB_GIT_SRC_INTERFACE_DIR}/"
echo >&2
cp "${ParaMonte_GIT_DIR}/src/interface/C/paramonte.h" "${PMWEB_GIT_SRC_INTERFACE_C_DIR}/"
cp "${ParaMonte_GIT_DIR}/src/interface/C++/paramonte.hpp" "${PMWEB_GIT_SRC_INTERFACE_CPP_DIR}/"
cp "${ParaMonte_GIT_DIR}/src/interface/Fortran/paramonte.f90" "${PMWEB_GIT_SRC_INTERFACE_Fortran_DIR}/"

####################################################################################################################################
#### copy version history files
####################################################################################################################################

thisFile="CHANGES.md"

# copy ParaMonte MATLAB version history file

echo >&2
echo >&2 "-- copying the ParaMonte MATLAB version history file,"
echo >&2 "-- from: ${PMWEB_GIT_SRC_INTERFACE_MATLAB_DIR}/${thisFile}"
echo >&2 "-- to: ${PMWEB_GIT_DIR}/"
echo >&2
cp "${ParaMonte_GIT_DIR}/src/interface/MATLAB/${thisFile}" "${PMWEB_GIT_SRC_INTERFACE_MATLAB_DIR}/"

# copy ParaMonte kernel version history file

echo >&2
echo >&2 "-- copying the ParaMonte kernel version history file,"
echo >&2 "-- from: ${ParaMonte_GIT_DIR}/${thisFile}"
echo >&2 "-- to: ${PMWEB_GIT_DIR}/"
echo >&2
cp "${ParaMonte_GIT_DIR}/${thisFile}" "${PMWEB_GIT_DIR}/"

# copy ParaMonte Python version history file

echo >&2
echo >&2 "-- copying the ParaMonte Python version history file,"
echo >&2 "-- from: ${PMWEB_GIT_SRC_INTERFACE_Python_DIR}/${thisFile}"
echo >&2 "-- to: ${PMWEB_GIT_DIR}/"
echo >&2
cp "${ParaMonte_GIT_DIR}/src/interface/Python/${thisFile}" "${PMWEB_GIT_SRC_INTERFACE_Python_DIR}/"

####################################################################################################################################
# copy MATLAB mlx files
####################################################################################################################################

ParaMonteX_GIT_DIR="../../paramontex"
ParaMonteX_GIT_MATLAB_DIR="${ParaMonteX_GIT_DIR}/MATLAB"
ParaMonteX_GIT_MATLAB_MLX_DIR="${ParaMonteX_GIT_MATLAB_DIR}/mlx"

# get the MATLAB mlx file names

mlxFileNameExt=".html"
mlxFileNameListPathList="../_data/general_matlab_live_scripts.yml"
mlxFileNameListPathList+=":../_data/paradram_matlab_live_scripts.yml"
mlxFileNameListPathList+=":../_data/regression_matlab_live_scripts.yml"

# read the file contents

if [ "${MLX_ENABLED}" = "true" ] || [ "${ALL_ENABLED}" = "true" ]; then

    # read the sc file contents to be added to the mlx html files below.

    scContents=$(<"${PMWEB_INCLUDE_DIR}"/sc.html)

    # loop over the file list

    for mlxFileNameListPath in ${mlxFileNameListPathList//:/ }; do
        while IFS="" read -r line || [ -n "$line" ]
        do

            # printf '%s\n' "$line"
          
            mlxFileName="$( echo ${line#- name: } )"
            #mlxFilePath="${ParaMonteX_GIT_MATLAB_MLX_DIR}/${mlxFileName}/${mlxFileName}".html
            mlxFilePath=$(find "${ParaMonteX_GIT_MATLAB_MLX_DIR}" -name "${mlxFileName}.html")
            mlxFileDest="${PMWEB_NOTE_EXAMPLES_MATLAB_MLX_DIR}/${mlxFileName}".html

            if [ -f "${mlxFilePath}" ]; then

                # copy the MATLAB mlx html file

                echo >&2
                echo >&2 "-- copying MATLAB mlx html file,"
                echo >&2 "-- from: ${mlxFilePath}"
                echo >&2 "-- to: ${mlxFileDest}"
                echo >&2
                cp -R "${mlxFilePath}" "${mlxFileDest}" || {
                    echo >&2
                    echo >&2 "-- The copy action failed."
                    echo >&2 "-- Gracefully exiting..."
                    echo >&2
                    exit 1
                }

                # remove the last line of the html file. ATTN: THE LAST LINE MUST BE "--></body></html>"

                sed -i '$d' "${mlxFileDest}" || {
                    echo >&2
                    echo >&2 "-- The sed action failed."
                    echo >&2 "-- Gracefully exiting..."
                    echo >&2
                    exit 1
                }

                # add the contents of sc.html to the mlx.html files

                echo "-->" >> "${mlxFileDest}"
                echo "${scContents}</body></html>" >> "${mlxFileDest}"

            else

                echo >&2
                echo >&2 "-- FATAL ERROR - file not found: ${mlxFilePath}"
                echo >&2
                exit 1

            fi

        done < "${mlxFileNameListPath}"

    done

fi

####################################################################################################################################

cd $pmweb