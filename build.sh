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

caller_name="paramonted"; source ./build.init.sh

echo >&2 "${pmnote} The ParaMonte root directory: ${paramonte_dir}"

if ! [ "${paramonte_doc_dir}" = "${source_dir}" ]; then
    echo >&2
    echo >&2 "${pmfatal} Failed to build the ParaMonte library doxygen documentation."
    echo >&2 "${pmfatal} Failed to source the build.init.sh script in the root directory of documentation."
    echo >&2 "${pmfatal} exiting..."
    echo >&2
    exit 1
fi

####
#### build and install the library documentations.
####

for i in {1..2}
do

    #### Build the ParaMonte Doxygen libraries.

    cd "${paramonte_doc_gen_dir}" && ./build.sh

    #### Build the ParaMonte generic library.

    cd "${paramonte_doc_dox_dir}" && ./build.sh --lang c --dryrun
    cd "${paramonte_doc_dox_dir}" && ./build.sh --lang cpp --dryrun
    cd "${paramonte_doc_dox_dir}" && ./build.sh --lang fortran --dryrun

done

####
#### push the output docs to the server.
####

#cd "${paramonte_doc_out_dir}" && git add --all && git commit -m"latest documentation builds." && git push --all