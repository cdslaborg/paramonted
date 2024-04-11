#!/bin/bash
####################################################################################################################################
####################################################################################################################################
####                                                                                                                            ####
####    ParaMonte: Parallel Monte Carlo and Machine Learning Library.                                                           ####
####                                                                                                                            ####
####    Copyright (C) 2012-present, The Computational Data Science Lab                                                          ####
####                                                                                                                            ####
####    This file is part of the ParaMonte library.                                                                             ####
####                                                                                                                            ####
####    LICENSE                                                                                                                 ####
####                                                                                                                            ####
####       https://github.com/cdslaborg/paramonte/blob/main/LICENSE.md                                                          ####
####                                                                                                                            ####
####################################################################################################################################
####################################################################################################################################

source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd "${source_dir}"

lang="generic"
caller_name="${lang}"; source ../build.init.sh

echo >&2 "${pmnote} The ParaMonte root directory: ${paramonte_dir}"

if [ "${paramonte_doc_dir}" = "" ] || [ "${paramonte_doc_gen_dir}" = "" ] || [ "${paramonte_doc_out_dir}" = "" ]; then
    echo >&2
    echo >&2 "${pmfatal} Failed to build the ParaMonte library doxygen documentation."
    echo >&2 "${pmfatal} Failed to source the build.init.sh script in the root directory of documentation."
    echo >&2 "${pmfatal} exiting..."
    echo >&2
    exit 1
fi

####
#### set the build configuration.
####

unset paramonte_doc_gen_dir_list

# Fetch the user options.

while [ "$1" != "" ]; do
    case $1 in
        --version )     shift
                        paramonte_doc_gen_dir_list="$1"
                        ;;
        -h | --help )   echo >&2 ""
                        echo >&2 "${pmnote} This documentation build Bash script accepts only one optiona argument: --version"
                        echo >&2 "${pmnote} Example build command:"
                        echo >&2 "${pmnote} "
                        echo >&2 "${pmnote}     ./build.sh"
                        echo >&2 "${pmnote}     ./build.sh --version 1"
                        echo >&2 "${pmnote}     ./build.sh --version \"1;2\""
                        echo >&2 "${pmnote}     ./build.sh --version \"1;2\""
                        echo >&2 "${pmnote} "
                        echo >&2 "${pmnote} The value specified for --version can be any folder in the generic documentation folder."
                        echo >&2 ""
                        exit 0
    esac
    shift
done

paramonte_doc_out_lang_dir="${paramonte_doc_out_dir}/${lang}"
paramonte_doc_out_notes_dir="${paramonte_doc_out_dir}/notes"

temp="${IFS}"; IFS=" "
if [ "${paramonte_doc_gen_dir_list}" = "" ]; then
    paramonte_doc_gen_dir_list="$(cd "${paramonte_doc_gen_dir}" && echo */)"
    paramonte_doc_gen_dir_list=(${paramonte_doc_gen_dir_list}) # array.
else
    paramonte_doc_gen_dir_list=($(echo "${paramonte_doc_gen_dir_list//;/ }")) # assumes ; as the separator and converts it to blank.
fi
paramonte_doc_gen_dir_list+=("notes")
paramonte_doc_gen_dir_list+=("latest")
echo >&2 "${pmnote} The ParaMonte generic documentation list to build: ${paramonte_doc_gen_dir_list[@]}"

####
#### Find the latest version.
####

