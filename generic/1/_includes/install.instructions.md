{% if include.os == "Windows" %}
    {% assign installScriptExt = "bat" %}
    {% assign installScript = "install.bat" %}
    {% assign compressedLibExt = "zip" %}
    {% assign installScriptLang = "Batch" %}
    {% assign parNoneMpi = "none/mpi" %}
    {% assign memStackHeap = "stack/heap" %}
    {% assign buildDebugRelease = "debug/release" %}
{% elsif include.os == "Darwin" or include.os == "Linux" %}
    {% assign installScriptExt = "sh" %}
    {% assign installScript = "./install.sh" %}
    {% assign compressedLibExt = "tar.gz" %}
    {% assign installScriptLang = "Bash" %}
    {% assign parNoneMpi = '"none mpi"' %}
    {% assign memStackHeap = '"stack heap"' %}
    {% assign buildDebugRelease = '"debug release"' %}
{% endif %}

There are two ways to use the ParaMonte library from C/C++/Fortran languages on {{include.os}} operating systems (OS): 

1.  **the fast way**: using the prebuilt ParaMonte libraries for {{include.os}}, or,  
1.  **the long way**: building ParaMonte from scratch on your system.  

{% if include.os == "Darwin" %}
{% include install.instructions.darwin.prereqs.md %}
{% endif %}

## Using the prebuilt ParaMonte library  

**This is the fast way**. Simply download the prebuilt ParaMonte libraries for {{include.os}} from the [release page of the ParaMonte repository on GitHub]({{site.currentRelease}}){:target="_blank"} for the configuration of your choice. If you are not familiar with the naming convention used for the ParaMonte library files, refer to the [pre-installation notes](../readme/){:target="_blank"} before continuing.  

{% if include.os == "Darwin" %}
{{site.data.alerts.important}}
If you intend to use the prebuilt libraries from the <a href="{{site.currentRelease}}" target="_blank">release page of the ParaMonte repository on GitHub</a>, <b>do NOT download these files directly from the web</b> links on the release page and <b>do NOT download the libraries by clicking directly on the links provided below</b>. We <b>strongly recommend</b> you to use the <b><code>curl</code></b> command line program to download your desired prebuilt library from the release page. To do so, first make sure you have <b><code>curl</code></b> installed on your system. If it is not installed, you can install it via <a href="https://brew.sh/" target="_blank">Homebrew</a>,
<br>
<pre>
brew install curl
</pre>
Then, copy the web-link to the prebuilt library of your interest and download it via <b><code>curl</code></b>. For example,  
<pre>
libname=libparamonte_c_darwin_x64_intel_release_shared_heap
curl -OL {{site.currentReleaseDownload}}/$libname.{{compressedLibExt}}
tar xvzf $libname.{{compressedLibExt}} && cd $libname
./build.sh && ./run.sh
</pre>
{{site.data.alerts.end}}
{% endif %}

### Using the ParaMonte library prebuilt via the Intel compiler suite  

If you still do not know which library configuration is the most appropriate for your needs, **we recommend downloading and using** the ParaMonte libraries prebuilt via the **Intel compilers** (even if you are using the GNU compilers to build your applications),  

-   for usage from the **C** programming languages:  
    {% capture libname %}libparamonte_c_{{include.os|downcase}}_x64_intel_release_shared_heap{% endcapture %}
    -   [{{libname}}]({{ site.currentReleaseDownload }}/{{libname}}.{{compressedLibExt}}) for **serial** simulations.  
    {% if include.os == "Darwin" %}
        Here are the library download, untar, building, and running commands altogether,  
        ```bash  
        libname={{libname}}
        curl -OL {{site.currentReleaseDownload}}/$libname.{{compressedLibExt}}
        tar xvzf $libname.{{compressedLibExt}} && cd $libname
        ./build.sh && ./run.sh
        ```  
    {% else %}
    -   [libparamonte_c_{{include.os|downcase}}_x64_intel_release_shared_heap_impi.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/libparamonte_c_{{include.os|downcase}}_x64_intel_release_shared_heap_impi.{{compressedLibExt}}) for **MPI-parallel** simulations via the Intel MPI library.  
    {% endif %}
