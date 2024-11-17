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
        AMD64
        ARM64
        X64
        amd64
        arm64
        x64
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

{{site.data.alerts.note}}
The current pre-release of the ParaMonte MATLAB library has been tested only with the most recent versions of MATLAB (<b><code>> R2023a</code></b>):  
<br>
<ul>
    <li>
        <b>Fully compatible</b> and <b>tested</b> with <b>MATLAB 2024b, 2024a, 2023b, 2023a</b> on all supported platforms (Linux, Darwin, Windows).
    </li>
    <li>
        <b>Mostly compatible</b> but <b>untested</b> with <b>MATLAB 2022b, 2022a, 2021b, 2021a, 2020b, 2020a, 2019b</b>.<br>
        Specifically, the functionalities that require MEX files (e.g., the ParaMonte samplers) 
        may not work as the new compilers are incompatible with older MATLAB versions.<br>
        Refer to the build instructions from source code if you need to rebuild the 
        MEX files from source code for your specific older MATLAB installation.<br>
    </li>
    <li>
        <b>Partially compatible</b> but <b>untested</b> with <b>MATLAB 2019a, 2018b</b>:  
        The tiled visualization functionalities of <code>pm.vis</code> that rely on <code>tiledlayout</code> new functionality of MATLAB 2019 will not work.  
    </li>
    <li>
        Support for MATLAB R2018a on Windows is unstable. 
        In particular, <a href="https://www.mathworks.com/downloads/" target="_blank">MATLAB R2018a Update 6</a> 
        is required for the proper functioning of the ParaMonte sampler routines on Windows systems with MATLAB R2018a.<br>
        If you encounter incompatibilities or bugs in the ParaMonte library with any of the supported MATLAB versions in the above, 
        please report the issue on the <a href="{{site.githubIssues}}" target="_blank">GitHub issues page of the library</a>.
    </li>
    <li>
        <b>incompatible</b> and <b>untested</b> with <b>MATLAB < 2018a</b>
    </li>
</ul>

We strongly recommend to either upgrade your MATLAB software to most recent versions or use the 
<a href="https://www.cdslab.org/paramonte/generic/1/installation/matlab/" _target="blank">binary releases and installation guidelines for ParaMonte 1</a>.

{{site.data.alerts.end}}

{% include tip.arch.amd64.md %}
{% include tip.arch.arm64.md %}

## Installation methods  

There are two ways to install and use the ParaMonte library from MATLAB on your system:  

### The fast way  

{% comment %}
{% include warning.html content="This approach is currently unavailable in the latest pre-release of the library. Skip to the [second approach](#the-long-way) below." %}  
{% endcomment %}

<p></p>

1.  **Download** and untar/unzip the prebuilt MATLAB package for ParaMonte from the project repository's release page on GitHub:
    +   For **Windows** with **`AMD64` (Intel)** processor: [**libparamonte_matlab_windows_amd64.zip**]({{site.githubReleaseCurrentDownload}}/libparamonte_matlab_windows_amd64.zip).  
    +   For **Linux** with **`AMD64` (Intel)** processor: [**libparamonte_matlab_linux_amd64.tar.gz**]({{site.githubReleaseCurrentDownload}}/libparamonte_matlab_linux_amd64.tar.gz).  
    +   For **macOS** (**Darwin**) with **`AMD64` (Intel)** processor: Follow the instruction below to download the ParaMonte MATLAB prebuilt library.
        {% include tip.important.download.method.md lang="MATLAB" arch="amd64" %}
    +   For **macOS** (**Darwin**) with **`ARM64` processor** (**M1**, **M2**, **M3**, **M4**, etc.): Follow the instruction below to download the ParaMonte MATLAB prebuilt library.
        {% include tip.important.download.method.md lang="MATLAB" arch="arm64" %}
1.  Follow further instructions below for the [first-time usage](#first-time-usage).

### The long way  

{% include build.dynamic.long.way.md lang="MATLAB" %}

Once the library build and installation is complete, follow further instructions below for the [first-time usage](#first-time-usage).

## First-time usage  

1.  Either, 
    +   open a ParaMonte-compatible MATLAB session as listed above from the Operating System's search box, or,  
    +   open a MATLAB session from the command line:
        +   On **Windows**, open a `CMD` terminal that recognizes the MATLAB software.  
        +   On **Linux**, open a `bash` terminal or `zsh` terminal.  
        +   On **macOS**, open a `zsh` terminal.  
        +   Open a MATLAB session by calling it on the command line via, 
            ```bash  
            matlab
            ```  
            {% include tip.html content="If the `matlab` executable is not recognized by the `bash`/`zsh` terminal, 
            see [this page](../../troubleshooting/bash-matlab-command-not-found){:target='_blank'} for a solution." %}  
1.  Once the MATLAB interactive environment opens, change the current working directory of MATLAB to the **root directory** of 
    the ParaMonte library (*where the ParaMonte library license file exists*). You can do this on the MATLAB command prompt as,  
    ```matlab  
    cd path_to_the_root_directory_of_paramonte
    ```  
    where you will have to replace the `path_to_the_root_directory_of_paramonte` with the root path to the ParaMonte library on your system. 
    The root path is the path to the directory where the ParaMonte `LICENSE.md` file exists.  
1.  Call the ParaMonte library for the first time via the following commands (simply type the commands on the MATLAB command prompt),  
    ```matlab  
    addpath('./', '-begin'); % add the ParaMonte library package root directory to MATLAB's list of search paths.
    pm.lib.verify(); % verify the integrity of the ParaMonte library on your system (also searches for the relevant MPI library on your system).
    ```  
    If needed, follow any extra instructions provided by the library on your MATLAB command prompt.  
1.  You are all set! Enjoy the unification of simplicity, high-performance, parallelism, thoroughness, 
    and advanced Monte Carlo algorithms and Machine Learning, all in one place. 
    See the [ParaMonte MATLAB documentation](site.baseurl/../../matlab/{{site.pmvmmatlab}}){:target="_blank"} 
    for detailed functionalities and examples.  
    {{site.data.alerts.important}}
    {% include important.macos.sip.msg.md %}
    {{site.data.alerts.end}}

{% include askme.html %}
{% include links.html %}

