{% include build.flags.definitions.md %}
{% if pmLang == "C" %}
    {% assign progLang = "C" %}
    {% assign progLangExt = "c" %}
    {% assign progHeadExt = "h" %}
    {% assign gnuLinuxCompiler = "gcc" %}
    {% assign intelLinuxCompiler = "icc" %}
    {% assign gnuLinuxCompilerFlags = gccLinuxReleaseFlags %}
    {% assign intelLinuxCompilerFlags = iccLinuxReleaseFlags %}
    {% assign gnuLinuxCompilerWrapper = "mpicc" %}
    {% assign intelLinuxCompilerWrapper = "mpiicc" %}
{% elsif pmLang == "C++" %}
    {% assign progLang = "C++" %}
    {% assign progLangExt = "cpp" %}
    {% assign progHeadExt = "hpp" %}
    {% assign gnuLinuxCompiler = "g++" %}
    {% assign intelLinuxCompiler = "icpc" %}
    {% assign gnuLinuxCompilerFlags = gccLinuxReleaseFlags %}
    {% assign intelLinuxCompilerFlags = iccLinuxReleaseFlags %}
    {% assign gnuLinuxCompilerWrapper = "mpicxx" %}
    {% assign intelLinuxCompilerWrapper = "mpiicpc" %}
{% elsif pmLang == "Fortran" %}
    {% assign gnuLinuxCompiler = "gfortran" %}
    {% assign intelLinuxCompiler = "ifort" %}
    {% assign gnuLinuxCompilerFlags = gfortranLinuxReleaseFlags %}
    {% assign intelLinuxCompilerFlags = ifortLinuxReleaseFlags %}
    {% assign gnuLinuxCompilerWrapper = "mpifort" %}
    {% assign intelLinuxCompilerWrapper = "mpiifort" %}
    {% assign progLang = "Fortran" %}
    {% assign progLangExt = "f90" %}
{% endif %}

{% capture donwloadParaMonteFrom %}
We will consider building the {{progLang}} application via the ParaMonte library build in `release` mode for shared (dynamic) linking. The corresponding prebuilt ParaMonte library can be downloaded from 
{% endcapture %}

