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

#### This file is to be called by other build scripts to set up the necessary environment variables.

working_dir="$(pwd)"
source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd "${source_dir}" && source ../../auxil/install.init.sh && cd "${working_dir}"

paramonte_doc_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
export paramonte_doc_dir

export baseurl="paramonte"
export siteurl="https://www.cdslab.org"
export fullurl="${siteurl}/${baseurl}"

paramonte_doc_dox_dir="${paramonte_doc_dir}/doxygen"
export paramonte_doc_dox_dir

paramonte_doc_gen_dir="${paramonte_doc_dir}/generic"
export paramonte_doc_gen_dir

paramonte_doc_out_dir="${paramonte_doc_dir}/${baseurl}"
export paramonte_doc_out_dir

if ! [ -d "${paramonte_doc_out_dir}" ]; then
    mkdir -p "${paramonte_doc_out_dir}"
fi

paramonte_doc_front_page="${paramonte_doc_out_dir}/index.html"

#### Add the main index.html file
echo "<html>" > "${paramonte_doc_front_page}"
echo "    <head>" >> "${paramonte_doc_front_page}"
echo "        <meta http-equiv = \"refresh\" content = \"0; url = ${fullurl}/generic/latest\" />" >> "${paramonte_doc_front_page}"
echo "    </head>" >> "${paramonte_doc_front_page}"
echo "    <body>" >> "${paramonte_doc_front_page}"
echo "        <p>Redirecting to <a href=\"${fullurl}/generic/latest\">${fullurl}/generic/latest</a></p>" >> "${paramonte_doc_front_page}"
echo "    </body>" >> "${paramonte_doc_front_page}"
echo "</html>" >> "${paramonte_doc_front_page}"