paramonte_lang_version_major_latest="1"
for (( idoc=0 ; idoc<${#paramonte_doc_gen_dir_list[@]} ; idoc++ )) ; do
    #### Remove the final forward slash from the doc name.
    doc_dir="${paramonte_doc_gen_dir_list[$idoc]}"
    doc_dir="${doc_dir%%/}"
    if [ ! "${doc_dir}" = "latest" ] && [ ! "${doc_dir}" = "notes" ]; then
        if [[ "${paramonte_lang_version_major_latest}" < "${doc_dir}" ]]; then
            paramonte_lang_version_major_latest="${doc_dir}"
        fi
    fi
done
echo >&2 "${pmnote} The latest ParaMonte generic documentation version: ${paramonte_lang_version_major_latest}"

####
#### Build the documentations.
####

for (( idoc=0 ; idoc<${#paramonte_doc_gen_dir_list[@]} ; idoc++ )) ; do

    echo >&2 ""
    echo >&2 ""

    #### Remove the final forward slash from the doc name.

    doc_dir="${paramonte_doc_gen_dir_list[$idoc]}"
    paramonte_lang_version_major="${doc_dir%%/}"
    paramonte_doc_gen_dir_list[$idoc]="${paramonte_lang_version_major}"
    paramonte_doc_out_lang_version_dir="${paramonte_doc_out_lang_dir}/${paramonte_lang_version_major}"
    destin="${paramonte_doc_out_lang_version_dir}"

    if [ "${paramonte_lang_version_major}" = "notes" ]; then
        destin="${paramonte_doc_out_dir}/${paramonte_lang_version_major}"
        paramonte_doc_gen_version_dir="${paramonte_doc_gen_dir}/1"
        tempurl="${fullurl}/notes"
    elif [ "${paramonte_lang_version_major}" = "latest" ]; then
        paramonte_doc_gen_version_dir="${paramonte_doc_gen_dir}/${paramonte_lang_version_major_latest}"
        tempurl="${fullurl}/generic/latest"
    else
        paramonte_doc_gen_version_dir="${paramonte_doc_gen_dir}/${paramonte_lang_version_major}"
        tempurl="${fullurl}/generic/${paramonte_lang_version_major}"
    fi
    origin="${paramonte_doc_gen_version_dir}/_site"

    echo >&2 "${pmnote} The ParaMonte documentation origin directory: ${origin}"
    echo >&2 "${pmnote} The ParaMonte documentation destin directory: ${destin}"

    echo >&2 "${pmnote} Removing the origin directory: ${origin}"
    rm -rf "${origin}"

    ####
    #### Copy required source files from the ParaMonte root directory.
    ####

    if [ "${paramonte_version_major}" = "${paramonte_lang_version_major}" ]; then
        if [ -f "${paramonte_doc_gen_version_dir}/copy.sh" ]; then
            echo >&2 "${pmnote} Copying the documentation files from the ParaMonte root directory..."
            cd "${paramonte_doc_gen_version_dir}" && ./copy.sh
            cd "${source_dir}"
        else
            echo >&2 "${pmwarn} The Bash script `copy.sh` for copying the documentation files from the ParaMonte root directory is missing."
            echo >&2 "${pmwarn} missing: \"${paramonte_doc_gen_version_dir}/copy.sh\""
            echo >&2 "${pmwarn} skipping potential documentation file updates..."
        fi
    fi

    ####
    #### Build the generic documentation.
    ####

    echo >&2 "${pmnote} Bundling the documentation..."
    cd "${paramonte_doc_gen_version_dir}" && bundle exec jekyll build --baseurl "${tempurl}"
    cp -arf "${paramonte_doc_gen_version_dir}/.htaccess" "${origin}/";
    cp -arf "${paramonte_doc_gen_version_dir}/.nojekyll" "${origin}/";

    if [ -d "${destin}" ]; then
        echo >&2 "${pmnote} Removing the destination folder..."
        rm -rf "${destin}"
    elif ! [ -d "${paramonte_doc_out_lang_dir}" ]; then
        echo >&2 "${pmnote} Creating the output generic documentation folder: ${paramonte_doc_out_lang_dir}"
        mkdir -p "${paramonte_doc_out_lang_dir}"
    fi
    #mkdir -p "${destin}"

    echo >&2 "${pmnote} Moving the documentation to the destination folder: \"${destin}\""
    cp -arf "${origin}" "${paramonte_doc_out_lang_dir}" && mv "${paramonte_doc_out_lang_dir}/_site" "${destin}"
    rm -rf "${origin}"

    if [ "${paramonte_lang_version_major}" = "notes" ] || [ "${paramonte_lang_version_major}" = "1" ]; then
        if [ -d "${destin}/api/python" ]; then
            echo >&2 "${pmnote} Removing the existing Python doc folder: \"${destin}/api/python\""
            rm -rf "${destin}/api/python"
        fi
        echo >&2 "${pmnote} Copying the original Python documentation to the destination folder: \"${destin}\""
        cp -arf "${paramonte_doc_gen_version_dir}/api/python" "${destin}/api"
    fi

    echo >&2 ""
    echo >&2 ""

done
IFS="${temp}"