{% capture runApplication %}
The above step should generate a `main.exe` executable file in the same directory. You can now [run this executable](../../run/default/#running-the-manually-generated-executable-on-a-single-processor){:target="_blank"} to generate samples from your objective function as implemented in `logfunc.{{progLangExt}}`.
{% endcapture %}

{% capture runParallelApplication %}
The above step should generate an MPI-parallelized `main.exe` executable file in the same directory. You can now [run this executable](../../run/default/#running-the-manually-generated-executable-on-multiple-processors){:target="_blank"} -- in parallel on any number of processors you wish -- to generate samples from your objective function as implemented in `logfunc.{{progLangExt}}`.
{% endcapture %}

{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}

## Preamble  

Suppose you have written a [file](https://github.com/cdslaborg/paramonte/blob/3548c097f2a25dfc0613061800656d27d0e0ddbe/example/mvn/{{pmLang}}/logfunc.{{progLangExt}}){:target="_blank"} named `logfunc.{{progLangExt}}` containing an implementation of your mathematical objective function and a `main.{{progLangExt}}` [file](https://github.com/cdslaborg/paramonte/blob/3548c097f2a25dfc0613061800656d27d0e0ddbe/example/main.{{progLangExt}}){:target="_blank"} containing call(s) to the ParaMonte routines of your choice to sample the objective function.  

{% if pmLang == "C" or pmLang == "C++" %}

The corresponding required `logfunc.{{progHeadExt}}` and `paramonte.{{progHeadExt}}` header files can be also downloaded from [here](https://github.com/cdslaborg/paramonte/blob/3548c097f2a25dfc0613061800656d27d0e0ddbe/example/mvn/{{pmLang}}/logfunc.{{progHeadExt}}){:target="_blank"} and [here](https://github.com/cdslaborg/paramonte/blob/3548c097f2a25dfc0613061800656d27d0e0ddbe/src/interface/{{pmLang}}/paramonte.{{progHeadExt}}){:target="_blank"}.  

{% elsif pmLang == "Fortran" %}

The corresponding required `paramonte.f90` module interface file can be also downloaded from [here](https://github.com/cdslaborg/paramonte/blob/3548c097f2a25dfc0613061800656d27d0e0ddbe/src/interface/{{pmLang}}/paramonte.f90){:target="_blank"}.  

{% endif %}

At this point, you need to have already made up your mind about which approach you want to take to compile and link your code to the ParaMonte library,  

-   you have already built the ParaMonte library from scratch on your system, or,  
-   you intend to use [the prebuilt ParaMonte libraries]({{site.currentRelease}}){:target="_blank"}.  

If you have not made up your mind yet, we recommend using the prebuilt ParaMonte binaries. Although the entire [ParaMonte library build process](../../installation/readme/){:target="_blank"} is fully automated, it can take much longer than simply downloading the prebuilt ParaMonte libraries from the project's repository.  

### Preamble: The compiler choice  

To build and link your application, we recommend installing the following compilers on your system,  

-   On **Windows OS**  
    -   We recommend installing and using the [Intel Parallel Studio](https://www.cdslab.org/recipes/programming/intel-parallel-studio-installation-windows/intel-parallel-studio-installation-windows){:target="_blank"} `{{site.intelVersionWindows}}` or newer, although older versions may also work.  
    {% if pmLang == "C" or pmLang == "C++" %}
    -   Alternatively, you can also install and use a recent release of the [Microsoft Visual C/C++ compiler (MSVC) {{site.msvcVersionWindows}}](https://visualstudio.microsoft.com/vs/features/cplusplus/){:target="_blank"} or newer on your system. The `community` release of this compiler is free to the public and sufficient for many applications.  
        {% include tip.html content='The MSVC compiler, as part of the Microsoft Visual Studio, is a prerequisite for the successful installation of the Intel Parallel Studio on Windows. Therefore, if you have already successfully installed the Intel compilers on your Windows system, you should also be able to use the MSVC C/C++ compiler.' %}
    {% endif %}
-   On **Linux OS**  
    -   We recommend installing and using the [Intel Parallel Studio](https://software.intel.com/en-us/parallel-studio-xe/choose-download){:target="_blank"} &#8805; `{{site.intelVersionLinux}}` or newer, although older versions may also work.   
    -   Alternatively, you can also install a recent release of the [GNU Compiler Collection](https://gcc.gnu.org/){:target="_blank"} `gcc/g++/gfortran` (preferably version `{{site.gnuVersionLinux}}` or newer) instead of the Intel compiler suite. If you intend to build parallel applications, you will have to also have a compatible MPI library installed on your system, preferably the [MPICH MPI library](https://www.mpich.org/){:target="_blank"} `{{site.mpichVersionLinux}}` or newer.  
-   On **macOS**   
    The situation is slightly complicated on MacOS. Apparently, Apple and Intel corporations have an intense internal rivalry and competition with each other, so much that Apple did not want to help Intel make their MPI library available on macOS. As a result, the Intel Parallel Studio cannot be used to build parallel MPI applications on macOS. Therefore,  
    -   If you intend to build and use **serial ParaMonte applications**, then we still recommend installing and using the [Intel Compiler Suite &#8805; {{site.intelVersionDarwin}}](https://software.intel.com/en-us/parallel-studio-xe/choose-download){:target="_blank"} or newer on your system.  
    -   If you intend to build and use **parallel ParaMonte applications**, then the best option would be to download and install a recent version of the [GNU Compiler Collection](https://gcc.gnu.org/){:target="_blank"} (preferably, the same version with which the ParaMonte was built: `{{site.gnuVersionLinux}}`) as well as the [Open-MPI library](https://www.open-mpi.org/){:target="_blank"} `{{site.openmpiVersionDarwin}}`. 
        {% include tip.html content='See the instructions on [the installation page](../../installation/macos/){:target="_blank"} on how to seamlessly install the above compilers and libraries in less than one minute on your Mac.' %}  
{% include tip.html content="If you are using the ParaMonte's build-scripts to build the library from scratch, then all compiler and library installations will be automatically done for you. For more information, see the ParaMonte installation instructions provided on this website." %}  
{% include note.html content="The **Intel Parallel Studio** and compiler-suite are **available free of charge** to a large fraction of the High-Performance-Computing (HPC) community, including **students**, **teachers**, and  **open-source developers**." %}  

### Preamble: Setting up the environment  

{% capture pmLibNameLinuxIntelRelease       %}libparamonte_{{pmLang|downcase|replace:"+","p"}}_linux_x64_intel_release_shared_heap{% endcapture %}
{% capture pmLibNameLinuxIntelReleaseMPI    %}{{pmLibNameLinuxIntelRelease}}_impi{% endcapture %}
{% capture pmLibNameDarwinIntelRelease      %}libparamonte_{{pmLang|downcase|replace:"+","p"}}_darwin_x64_intel_release_shared_heap{% endcapture %}
{% capture pmLibNameDarwinIntelReleaseMPI   %}{{pmLibNameDarwinIntelRelease}}_impi{% endcapture %}

In brief, the process of building your {{progLang}} application involves the following steps,  
1.  Either,  
    -   **Download the ParaMonte prebuilt library** of your choice from the [release page of the ParaMonte repository on GitHub]({{site.currentRelease}}){:target="_blank"}. If you are not sure which one is suitable for your usage, see,  
        -   the [pre-installation notes](../../installation/readme/){:target="_blank"} and,  
        -   the [installation instructions](../../installation/windows/#using-the-prebuilt-paramonte-library){:target="_blank"} for Windows, or,  
        -   the [installation instructions](../../installation/macos/#using-the-prebuilt-paramonte-library){:target="_blank"} for macOS, or,    
        -   the [installation instructions](../../installation/linux/#using-the-prebuilt-paramonte-library){:target="_blank"} for Linux.  
        {{site.data.alerts.tip}}
        On <b>Windows</b>, unzipping the compressed file is easy as clicking on the file to open it via the Windows explorer. On <b>Linux</b> or <b>macOS</b>, you can untar the compress file via the following command in a Bash terminal,  
        <pre>
        tar xvzf {{pmLibNameLinuxIntelRelease}}.tar.gz
        </pre>
        where you will have to replace <code>{{pmLibNameLinuxIntelRelease}}</code> with the name of the compressed library file that you have downloaded.
        {{site.data.alerts.end}}
    -   **or build the ParaMonte library** for the configuration of your choice.  
    {% include tip.html content="When building the ParaMonte library or downloading the prebuilt ParaMonte libraries, always choose the **`release`** mode as your library build-type among the available three default choices ( **`release`**, **`testing`**, **`debug`** ). The **`release`** build-type results in the highest-performing ParaMonte library build and the fastest runtime simulations. If needed, use the **`testing`** build-type solely for quick application builds for testing purposes and the **`debug`** build-type solely for debugging your simulations at runtime." %}
1.  **Navigate to the directory** containing your uncompressed ParaMonte library files and **paste** (that is, overwrite the existing three `paramonte.in`, `logfunc.{{progLangExt}}`, and `main.{{progLangExt}}` files with) **your files and codes**.  
1.  **Open a command-line interface and navigate to the directory** containing your uncompressed ParaMonte library files.
    -   **On Windows**
        -   If you choose to use the Intel {{progLang}} compiler to build your application, then we strongly recommend you to use the Intel Parallel Studio's customized command-line interface that is automatically installed on your system. You can access it from the Windows startup menu as illustrated in the figure below.  
            [![Intel Parallel Studio's customized command-line interface](https://www.cdslab.org/recipes/programming/intel-parallel-studio-installation-windows/intelCMD.png)](https://www.cdslab.org/recipes/programming/intel-parallel-studio-installation-windows/intel-parallel-studio-installation-windows){:target="_blank"}  
            <br>
            Open a **64-bit** instance of the Intel Parallel Studio's command-line interface. This command-line prompt comes with all the relevant compiler and linker environmental variables predefined in your session so that you won't need to manually modify the contents of your environmental `PATH` variable.  
        {% if pmLang == "C" or pmLang == "C++" %}
        -   If you choose to use the [MSVC {{progLang}} compiler](https://en.wikipedia.org/wiki/Microsoft_Visual_C%2B%2B){:target="_blank"} `cl`, then we strongly recommend you to use the Microsoft Visual Studio's customized command-line interface that is automatically installed on your system along with the compiler. It is normally named **x64 Native Tools Command Prompt for VS 2XXX**, where `2XXX` is the version of the MSVC you have installed on your system. You can access it from the Windows startup menu as illustrated in the figure below, where the Microsoft Visual Studio 2019 is located (as well as an older existing installation of the Visual Studio 2017).  
            ![Microsoft Visual Studio's customized command-line interface]({{site.baseurl}}/images/msvc_cmd.png){:target="_blank"}  
            <br>
            Open an instance of the x64 Native Tools Command Prompt which is automatically installed on your system along with the MSVC compiler. This command-line comes with all the relevant compiler and linker environmental variables predefined in your session so that you won't need to manually modify the contents of the environmental `PATH` variable.  
            {% include important.html content="It is imperative that you open an x64-compatible version of the MSVC command prompt, just as shown in the above. The ParaMonte library binaries are exclusively built for `x64` (`x86_64`) type of architecture and therefore any compilation and linking via non-x64 tools will fail." %}
        {% endif %}
    -   **On Linux / macOS**, use a Bash terminal.

## Building the executable: **The quick automated approach**  

-   On **Windows**  
    -   To build your application via the **Intel {{progLang}} compiler**, type the following on the Intel Parallel Studio command-line interface that you opened in the previous section,  
        ```text
        build.bat
        ```  
    {% if pmLang == "C" or pmLang == "C++" %}
    -   To build your application via the **Microsoft {{progLang}} compiler**, type the following on the Microsoft Visual Studio command-line interface that you opened in the previous section,  
        ```text
        build.bat msvc
        ```  
    {% endif %}
    The above Batch script will both **build and run** the application executable. See [this page](../../run/default/#running-the-executable-generated-via-the-quick-automated-approach-on-windows){:target="_blank"} on how to set the number of processors for parallel simulations.  

-   On **Linux** / **macOS**  
    Type the following on the Bash terminal that you opened in the previous section,  
    ```text
    chmod +x build.sh
    ./build.sh
    ```  
    {{site.data.alerts.tip}}
    There are several options that can be specified at the time of calling the <b><code>build.sh</code></b> script, including the option to set the default number of MPI- or Coarray- parallel tasks. To get help on the options, try, 
    <pre>
    ./build.sh -h
    </pre>
    or,  
    <pre>
    ./build.sh --help
    </pre>
    {{site.data.alerts.end}}
    {{site.data.alerts.tip}}
    By default, the build-script automatically chooses the compiler for building your application based on the name of the prebuilt ParaMonte library that you have chosen to use. You can override this default option by providing the compiler name and the compile/linker flags via the two command-line options <b><code>-c</code></b> and <b><code>-f</code></b> to the build-script. For example, 
    <ul>
        <li>
            to compile and link a <b>serial {{progLang}} application</b> via the GNU {{progLang}} compiler against a <a href="{{site.currentReleaseDownload}}/{{pmLibNameLinuxIntelRelease}}.tar.gz">Linux-version</a> or a <a href="{{site.currentReleaseDownload}}/{{pmLibNameDarwinIntelRelease}}.tar.gz">macOS-version</a> of an Intel-prebuilt serial shared ParaMonte library in <code>release</code>  mode, you can specify the following options for the build-script on the command-line,  
            <pre>./build.sh -c {{gnuLinuxCompiler}} -f "{{gnuLinuxCompilerFlags}}"</pre>
        </li>
        <li>
            to compile and link an <b>MPI-parallel {{progLang}} application</b> via the Intel MPI-wrapper for the GNU {{progLang}} compiler against a <a href="{{site.currentReleaseDownload}}/{{pmLibNameLinuxIntelReleaseMPI}}.tar.gz">Linux-version</a> of an Intel-prebuilt serial shared ParaMonte library in <code>release</code>  mode, you can specify the following options for the build-script on the command-line,  
            <pre>./build.sh -c {{gnuLinuxCompilerWrapper}} -f "{{gnuLinuxCompilerFlags}}"</pre>
        </li>
    </ul>
    If you specify the <b><code>-c</code></b> compiler option, it is imperative to specify the <b><code>-f</code></b> compiler-flags option along with it. Failure to do so will cause the script to switch to the default inferred flags from the name of the compiler used in the filename of the ParaMonte library that is being used. The inconsistent compiler flags will then cause the application-build to abort.  
    {{site.data.alerts.end}}
    The build-script generates the executable along with a Bash script `run.sh` in the same directory, which can be called on the command-line to run the executable. See [this page](../../run/default/#running-the-executable-generated-via-the-quick-automated-approach-on-linux--macos){:target="_blank"} on how to set the number of processors for parallel simulations and run the executable.  

If your simulation-build and run have been successful, you can skip the following detailed sections on the build process via different specific compilers on different platforms and glance through the tips and information provided in the examples on this website to post-process the ParaMonte simulation results and output files.  

## Building the executable: **Do-it-yourself**  

There are currently more than 210 possible configurations with which you can build the ParaMonte library. Covering the compilation and linking procedure for all of these different scenarios here is impossible. To simplify, we will only consider compiling and linking your {{progLang}} application via the ParaMonte library build in `release` mode for only shared (dynamic) linking. Before continuing to build your application manually, make sure you follow the guidelines outlined in the [Preamble](#preamble) section in the above.  

{% include build.windows.md os="Windows" pmcs="Intel" %}
{% include build.unix.md os="macOS" pmcs="Intel" %}
{% include build.unix.md os="macOS" pmcs="GNU" %}
{% include build.unix.md os="Linux" pmcs="Intel" %}
{% include build.unix.md os="Linux" pmcs="GNU" %}