-   for usage from the **C++** programming languages:  
    {% capture libname %}libparamonte_cpp_{{include.os|downcase}}_x64_intel_release_shared_heap{% endcapture %}
    -   [{{libname}}.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/{{libname}}.{{compressedLibExt}}) for **serial** simulations.  
    {% if include.os == "Darwin" %}
        Here are the library download, untar, building, and running commands altogether,  
        ```bash  
        libname={{libname}}
        curl -OL {{site.currentReleaseDownload}}/$libname.{{compressedLibExt}}
        tar xvzf $libname.{{compressedLibExt}} && cd $libname
        ./build.sh && ./run.sh
        ```  
    {% else %}
    -   [libparamonte_cpp_{{include.os|downcase}}_x64_intel_release_shared_heap_impi.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/libparamonte_cpp_{{include.os|downcase}}_x64_intel_release_shared_heap_impi.{{compressedLibExt}}) for **MPI-parallel** simulations via the Intel MPI library.  
    {% endif %}
-   for usage from the **Fortran** programming language:  
    {% capture libname %}libparamonte_fortran_{{include.os|downcase}}_x64_intel_release_shared_heap{% endcapture %}
    -   [{{libname}}.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/{{libname}}.{{compressedLibExt}}) for **serial** simulations.
    {% if include.os == "Darwin" %}
        Here are the library download, untar, building, and running commands altogether,  
        ```bash  
        libname={{libname}}
        curl -OL {{site.currentReleaseDownload}}/$libname.{{compressedLibExt}}
        tar xvzf $libname.{{compressedLibExt}} && cd $libname
        ./build.sh && ./run.sh
        ```  
    {% else %}
    -   [libparamonte_fortran_{{include.os|downcase}}_x64_intel_release_shared_heap_impi.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/libparamonte_fortran_{{include.os|downcase}}_x64_intel_release_shared_heap_impi.{{compressedLibExt}}) for **MPI-parallel** simulations via the Intel MPI library.  
    {% endif %}

{% if include.os == "Linux" or include.os == "Darwin" %}

### Using the ParaMonte library prebuilt via the GNU compiler suite  

{% if include.os == "Darwin" %}

If you want to build your applications exclusively via the GNU compilers or you want to build parallel applications (which requires the Open-MPI library), you can instead download the ParaMonte libraries prebuilt via the **GNU Compiler Collection** &#8805; {{site.gnuVersionDarwin}} and Open-MPI &#8805; {{site.openmpiVersionDarwin}} library, where applicable,  

{% elsif include.os == "Linux" %}

If you want to build your applications exclusively via GNU compilers and MPICH MPI library, you can instead download the ParaMonte libraries prebuilt via the **GNU Compiler Collection** {{site.gnuVersionLinux}} and MPICH {{site.mpichVersionLinux}} MPI library, where applicable,  

{% endif %}

- for usage from the **C** programming languages:  
    {% capture libname %}libparamonte_c_{{include.os|downcase}}_x64_gnu_release_shared_heap{% endcapture %}
    -   [{{libname}}.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/{{libname}}.{{compressedLibExt}}) for **serial** simulations.
    {% if include.os == "Darwin" %}
        Here are the library download, untar, building, and running commands altogether,  
        ```bash  
        libname={{libname}}
        curl -OL {{site.currentReleaseDownload}}/$libname.{{compressedLibExt}}
        tar xvzf $libname.{{compressedLibExt}} && cd $libname
        ./build.sh && ./run.sh
        ```  
    {% endif %}
    {% capture libname %}libparamonte_c_{{include.os|downcase}}_x64_gnu_release_shared_heap_mpich{% endcapture %}
    -   [{{libname}}.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/{{libname}}.{{compressedLibExt}}) for **MPI-parallel** simulations via the **MPICH** MPI library.  
    {% if include.os == "Darwin" %}
        Here are the library download, untar, building, and running commands altogether,  
        ```bash  
        libname={{libname}}
        curl -OL {{site.currentReleaseDownload}}/$libname.{{compressedLibExt}}
        tar xvzf $libname.{{compressedLibExt}} && cd $libname
        ./build.sh && ./run.sh
        ```  
    {% endif %}
    {% capture libname %}libparamonte_c_{{include.os|downcase}}_x64_gnu_release_shared_heap_openmpi{% endcapture %}
    -   [{{libname}}.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/{{libname}}.{{compressedLibExt}}) for **MPI-parallel** simulations via the **OpenMPI** MPI library.  
    {% if include.os == "Darwin" %}
        Here are the library download, untar, building, and running commands altogether,  
        ```bash  
        libname={{libname}}
        curl -OL {{site.currentReleaseDownload}}/$libname.{{compressedLibExt}}
        tar xvzf $libname.{{compressedLibExt}} && cd $libname
        ./build.sh && ./run.sh
        ```  
    {% endif %}
