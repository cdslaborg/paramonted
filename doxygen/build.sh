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

caller_name="Doxygen"; source ../build.init.sh
source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
export doxygen_src_dir="${source_dir}"
cd "${source_dir}"

echo >&2 "${pmnote} The ParaMonte root directory: ${paramonte_dir}"

if [ "${paramonte_doc_dir}" = "" ]; then
    echo >&2
    echo >&2 "${pmfatal} Failed to build the ParaMonte library doxygen documentation."
    echo >&2 "${pmfatal} Failed to source the build.init.sh script in the root directory of documentation."
    echo >&2 "${pmfatal} exiting..."
    echo >&2
    exit 1
fi

# set the build configuration.

unset bdir
unset ddir
unset build
unset fresh
unset bdir_flag
unset ddir_flag
unset is_latest_version
unset paramonte_bld_pkg_dir
unset paramonte_lang_version
dryrun_enabled="false"
checking="checking"
lang="fortran"
lib="lib"
mem="mem"
par="serial"

# Fetch the user options.

arg_list=("$@")
while [ "$1" != "" ]; do
    case $1 in
        --fc )          shift
                        fc="$1"
                        if [[ "$1" =~ .*"ifort".* ]]; then
                            csid="intel"
                        elif [[ "$1" =~ .*"gfortran".* ]]; then
                            csid="gnu"
                        else
                            csid="$1"
                            csid="${csid##*/}"
                        fi
                        ;;
        --dryrun )      dryrun_enabled="true"
                        ;;
        --bdir )        shift
                        bdir="$1"
                        ;;
        --ddir )        shift
                        ddir="$1"
                        ;;
        --checking )    shift
                        checking="$1"
                        ;;
        --lang )        shift
                        lang="$1"
                        ;;
        --build )       shift
                        build="$1"
                        ;;
        --lib )         shift
                        lib="$1"
                        ;;
        --mem )         shift
                        mem="$1"
                        ;;
        --par )         shift
                        verifyArgNotKey "$1" --par
                        verifyArgNotEmpty "$1" --par
                        par="$1"
                        ;;
        --fresh )       shift
                        fresh="$1"
                        ;;
        --latest )      is_latest_version="true"
                        arg_list=("${arg_list[@]/--latest/}")
                        ;;
        -h | --help )   usage
                        echo >&2 ""
                        echo >&2 "${pmnote} This documentation build Bash script accepts all arguments that"
                        echo >&2 "${pmnote} the `install.sh` in the root directory of the ParaMonte library accepts."
                        echo >&2 "${pmnote} "
                        echo >&2 "${pmnote} Example build command:"
                        echo >&2 "${pmnote} "
                        echo >&2 "${pmnote}     ./build.sh --build release -exam ./example/runParaMonteExample.tmp -X true --bench false --fc gfortran"
                        echo >&2 ""
                        exit 0
    esac
    shift
done

####
#### Set the current ParaMonte version based on the target language.
####

export paramonte_lang="${lang}"

if  [ "${paramonte_lang_version}" = "" ]; then
    paramonte_lang_version="paramonte_version_${lang}"
    export paramonte_lang_version=${!paramonte_lang_version}
fi
temp="${IFS}"; IFS="."
read -r -a tmparr <<< "${paramonte_lang_version}"; export paramonte_lang_version_major="${tmparr[0]}"
IFS="${temp}"

####
#### Clean up space.
####

export paramonte_doc_out_lang_dir="${paramonte_doc_out_dir}/${lang}/${paramonte_lang_version_major}"

if [[ "${fresh}" =~ .*"all".* ||  "${fresh}" =~ .*"doxycurrent".* ]]; then
    if [ -d "${paramonte_doc_out_lang_dir}" ]; then
        echo >&2 "${pmnote} Cleaning up the existing Doxygen html files at: ${paramonte_doc_out_lang_dir}"
        rm -rf "${paramonte_doc_out_lang_dir}"
    fi
fi

