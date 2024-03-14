---
title: "Installation instructions for the ParaMonte MATLAB library"
#tags: [matlab, getting_started, installation, windows, author, compiler, operating_system, OS, Fortran, C, C++, interoperation, build]
keywords: 
        matlab
        Windows
        Linux
        macOS
        Darwin
        installation
        getting_started
        operating_system
        interoperation
        build
        OS
        MPI
        GNU
        Intel
        build
        MPICH
        OPENMPI
        OPEN-MPI
sidebar: home_sidebar
#permalink: ///index.html
summary:
last_updated: January 1, 2020
mathjax: true
---
{% comment %}
[](){:target="_blank"}
{% if pmSampler == "ParaDRAM" %}
{% endif %}
{% endcomment %}
<br>

{{site.data.alerts.note}}
The current release of the ParaMonte MATLAB library has been tested only with the most recent versions of MATLAB:  
<br>
<ul>
    <li><b>compatible</b> and <b>tested</b> with <b>MATLAB 2021a, 2020b, 2020a, 2019b, 2019a, 2018b, 2018a</b></li>
    <li><b>incompatible</b> and <b>not tested</b> with <b>MATLAB < 2018a</b></li>
</ul>
Support for MATLAB R2018a on Windows is unstable. In particular, <a href="https://www.mathworks.com/downloads/" target="_blank">MATLAB R2018a Update 6</a> is required for the proper functioning of the ParaMonte kernel routines on Windows systems with MATLAB R2018a.<br>
If you encounter incompatibilities or bugs in the ParaMonte library with any of the supported MATLAB versions in the above, please report the issue on the <a href="{{site.issues}}" target="_blank">GitHub issues page of the library</a>.
{{site.data.alerts.end}}

<br>  

There are two ways to install and use the ParaMonte library from MATLAB on your system:  

## The fast way  

1.  **Download** and unzip the prebuilt MATLAB package for ParaMonte from the project repository's release page on GitHub:
    +   For **Windows**: [**libparamonte_matlab_windows_x64.zip**]({{site.currentReleaseDownload}}/libparamonte_matlab_windows_x64.zip).  
    +   For **Linux**: [**libparamonte_matlab_linux_x64.tar.gz**]({{site.currentReleaseDownload}}/libparamonte_matlab_linux_x64.tar.gz).  
    +   For **macOS** (**Darwin**): Follow the instruction below to download this compressed file: [**libparamonte_matlab_darwin_x64.tar.gz**]({{site.currentReleaseDownload}}/libparamonte_matlab_darwin_x64.tar.gz) (do **NOT** download this file by directly clicking on this link. Follow the instructions below).  
        {% include tip.important.download.method.md lang="matlab" %}
1.  Depending on your operating system,  
    -   on **Windows**:  
            -   Open a MATLAB session.  
    -   on **Linux/macOS**:  
        -   Open the Bash (in Linux) or zsh (in macOS) terminal.  
        -   then open MATLAB by calling it on the command line via, 
            ```bash  
            matlab
            ```  
            {% include tip.html content="If the `matlab` executable is not recognized by the Bash terminal, see [this page](../../troubleshooting/bash-matlab-command-not-found){:target='_blank'} for a solution." %}  
1.  Once the MATLAB interactive environment opens, change the current working of MATLAB to the **root directory** of the ParaMonte library (*where the ParaMonte library license file exists*). You can do this on the MATLAB command prompt via,  
    ```matlab  
    cd path_to_the_root_directory_of_paramonte
    ```  
    where you will have to replace the `path_to_the_root_directory_of_paramonte` with the root path to the ParaMonte library on your system. The root path is the path to the directory where the ParaMonte `LICENSE.md` file exists.  
1.  Call the ParaMonte library for the first time via the following commands (simply type the commands on the MATLAB command prompt),  
    ```matlab  
    addpath(genpath("./"),"-begin"); % add the ParaMonte library directories to MATLAB's list of search paths.
    pm = paramonte(); % instantiate an object of class paramonte.
    pm.verify(); % verify the integrity of the ParaMonte library on your system.
    ```  
    If needed, follow any extra instructions provided by the library on your MATLAB command prompt.  
1.  You are all set! Enjoy the unification of simplicity, high-performance, parallelism, thoroughness, and advanced Monte Carlo algorithms, all in one place. Follow the instructions [on this page](../../run/matlab){:target="_blank"} to run your ParaMonte-enabled simulations.  
    {{site.data.alerts.important}}{% include important.macos.sip.msg.md %}{{site.data.alerts.end}}

## The long way  

{% include build.dynamic.long.way.md lang="MATLAB" %}

{% comment %}
{% include tshoot.matlab.segfault.md %}
{% include important.html content="The ParaMonte MATLAB library has been tested only with MATLAB 2018b and newer. In particular, the library is completely incompatible with the 2016a and older versions of MATLAB." %}
{{site.data.alerts.note}}
The ParaMonte MATLAB library has been tested only with the recent versions of MATLAB:
<br>
<ul>
    <li><b>MATLAB 2020b</b>&nbsp;: <b>compatible&nbsp;&nbsp;</b>, untested</li>
    <li><b>MATLAB 2020a</b>&nbsp;: <b>compatible&nbsp;&nbsp;</b>, tested  </li>
    <li><b>MATLAB 2019b</b>&nbsp;: <b>compatible&nbsp;&nbsp;</b>, tested  </li>
    <li><b>MATLAB 2019a</b>&nbsp;: <b>compatible&nbsp;&nbsp;</b>, tested  </li>
    <li><b>MATLAB 2018b</b>&nbsp;: <b>compatible&nbsp;&nbsp;</b>, tested  </li>
    <li><b>MATLAB 2018a</b>&nbsp;: <b>compatible&nbsp;&nbsp;</b>, untested</li>
    <li><b>MATLAB 2017b</b>&nbsp;: <b>compatible&nbsp;&nbsp;</b>, untested</li>
    <li><b>MATLAB 2017a</b>&nbsp;: <b>compatible&nbsp;&nbsp;</b>, untested</li>
    <li><b>MATLAB 2016b</b>&nbsp;: <b>compatible&nbsp;&nbsp;</b>, untested</li>
    <li>MATLAB <2016a            :    incompatible              , untested</li>
</ul>
If you encounter incompatibilities or bugs in the ParaMonte library with any of the supported MATLAB versions in the above, please report the issue on the <a href="{{site.issues}}" target="_blank">GitHub issues page of the library</a>.
{{site.data.alerts.end}}
{% endcomment %}

{% include askme.html %}
{% include links.html %}