- for usage from the **C++** programming languages:  
    {% capture libname %}libparamonte_cpp_{{include.os|downcase}}_x64_gnu_release_shared_heap{% endcapture %}
    -   [{{libname}}.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/{{libname}}.{{compressedLibExt}}) for **serial** simulations.
    {% if include.os == "Darwin" %}
        Here are the library download, untar, building, and running commands altogether,  
        ```bash  
        libname={{libname}}
        curl -OL {{site.currentReleaseDownload}}/$libname.{{compressedLibExt}}
        tar xvzf $libname.{{compressedLibExt}} && cd $libname
        ./build.sh && ./run.sh
        ```  
    {% endif %}
    {% capture libname %}libparamonte_cpp_{{include.os|downcase}}_x64_gnu_release_shared_heap_mpich{% endcapture %}
    -   [{{libname}}.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/{{libname}}.{{compressedLibExt}}) for **MPI-parallel** simulations via the **MPICH** MPI library.  
    {% if include.os == "Darwin" %}
        Here are the library download, untar, building, and running commands altogether,  
        ```bash  
        libname={{libname}}
        curl -OL {{site.currentReleaseDownload}}/$libname.{{compressedLibExt}}
        tar xvzf $libname.{{compressedLibExt}} && cd $libname
        ./build.sh && ./run.sh
        ```  
    {% endif %}
    {% capture libname %}libparamonte_cpp_{{include.os|downcase}}_x64_gnu_release_shared_heap_openmpi{% endcapture %}
    -   [{{libname}}.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/{{libname}}.{{compressedLibExt}}) for **MPI-parallel** simulations via the **OpenMPI** MPI library.  
    {% if include.os == "Darwin" %}
        Here are the library download, untar, building, and running commands altogether,  
        ```bash  
        libname={{libname}}
        curl -OL {{site.currentReleaseDownload}}/$libname.{{compressedLibExt}}
        tar xvzf $libname.{{compressedLibExt}} && cd $libname
        ./build.sh && ./run.sh
        ```  
    {% endif %}
- for usage from the **Fortran** programming language:  
    {% capture libname %}libparamonte_fortran_{{include.os|downcase}}_x64_gnu_release_shared_heap{% endcapture %}
    -   [{{libname}}.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/{{libname}}.{{compressedLibExt}}) for **serial** simulations.
    {% if include.os == "Darwin" %}
        Here are the library download, untar, building, and running commands altogether,  
        ```bash  
        libname={{libname}}
        curl -OL {{site.currentReleaseDownload}}/$libname.{{compressedLibExt}}
        tar xvzf $libname.{{compressedLibExt}} && cd $libname
        ./build.sh && ./run.sh
        ```  
    {% endif %}
    {% capture libname %}libparamonte_fortran_{{include.os|downcase}}_x64_gnu_release_shared_heap_mpich{% endcapture %}
    -   [{{libname}}.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/{{libname}}.{{compressedLibExt}}) for **MPI-parallel** simulations via the **MPICH** MPI library.  
    {% if include.os == "Darwin" %}
        Here are the library download, untar, building, and running commands altogether,  
        ```bash  
        libname={{libname}}
        curl -OL {{site.currentReleaseDownload}}/$libname.{{compressedLibExt}}
        tar xvzf $libname.{{compressedLibExt}} && cd $libname
        ./build.sh && ./run.sh
        ```  
    {% endif %}
    {% capture libname %}libparamonte_fortran_{{include.os|downcase}}_x64_gnu_release_shared_heap_openmpi{% endcapture %}
    -   [{{libname}}.{{compressedLibExt}}]({{ site.currentReleaseDownload }}/{{libname}}.{{compressedLibExt}}) for **MPI-parallel** simulations via the **OpenMPI** MPI library.  
    {% if include.os == "Darwin" %}
        Here are the library download, untar, building, and running commands altogether,  
        ```bash  
        libname={{libname}}
        curl -OL {{site.currentReleaseDownload}}/$libname.{{compressedLibExt}}
        tar xvzf $libname.{{compressedLibExt}} && cd $libname
        ./build.sh && ./run.sh
        ```  
    {% endif %}