if [[ "${fresh}" =~ .*"html".* ]]; then
    if [ -d "${paramonte_doc_out_lang_dir}" ]; then
        echo >&2 "${pmnote} Cleaning up the existing Doxygen html files at: ${paramonte_doc_out_lang_dir}"
        rm -rf "${paramonte_doc_out_lang_dir}"
    fi
fi

if ! [ -d "${paramonte_doc_out_lang_dir}" ]; then
    mkdir -p "${paramonte_doc_out_lang_dir}"
fi

####
#### Copy the background image to the html build folder.
####

# The following explicit copy is required because doxygen is incapable
# of automatically copying images that are included via non-doxygen (HTML) syntax.

cp "${paramonte_doc_dox_dir}"/img/"${lang}"/*.* "${paramonte_doc_out_lang_dir}"/

if [ "${build}" = "" ]; then
    build="native"
    echo >&2 "${pmnote} The default ParaMonte build: ${build}"
fi

####
#### Set the default build and install directories of the ParaMonte library.
####

if [ "${bdir}" = "" ]; then
    pathFC="$(getPathFC "${fc}")"
    csid=$(getCSID "${pathFC}")
    csvs=$(getCSVS "${pathFC}" "${csid}")
    bdir="${paramonte_doc_dox_dir}/bld/${os}/${arch}/${csid}/${csvs}/${build}/${lib}/${mem}/${par}/${lang}/${checking}"
   #bdir="${paramonte_doc_dox_dir}/bld/${csid}/${build}"
    echo >&2 "${pmnote} The default ParaMonte library build directory: ${bdir}"
    #bdir_flag="--bdir ${bdir}"
fi

if [ "${ddir}" = "" ]; then
    ddir="${paramonte_doc_dox_dir}/bin"
    echo >&2 "${pmnote} The default ParaMonte binary install directory: ${ddir}"
    ddir_flag="--ddir ${ddir}"
fi

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Call the ParaMonte install script.
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

if [ "${dryrun_enabled}" != "true" ]; then
    echo >&2 "${pmnote}"
    echo >&2 "${pmnote} Calling the ParaMonte script as"
    echo >&2 "${pmnote}"
    echo >&2 "${pmnote}     ./install.sh ${arg_list[@]} ${bdir_flag} ${ddir_flag}"
    echo >&2 "${pmnote}"
    cd "${paramonte_dir}" && \
    ./install.sh --bdir "${bdir}" --ddir "${ddir}" "${arg_list[@]}" && \
    cd "${paramonte_doc_dox_dir}" || {
        echo >&2
        echo >&2 "${pmfatal} Failed to build the ParaMonte library for Doxygen examples. exiting..."
        echo >&2
        exit 1
    }
fi

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Build the documentation. The env variable paramonte_bld_dir is used in the Doxygen config file.
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

paramonte_bld_dir="${bdir}"; export paramonte_bld_dir
paramonte_bld_pkg_dir="${paramonte_bld_dir}/pkg"; export paramonte_bld_pkg_dir
if [ -d "${paramonte_bld_pkg_dir}" ]; then
    echo >&2 "${pmnote} The ParaMonte Doxygen build package directory: ${paramonte_bld_pkg_dir}"
else
    echo >&2 "${pmwarn} Failed to detect the ParaMonte Doxygen build package directory: ${paramonte_bld_pkg_dir}"
    echo >&2 "${pmwarn} ParaMonte examples and benchmarks will not show up in the documentation."
    answerNotGiven=true
    while [ "${answerNotGiven}" = "true" ]; do
        read -p "${pmwarn} Do you still want to proceed with building the documentation (y/n)? " answer
        if [[ $answer == [yY] || $answer == [yY][eE][sS] ]]; then answerNotGiven=false; fi
        if [[ $answer == [nN] || $answer == [nN][oO] ]]; then
            echo >&2 "${pmwarn} Gracefully exiting the ParaMonte library documentation build process..."
            exit 0
        fi
        if [ "${answerNotGiven}" = "true" ]; then echo >&2 "-- ${build_name} - please enter either y or n"; fi
    done
fi

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# XML: Set up the Doxygen layout to insert documentation history tab.
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#### Loop over all existing generated documentation folders to fetch the version numbers.

xml_entries=$'\n'
temp="${IFS}"; IFS=" "
is_latest_version_def="true"
paramonte_doc_out_dir_list="$(cd "${paramonte_doc_out_dir}" && echo */)"
paramonte_doc_out_dir_list=(${paramonte_doc_out_dir_list}) # array.

