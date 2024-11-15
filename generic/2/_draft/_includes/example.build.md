<br>

{% if pmLang == "C" %}
    {% assign progLang = "C/C++" %}
    {% assign progLangExt = "c" %}
{% elsif pmLang == "Fortran" %}
    {% assign progLang = "Fortran" %}
    {% assign progLangExt = "f90" %}
{% endif %}

{% capture donwloadParaMonteFrom %}
Follow the guildelines in [the previous section in the above](#compiling-and-linking-to-generate-the-executable-the-build-process) on choosing the right build configuration for your ParaMonte library. Here, we assume the ParaMonte library has been built in `release` mode for dynamic-linking. The corresponding prebuilt ParaMonte library can be downloaded from 
{% endcapture %}

{% capture runApplication %}
The above step should generate a `main.exe` executable file in the same directory. You can now [run this executable](#running-the-paramonte-simulations) to generate samples from your objective function as implemented in `logfunc.{{progLangExt}}`.
{% endcapture %}

{% capture runMpiApplication %}
The above step should generate an MPI-parallelized `main.exe` executable file in the same directory. You can now [run this executable](#running-the-paramonte-simulations) -- in parallel on any number of processors you wish -- to generate samples from your objective function as implemented in `logfunc.{{progLangExt}}`.
{% endcapture %}

## Compiling and linking to generate the executable  

At this point, you need to have already made up your mind about which approach you want to take to link your code to the ParaMonte library,  

-   you have already built the ParaMonte library from scratch on your system, or,  
-   you intend to use [the ParaMonte prebuilt libraries]({{site.githubReleaseCurrent}}){:target="_blank"}.  

If you have not made up your mind yet, we recommend using the prebuilt ParaMonte binaries. Although the entire [ParaMonte library build process](../../../installation/readme/){:target="_blank"} is fully automated, it can take much longer than simply downloading the ParaMonte prebuilt libraries from the project's repository.  

### Compiling and linking to generate the executable: The compiler choice  

To build and link your application, we recommend installing the following compilers on your system,  

-   On **Windows OS**  
    -   we recommend installing and using the [Intel Parallel Studio](https://www.cdslab.org/recipes/programming/intel-parallel-studio-installation-windows/intel-parallel-studio-installation-windows){:target="_blank"} `{{site.intelVersionWindows}}` or newer, although older versions may also work.  
    {% if pmLang == "C" %}
    -   Alternatively, you can also install and use a recent release of the [Microsoft Visual C/C++ compiler (MSVC) {{site.msvcVersionWindows}}](https://visualstudio.microsoft.com/vs/features/cplusplus/){:target="_blank"} or newer on your system. The `community` release of this compiler is free to the public and sufficient for many applications.  
        {% include tip.html content='The MSVC compiler, as part of the Microsoft Visual Studio, is a prerequisite for the successful installation of the Intel Parallel Studio. Therefore, if you have already successfully installed the Intel compilers on your Windows system, you should also be able to use the MSVC C/C++ compiler.' %}
    {% endif %}
-   On **Linux OS**  
    -   we recommend installing and using the [Intel Parallel Studio](https://software.intel.com/en-us/parallel-studio-xe/choose-download){:target="_blank"} `{{site.intelVersionLinux}}` or newer, although older versions may also work.   
    -   Alternatively, you can also install a recent release of the [GNU Compiler Collection](https://gcc.gnu.org/){:target="_blank"} `gcc/g++/gfortran` (preferably version `{{site.gnuVersionLinux}}` or newer) instead of the Intel compiler suite. If you intend to build parallel applications, you will have to also have a compatible MPI library installed on your system, preferably the [MPICH MPI library](https://www.mpich.org/){:target="_blank"} `{{site.mpichVersionLinux}}` or newer.  
-   On **macOS**   
    The situation is slightly complicated on MacOS. Apparently, Apple and Intel corporations have an intense internal rivalry and competition with each other, so much that Apple did not want to help Intel make their MPI library available on macOS. As a result, the Intel Parallel Studio cannot be used to build parallel MPI applications on macOS. Therefore,  gnuVersionLinux
    -   If you intend to build and use **serial ParaMonte applications**, then we still recommend installing and using the [Intel Compiler Suite {{site.intelVersionDarwin}}](https://software.intel.com/en-us/parallel-studio-xe/choose-download){:target="_blank"} or newer on your system.  
    -   If you intend to build and use **parallel ParaMonte applications**, then the best option would be to download and install a recent version of the [GNU Compiler Collection](https://gcc.gnu.org/){:target="_blank"} (preferably, the same version with which the ParaMonte was built: `{{site.gnuVersionLinux}}`) as well as the [Open-MPI library](https://www.open-mpi.org/){:target="_blank"} `{{site.openmpiVersionDarwin}}`. 
        {% include tip.html content='See the instructions on [the installation page](../../../installation/macos/){:target="_blank"} on how to seamlessly install the above compilers and libraries in less than one minute on your Mac.' %}  
{% include tip.html content="If you are using the ParaMonte's build scripts to build the library from scratch, then all compiler and library installations will be automatically done for you. For more information, see the ParaMonte installation instructions provided on this website." %}  
{% include note.html content="The Intel Parallel Studio and compiler-suite are available free of charge to a large fraction of the High-Performance-Computing (HPC) community, including **students**, **teachers**, and  **open-source developers**." %}  

### Compiling and linking to generate the executable: The build process

To simplify our build process, here we will only consider dynamic-linking to the ParaMonte library (as opposed to static-linking).  **In brief, the build steps are the following**,  
1.  Either,  
    -   download the ParaMonte prebuilt library of your choice from the [release page of the ParaMonte repository on GitHub]({{site.githubReleaseCurrent}}){:target="_blank"}. If you are not sure which one is suitable for your usage, see,  
        -   the [pre-installation notes](../../../installation/readme/){:target="_blank"} and,  
        -   the [installation instructions](../../../installation/windows/#using-the-prebuilt-paramonte-library){:target="_blank"} for Windows, or,  
        -   the [installation instructions](../../../installation/macos/#using-the-prebuilt-paramonte-library){:target="_blank"} for macOS, or,    
        -   the [installation instructions](../../../installation/linux/#using-the-prebuilt-paramonte-library){:target="_blank"} for Linux.  
        {{site.data.alerts.tip}}
        On Windows, unzipping the compressed file is easy as clicking on the file to open it via the Windows explorer. On macOS/Linux, you can untar the compress file by the following command in a Bash terminal,  
        <pre>
        tar xvzf ParaMonte_LIBRARY_NAME.tar.gz
        </pre>
        where you will have to replace <code>ParaMonte_LIBRARY_NAME</code> with the name of the compressed library file that have downloaded.
        {{site.data.alerts.end}}
    -   or build the ParaMonte library for dynamic linking.  
    {% include tip.html content="When building the ParaMonte library or downloading the binaries, always choose the **`release`** mode as your library build-type among the available three default choices ( **`release`**, **`testing`**, **`debug`** ). The **`release`** build-type results in the highest-performing ParaMonte library build and the fastest runtime simulations. If needed, use the **`testing`** build-type solely for quick application builds for testing purposes and the **`debug`** build-type solely for debugging your simulations at runtime." %}
1.  Navigate to the directory containing your uncompressed ParaMonte library files. Replace the three `paramonte.in`, `logfunc.{{progLangExt}}`, and `main.{{progLangExt}}` in the library with the corresponding custom input file and example codes you have developed in the previous section.  
1.  **Build and run the executable**.  
    -   On **Windows**, open a command-line interface that recognizes your {{progLang}} compiler. Change the current directory to your ParaMonte library directory. Type,  
        ```text
        build.bat
        ```  
        {% if pmLang == "C" %}
        or,  
        ```text
        build.bat msvc
        ```  
        to specifically build via the Microsoft MSVC {{progLang}} compiler. The above script will both build and run the generated executable.
        {% endif %}
        {% include tip.html content='See the following sections for the compiler of your choice to find out what Windows command-prompt interface is suitable for building applications.' %}
    -   On **macOS** or **Linux**, open a Bash terminal. Change the current directory to your ParaMonte library directory. Type,  
        ```text
        chmod +x build.sh
        ./build.sh
        ```  
        This builds the executable and generates another Bash script `run.sh` in the same directory, which can be called on the command-line to run the executable.  
        {{site.data.alerts.tip}}
        There are a several options that can be specified at the time of calling the `build.sh` script. To get help on the options, try, 
        <pre>
        ./build.sh -h
        </pre>
        or,  
        <pre>
        ./build.sh --help
        </pre>
        {{site.data.alerts.end}}
1.  If your simulation build and run has been successful, you can now skip the following detailed sections on the build process via different specific compilers, and glance through the tips and information prvided on [running](#running-the-paramonte-simulations){:target="_blank"} and [post-processing](#post-processing-the-paramonte-simulation-results) the ParaMonte simulations.