{% endif %}

## Building the ParaMonte library locally on your system  

{% if include.os == "Windows" %}
    {% capture compilerInstallation %}{% endcapture %}
    {% capture theseCompilerSuites %}the Intel Parallel Studio{% endcapture %}
{% else %}
    {% capture theseCompilerSuites %}either the GNU Compiler Collection or the Intel Parallel Studio{% endcapture %}
    {% capture compilerInstallation %}, including the process of the compiler and MPI/Coarray library installations if they are missing on your system{% endcapture %}
{% endif %}

**This is the long way**. Despite the scary name, **the entire build process is super-straightforward and fully-automated{{compilerInstallation}}**. Currently, building the ParaMonte library from scratch minimally requires {{theseCompilerSuites}} installed on your system.  
{% if include.os == "Windows" %}
{{site.data.alerts.tip}}
There are ongoing efforts right now to make the fully-automated ParaMonte library builds via the GNU Compiler Collection also possible on Windows. If you need this feature, please let us know on <a href="{{site.issues}}" target="_blank">the GitHub issues page</a> to prioritize and expedite its implementation for your usage.
{{site.data.alerts.end}}
{% endif %}  
{% comment %}
The core of the ParaMonte library is in pure [2018-standard-compliant Fortran](https://books.google.com/books?id=sB1rDwAAQBAJ&newbks=1&newbks_redir=0&lpg=PP1&dq=fortran%202018&pg=PP1#v=onepage&q=fortran%202018&f=false){:target="_blank"} programming language. Hence, 
{% endcomment %}

<br>
**Steps to build the ParaMonte library on {{include.os}}:**  
<br>

{% if include.os == "Windows" %}
    {% capture intelSuite %}Intel Parallel Studio{% endcapture %}
    {% capture conditions %}.{% endcapture %}
{% elsif include.os == "Darwin" %}
    {% capture thisMpiLibrary %}the Open-MPI library, version &#8805; {{site.openmpiVersionDarwin}}{% endcapture %}
    {% capture intelSuite %}Intel Fortran Compiler{% endcapture %}
    {% capture conditions %}, if you intend to build only serial (non-parallel) applications. If you intend to build C/C++ applications, then you may also optionally download and install the Intel C/C++ compiler on your Mac separately.  {% endcapture %}
{% elsif include.os == "Linux" %}
    {% capture thisMpiLibrary %}the MPICH MPI library, version &#8805; {{site.mpichVersionLinux}}{% endcapture %}
    {% capture intelSuite %}Intel Parallel Studio{% endcapture %}
    {% capture conditions %}
    {% endcapture %}
{% endif %}

1.  {% if include.os == "Linux" or include.os == "Darwin" %}
    **(optional) Install a recent (version &#8805; {{site.gnuVersionMinimum}}) GNU Compiler collection on your system**, as well as {{thisMpiLibrary}}.  
    {% if include.os == "Darwin" or include.os == "Linux" %}
    {% include install.instructions.autoCompilerInstall.md %}
    {% endif %}
    If you intend to build Coarray-parallel applications, then you can optionally download and install the [OpenCoarrays compiler wrapper](http://www.opencoarrays.org/){:target="_blank"} on your system, or again, **you can leave this task to the ParaMonte library build script to install it for you automatically**. You can check which version of the GNU compilers, the MPI library, or OpenCoarrays `caf` compiler wrapper may be already installed on your system by trying the following commands in a Bash shell,  
    ```bash
    gcc --version
    ```  
    {% if include.os == "Darwin" %}
    ```  
    gcc (Homebrew GCC {{site.gnuVersionDarwin}}) {{site.gnuVersionDarwin}}
    Copyright (C) {{site.gnuVersionYear}} Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE
    ```  
    {% elsif include.os == "Linux" %}
    ```
    gcc (GCC) {{site.gnuVersionLinux}}
    Copyright (C) {{site.gnuVersionYear}} Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    ```  
    {% endif %}
    ```bash
    gfortran --version
    ```  
    {% if include.os == "Darwin" %}
    ```  
    GNU Fortran (Homebrew GCC {{site.gnuVersionDarwin}}) {{site.gnuVersionDarwin}}
    Copyright (C) {{site.gnuVersionYear}} Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    ```  
    {% elsif include.os == "Linux" %}
    ```
    GNU Fortran (GCC) {{site.gnuVersionLinux}}
    Copyright (C) {{site.gnuVersionYear}} Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    ```  
    {% endif %}
    ```bash
    mpiexec --version
    ```  
    {% if include.os == "Darwin" %}
    ```  
    mpiexec (OpenRTE) {{site.openmpiVersionDarwin}}

    Report bugs to http://www.open-mpi.org/community/help/
    ```  
    {% elsif include.os == "Linux" %}
    ```
    HYDRA build details:
    Version:                                 3.2
    Release Date:                            Wed Nov 11 22:06:48 CST 2015
    ```  
    {% endif %}
    ```bash
    caf --version
    ```  
    ```
    OpenCoarrays Coarray Fortran Compiler Wrapper (caf version {{site.cafVersionLinux}})
    Copyright (C) 2015-{{site.cafVersionYear}} Sourcery Institute
    Copyright (C) 2015-{{site.cafVersionYear}} Sourcery, Inc.

    OpenCoarrays comes with NO WARRANTY, to the extent permitted by law.
    You may redistribute copies of OpenCoarrays under the terms of the
    BSD 3-Clause License.  For more information about these matters, see
    the file named LICENSE that is distributed with OpenCoarrays.
    ```  
    If you know that these software already exist on your system, but the Bash terminal appears to not be able to recognize them, for example, by emitting the following message for `caf`,  
    ```
    -bash: caf: command not found
    ```  
    one potential underlying cause could be that the path to the directory of the software is not part of the Bash environmental `PATH` variable.  
    {% include tip.html content="You can leave this compiler installation step to the ParaMonte library build scripts to install required GNU compilers, as well as the MPI / OpenCoarrays parallel libraries on your system, as explained below." %}  
    {% capture initialWords %}Alternatively, you can download {% endcapture %}
    {% else %}
    {% capture initialWords %}Download {% endcapture %}
    {% endif %}
    **{{initialWords}} and install the [{{intelSuite}}](https://software.intel.com/content/www/us/en/develop/tools/oneapi/all-toolkits.html){:target="_blank"} {{site.intelVersionYear}} or newer on your system**{{conditions}} 
    {% include note.html content="The Intel Parallel Studio and compilers are available **free of charge** to all students, teachers, and open-source software developers. Most recently Intel has made its entire suite of HPC compilers freely available to everyone." %}  
    {% if include.os == "Windows" %}
    Follow the instructions [here](https://www.cdslab.org/recipes/programming/intel-parallel-studio-installation-windows/intel-parallel-studio-installation-windows){:target="_blank"} for a proper installation.  
    If the installation is done properly, you should be able to find and open the dedicated command-line interface of Intel Parallel Studio from the Windows startup menu, just as shown in the image below, with the only difference that the compiler version will be the version that you have downloaded.  
    <figure>
        <img src="https://www.cdslab.org/recipes/programming/intel-parallel-studio-installation-windows/intelCMD.png" width="300">
    </figure>
    {% elsif include.os == "Linux" or include.os == "Darwin" %}
    If the installation is done properly, you should be able to confirm the version of your Intel Fortran compiler installation by the following command in a Bash shell environment,  
    ```bash
    ifort --version
    ```  
    {% if include.os == "Darwin" %}
    ```
    ifort (IFORT) 19.1.0.216 20200306
    Copyright (C) 1985-{{site.intelVersionYear}} Intel Corporation.  All rights reserved.
    ```  
    {% elsif include.os == "Linux" %}
    ```
    ifort (IFORT) 19.1.1.217 20200306
    Copyright (C) 1985-{{site.intelVersionYear}} Intel Corporation.  All rights reserved.
    ```  
    {% endif %}
    {% endif %}

{% if include.os == "Windows" %}
    {% capture uncompressInstructions %} and unzip it via the Windows Explorer.{% endcapture %}
{% elsif include.os == "Darwin" or include.os == "Linux" %}
    {% capture uncompressInstructions %}, then open a Bash terminal, navigate the directory containing the downloaded tar file and untar it via,  
    ```bash
    tar xvzf main.{{compressedLibExt}}
    cd paramonte-main
    ```  
    {% endcapture %}  
{% endif %}
1.  **Download the [latest release of the ParaMonte source code]({{site.archive}}/main.{{compressedLibExt}}) from GitHub**{{uncompressInstructions}}

{% if include.os == "Windows" %}
1.  **Open the command-line interface of the Intel Parallel Studio** as shown in the above figure and change the directory to the folder containing the ParaMonte GitHub repository folder that you just downloaded and unzipped.  
    {{site.data.alerts.tip}}
    {% include tshoot.windows.drive.change.md %}
    {{site.data.alerts.end}}
{% endif %}

1.  **Call the {{installScriptLang}} installation script `{{installScript}}` on the command-line interface with the desired flags:** 
    {% if include.os == "Darwin" or include.os == "Linux" %}
    But before doing so, type the following command on the same Bash command line as before,  
    ```bash  
    chmod +x {{installScript}}
    ```  
    The command `chmod` ensures that the build-script has executable permission on your system.  
    {% endif %}
    **To speed up the build**, you can specify the type of library you want to build by any of the following flags:  
    ```{{installScriptLang|downcase}}
    {{installScript}} --help
    ```  
    ```text
    {% include git/install.{{installScriptExt}}.usage.txt %}
    ```  
    {{site.data.alerts.tip}}
    If you are not sure which build would be the most appropriate for your usage, we recommend the following configuration for <b>serial ParaMonte simulations</b>,
    <pre>{{installScript}} --lang LANGUAGE --build release --lib shared --mem heap --par none</pre>
    and,
    <pre>{{installScript}} --lang LANGUAGE --build release --lib shared --mem heap --par mpi</pre>
    for <b>MPI-parallel ParaMonte simulations</b>, wherein both cases, you will have to replace the word <b>LANGUAGE</b> with the programming language of your choice: <b>C</b> (to build the ParaMonte C library), <b>C++</b> (to build the ParaMonte C++ library), <b>Fortran</b> (to build the ParaMonte Fortran library), <b>MATLAB</b> (to build the ParaMonte MATLAB library), or <b>Python</b> (to build the ParaMonte Python library).  
    <br>
    {% if include.os == "Darwin" or include.os == "Linux" %}
    If you have multiple compiler suites (e.g., both Intel and GNU compilers) installed on your system and you wish to use one over the other to build the ParaMonte library, you can also specify the <b><code>-s</code></b> or <b><code>--compiler_suite</code></b> flag on the command line. For example, to build the library via the Intel compilers,  
    <pre>{{installScript}} --lang LANGUAGE --build release --lib shared --mem heap --par none -s intel</pre>
    or, to build the library via the GNU compilers,  
    <pre>{{installScript}} --lang LANGUAGE --build release --lib shared --mem heap --par none -s gnu</pre>
    {% endif %}
    {{site.data.alerts.end}}
    For example, to build the ParaMonte Python library in release mode for both serial and parallel applications, try,  
    ```text
    {{installScript}} --lang python --build release --par {{parNoneMpi}}
    ```  
    or, to build the ParaMonte MATLAB library in release mode for both serial and parallel applications, try,  
    ```text
    {{installScript}} --lang matlab --build release --par {{parNoneMpi}}
    ```  
    or, to build shared ParaMonte C/C++ libraries in release mode for both serial and MPI-parallel applications, try,  
    ```text
    {{installScript}} --lang C --lib shared --mem heap --par {{parNoneMpi}} --build release
    ```  
    or, to build a static ParaMonte Fortran library in both release and debug modes, with Coarray shared-memory parallelism enabled, for both heap and stack memory allocations, try,  
    ```text
    {{installScript}} --lang Fortran --lib static --par cafshared --mem {{memStackHeap}} --build {{buildDebugRelease}}
    ```  
    or, to build the **ParaMonte MatDRAM MATLAB library**, try,  
    ```text
    {{installScript}} --matdram
    ```  
    {% if include.os == "Windows" %}
    {% include important.html content='Note that multiple values specified for a build flag are always separated by a forward-slash `/` character, as in the examples above.' %}  
    {% elsif include.os == "Darwin" or include.os == "Linux" %}
    {% include important.html content='Note that multiple values specified for a build flag values are always separated by a white-space character and are enclosed together with quotation marks (""), as in the examples above.' %}  
    {% if include.os == "Darwin" %}
    {% include note.html content='The parallel builds of the ParaMonte library via the Intel compilers are currently not supported since the Intel MPI library currently does not support macOS.' %}  
    {% endif %}
    {{site.data.alerts.tip}}
    By default, <b>if you have both GNU and Intel compiler suites installed on your system</b>, the ParaMonte build scripts will automatically build the library via the Intel compilers. To override this default behavior and build the library via the GNU compilers, you can specify either the <b><code>-s gnu</code></b> or <b><code>--compiler_suite gnu</code></b> build flag when calling the build script. For example, to build the ParaMonte C/C++ library in release mode as a shared library for both serial and MPI-parallel applications via the GNU compilers, try,  
    <pre>
    {{installScript}} --lang C --lib shared --mem heap --par {{parNoneMpi}} --build release -s gnu
    </pre>
    {{site.data.alerts.end}}
    {% endif %}
    You can also simply try,  
    ```text  
    {{installScript}}
    ```  
    to build the ParaMonte library for all possible configurations for all supported languages.  
    {{site.data.alerts.warning}}
    Calling the <b><code>{{installScript}}</code></b> script with no flags will build the entire ParaMonte library for all three build modes (
    <b><code>release</code></b>, 
    <b><code>testing</code></b>, 
    <b><code>debug</code></b>
    ) for all interface languages that are currently supported (
    <b><code>C</code></b>, 
    <b><code>C++</code></b>, 
    <b><code>Fortran</code></b>, 
    <b><code>MATLAB</code></b>, 
    <b><code>Python</code></b>
    , ...
    ) for all parallelization modes (
    <b><code>serial</code></b>, 
    <b><code>MPI</code></b>, 
    <b><code>cafsingle</code></b>, 
    <b><code>cafshared</code></b>
    {% if installScriptExt == "sh" %}
    , <b><code>cafdistributed</code></b>
    {% endif %}
    ) for the two types of memory allocations (
    <b><code>stack</code></b>, 
    <b><code>heap</code></b>
    ) for the two different library types (
    <b><code>static</code></b>, 
    <b><code>shared</code></b>
    ). Depending on your system specifications, this can be a very lengthy process, typically taking a few hours or more to finish.
    {{site.data.alerts.end}}
    {% include note.html content="
    If you'd like to see a build flag that is not currently provided in the above list of flags, (for example, the type of or the method of linking against the compiler libraries), please [let us know](../../overview/preface/#who-are-the-paramonte-authors-and-developers) and we will try to add the requested features to the installation scripts in a new release of the ParaMonte library.  
    " %}  
    The `{{installScript}}` script initiates the build process and generates a folder named `build` in the root directory of the ParaMonte repository which will contain all build files. The final library files together with the example scripts will be installed in a separate folder named `bin` in the same root directory of the ParaMonte project that you have downloaded from GitHub. 

1.  **Congrats!** You have now built and (locally) installed the ParaMonte library for the configuration and language(s) of your choice on your system. Check out the two new folders `build` and `bin` that have been automatically created by the install script in the root directory of the uncompressed ParaMonte repository that you have downloaded. Inside the `bin` directory, you will see all the different build subdirectories corresponding to the different ParaMonte library build configurations. For example, 
    ```text
    {{installScript}} --lang C++ --build release --lib shared --mem heap --par mpi -s intel
    ```
    will generate the following subdirectory,
    ```  
    ./bin/libparamonte_cpp_{{include.os|downcase}}_x64_intel_release_shared_heap_impi
    ```  
    or,  
    ```text
    {{installScript}} --lang C++ --build release --lib shared --mem heap --par mpi -s gnu
    ```
    will generate either of the following subdirectories,
    ```  
    ./bin/libparamonte_cpp_{{include.os|downcase}}_x64_gnu_release_shared_heap_mpich
    ./bin/libparamonte_cpp_{{include.os|downcase}}_x64_gnu_release_shared_heap_openmpi
    ```  
    in the bin directory of the ParaMonte library, depending on the existing MPI library installed on the system (Intel MPI vs. MPICH vs. OpenMPI). Any of these subdirectories contains the ParaMonte library files along with an example simulation source file and a build-script that can build the example to generate the executable, as well as a `README.md` file explaining how to build the supplied example.  

    