for (( idoc=0 ; idoc<${#paramonte_doc_out_dir_list[@]} ; idoc++ )) ; do

    #### Remove the final forward slash from the doc name.

    doc_dir="${paramonte_doc_out_dir_list[$idoc]}"
    doc_name="${doc_dir%%/}"
    paramonte_doc_out_dir_list[$idoc]="${doc_name}"
    doc_path="${paramonte_doc_out_dir}/${doc_name}"

    # echo
    # echo
    # echo "$doc_path"
    # echo
    # echo

    #### Add a documentation folder to the version history only if it is not the old original ParaMonte library documentation named `notes`.

    #if [[ "${doc_name}" =~ ^[0-9]+$ ]]; then # check if folder is an unsigned integer.
    if ! [ "${doc_name}" = "notes" ]; then

        #### The doc history is obtained by listing the language folder for the past versions.

        doc_version_list="$(cd "${doc_path}" && echo */)"

        #### Include the language documentation in the current docs, only if the folder is non-empty.

        if ! [ "${doc_version_list}" == "" ];then

            #### Define documentation brands for inclusion in XML.

            doc_brand=""
            if [ "${doc_name}" = "c" ]; then
                doc_brand="C"
            elif [ "${doc_name}" = "cpp" ]; then
                doc_brand="C++"
            elif [ "${doc_name}" = "fortran" ]; then
                doc_brand="Fortran"
            elif [ "${doc_name}" = "matlab" ]; then
                doc_brand="MATLAB"
            elif [ "${doc_name}" = "python" ]; then
                doc_brand="Python"
            elif [ "${doc_name}" = "r" ]; then
                doc_brand="R"
            elif [ "${doc_name}" = "generic" ]; then
                doc_brand="Generic"
            elif ! [ "${doc_name}" = "codecov" ]; then
                echo >&2
                echo >&2 "${pmfatal} Unrecognized ParaMonte documentation folder detected: \"${doc_path}\""
                echo >&2
                exit 1
            fi

            if ! [ "${doc_brand}" = "" ]; then

                #### Make array.

                doc_version_list=(${doc_version_list})

                #### Remove final forward slash from values and form XML entries.

                xml_entries="${xml_entries}    <tab type='usergroup' visible='yes' title='${doc_brand}' intro='${doc_brand} Documentation Version History'>"$'\n'

                for (( iver=${#doc_version_list[@]}-1 ; iver>=0 ; iver-- )) ; do

                    #### Remove the final forward slash from the doc version.

                    version="${doc_version_list[$iver]}"
                    version="${version%%/}"
                    doc_version_list[$iver]="${version}"
                    xml_entries="${xml_entries}        <tab type='user' url='../../${doc_name}/${version}/index.html' title='${version}' intro=''/>"$'\n'

                    # Only for the current target documentation that we are generating,
                    # check if the current library version is also the latest in the folder.
                    if [ "${lang}" = "${doc_name}" ]; then
                        if ! [ "${version}" = "latest" ]; then
                            if [[ "${paramonte_lang_version}" < "${version}" ]]; then
                                is_latest_version_def="false"
                            fi
                        fi
                    fi

                done
                xml_entries="${xml_entries}    </tab>"$'\n'

                echo "${pmnote} All detected ParaMonte ${doc_brand} documentation versions: ${doc_version_list[@]}"

            fi

        fi

    fi

done
xml_entries="${xml_entries}"$'\n'
IFS="${temp}"

if [ "${is_latest_version}" = "" ]; then
    is_latest_version="${is_latest_version_def}"
fi

#### Add the XML version entries to the current Doxygen layout.

while IFS='' read -r a; do
    echo "${a//____DOC_HISTORY_PLACE_HOLDER/${xml_entries}}"
done < "layout.template.xml" > "layout.${lang}.xml"

echo "${pmnote} is_latest_version_def? ${is_latest_version_def}"
echo "${pmnote} ParaMonte ${lang} documentation versions XML entries:"
echo "${pmnote} ${xml_entries}"

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
# Call Doxygen.
#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

#doxybin=doxygen
doxybin="/home/amir/git/doxygen/build/bin/doxygen"
#doxybin="../../build/doxygen-Release_1_9_5/doxygen-1.9.5/bin/doxygen"

unset paramonte_optimize_for_c
unset paramonte_optimize_for_fortran
unset paramonte_optimize_for_java
paramonte_project_name="ParaMonte"
if [ "${lang}" = "c" ]; then
    export paramonte_optimize_for_c="YES"
    export paramonte_project_name="${paramonte_project_name} C"
elif [ "${lang}" = "cpp" ]; then
    export paramonte_optimize_for_c="YES"
    export paramonte_project_name="${paramonte_project_name} C++"
elif [ "${lang}" = "fortran" ]; then
    export paramonte_optimize_for_fortran="YES"
    export paramonte_project_name="${paramonte_project_name} Fortran"
elif [ "${lang}" = "matlab" ]; then
    export paramonte_optimize_for_c="YES"
    export paramonte_project_name="${paramonte_project_name} MATLAB"
elif [ "${lang}" = "python" ]; then
    export paramonte_project_name="${paramonte_project_name} Python"
elif [ "${lang}" = "java" ]; then
    export paramonte_project_name="${paramonte_project_name} Java"
    export paramonte_optimize_for_java="YES"
else
    echo >&2 "${pmfatal} Unrecognized ParaMonte library language: ${lang}"
    exit 1
fi

echo >&2 "${pmnote} paramonte_lang_version=${paramonte_lang_version}"
echo >&2 "${pmnote} Changing the directory to: ${paramonte_doc_dox_dir}"
#cd "${paramonte_doc_dox_dir}" && valgrind --leak-check=full ../../build/doxygen/build/bin/doxygen "${paramonte_doc_dox_dir}/config.txt" || {
cd "${paramonte_doc_dox_dir}" && "${doxybin}" "${paramonte_doc_dox_dir}/config.txt" || {
    echo >&2
    echo >&2 "${pmfatal} Failed to build the ParaMonte::${lang} Doxygen library. exiting..."
    echo >&2
    exit 1
}

####
#### Copy docs to the latest version folder if requested.
####

if [ "${is_latest_version}" = "true" ]; then
    paramonte_doxygen_out_latest_dir="${paramonte_doc_out_lang_dir}"/../latest
    if [ -d "${paramonte_doxygen_out_latest_dir}" ]; then
        rm -rf "${paramonte_doxygen_out_latest_dir}"
    fi
    mkdir -p "${paramonte_doxygen_out_latest_dir}"
    cp -arf "${paramonte_doc_out_lang_dir}"/* "${paramonte_doxygen_out_latest_dir}"
fi

####
#### Copy the required generic doc files from the ParaMonte Fortran directory to the corresponding generic docs source folder.
####

if [ "${lang}" = "fortran" ]; then
    destin="${paramonte_doc_gen_dir}/${paramonte_version_major}/_includes"
    origin="${bdir}/pkg/example/pm_sampling/attributes"
    if [ -d "${destin}" ] && [ -d "${origin}" ]; then
        cp -arf "${origin}"/*.md "${destin}"/
    else
        echo >&2
        echo >&2 "${pmwarn} Failed to find one of the following origin and destin folders:"
        echo >&2 "${pmwarn} "
        echo >&2 "${pmwarn}     origin=\"${origin}\""
        echo >&2 "${pmwarn}     destin=\"${destin}\""
        echo >&2 "${pmwarn} "
        echo >&2 "${pmwarn} Some functionalities of the generic documentation may not work properly."
        echo >&2 "${pmwarn} Skipping the generic documentation source file copies..."
        echo >&2
    fi
fi
