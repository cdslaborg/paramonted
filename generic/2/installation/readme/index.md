---
title: "ParaMonte pre-installation notes"
#tags: [installation, getting_started, Windows, macOS, Linux, naming, compiler, architecture, x64, x86_64, operating_system, OS, Fortran, C, C++, interoperation, build]
keywords: 
        installation
        getting_started
        Windows
        Darwin
        macOS
        Linux
        naming
        compiler
        architecture
        x32
        x64
        x86_64
        operating_system
        OS
        Fortran
        C
        C++
        build
        Python
        MPI
        MPICH
        OpenMPI
        Open-MPI
        Coarray
        dynamic
        shared
        static
        interoperation
sidebar: home_sidebar
#permalink: ///index.html
summary:
last_updated: March 14, 2024
mathjax: true
---
{% comment %}
[](){:target="_blank"}
{% if pmSampler == "ParaDRAM" %}
{% endif %}
{% endcomment %}
<br>


## Naming convention used for ParaMonte library builds  

Across all supported Operating Systems (OS) and platforms/architectures, a universal naming convention is currently used to build the ParaMonte kernel libraries,  

```
libparamonte_<interface language: c/cpp/fortran/matlab/python/r/...>_<OS: windows/linux/darwin/...>_<architecture: amd64/arm64/...>_<compiler vendor and major version: intel2021/gnu13/...>_<build type: native/tuned/ipo/release/testing/debug>_<library type: shared/static>_<memory allocation type: stack/heap>_<parallelism library/type: serial/mpi/impi/mpich/openmpi/openmp/cafsingle/cafshared/cafdist/...>_<runtime checking mode: checked/nocheck>.<library file extension: dll/lib/so/a/dylib>  
```  

where,  

- **interface language** can be either:
    - **c**: indicating a library build meant to be called and used from C or C-complaint main applications.  
    - **cpp**: indicating a library build meant to be called and used from C++ main applications.  
    - **fortran**: indicating a library build meant to be called and used from Fortran main applications.  
    - **matlab**: indicating a library build meant to be called and used from MATLAB main applications.  
    - **python**: indicating a library build meant to be called and used from Python main applications.  
    - **r**: indicating a library build meant to be called and used from R main applications.  
    {% comment %}
    {% include tip.html content="Both Fortran and C library interfaces can be used from both languages and others (e.g., Python). However, using the C-interface ParaMonte library build will be far less flexible for Fortran's main applications than the full-fledged Object-Oriented Fortran interface. Conversely, calling the Fortran-interface ParaMonte library builds from non-Fortran main applications will be challenging unless the user is familiar with all the details of C-Fortran interoperability and mixed-language programming." %}  
    {% endcomment %}

- **operating system type** can be either:
    - **windows**: indicating a library that can only be used on Windows OS, or,  
    - **darwin**: indicating a library that can only be used on macOS, or,  
    - **linux**: indicating a library that can only be used on Linux OS, or,  
    - some other name (or **unknown** if it cannot be identified), indicating a library build meant to be used on the specific OS for which the library has been built.  
    {% include note.html content="The ParaMonte build-scripts have only been tested on Windows, Linux, and Darwin operating systems. However, it should be possible to build ParaMonte on any other platform or architecture on which 1. the GNU compiler Collection or the Intel Parallel Studio can be installed, 2. a Unix Bash script or a Windows Bash script can run." %}  

- **architecture type** can be either:
    - **amd64**: indicating a library built for the `x86-64` architecture (also known as `x64`, `x86_64`, `AMD64`, and `Intel 64`), a 64-bit version of the `x86` instruction set, first announced in 1999.  
    - **arm64**: indicating a library that is built for `arm64` architecture, also known as `AArch64` or `ARM64`, a 64-bit extension of the ARM architecture family (`M1`, `M2`, `M3` macOS chips).  
    - Some other architecture (or **unknown** if it cannot be identified) indicates a library build that is meant to be used on the specific architecture for which the library has been built.  

- **compiler suite** can be any ParaMonte-compatible compiler vendor name you use to build the ParaMonte library. Currently, the ParaMonte build-scripts have only been tested with:
    -   **intel**: 
        on Windows and Linux OS for both serial and parallel ParaMonte library builds, as well as on Darwin (macOS) on `amd64` chip, but only for serial ParaMonte library builds,  
        {{site.data.alerts.important}}
        The minimum Intel compiler versions required for building the ParaMonte library from the source are,
        <br>
        <ul>
            <li>
                <b>Intel icx / ifx / ifort &#8805; {{site.intelVersionLinux}}</b> on <b>Linux</b>, 
            </li>
            <li>
                <b>Intel icx / ifx / ifort &#8805; {{site.intelVersionWindows}}</b> on <b>Windows</b>, 
            </li>
            <li>
                <b>Intel icx / ifx / ifort &#8805; {{site.intelVersionDarwin}}</b> on <b>macOS (Darwin)</b>, 
            </li>
        </ul> 
        {{site.data.alerts.end}}
    -   **gnu**: 
        on Windows, Linux, and Darwin OS for both serial and parallel ParaMonte library builds.  
        {{site.data.alerts.important}}
        The minimum GNU compiler versions required for building the ParaMonte library are <b>GNU gcc / g++ / gfortran > {{site.gnuVersionMinimum}}</b>.
        {{site.data.alerts.end}}

- **build type** can be either:
    - **native**: indicating a build targeting the current CPU architecture (leading to potentially non-portable binary), or,  
    - **tuned**: indicating a build targeting a family of CPU architectures supported by the compiler (leading to potentially very large binary), or,  
    - **ipo**: indicating an **interprocedurally-optimized** build targeting the current CPU architectures supported by the compiler, or,  
    - **release**: indicating a build with compiler flags that ensure the fastest possible simulations at runtime while remaining broadly portable, or,  
    - **testing**: indicating a build with compiler default optimization flags used only for testing purposes, or,  
    - **debug**: indicating a build with compiler flags that enable tracing of any compile-time or run-time errors.  
    {% include tip.html content="If you are unsure which one is appropriate for your case, always choose `release`. Generally, the `debug` and `testing` build types are mostly useful to developers and professional programmers. In some cases where the code consistently crashes in the release mode, it may be useful to run the same simulation using a `debug` library build to trace the source of the runtime error in the code." %}  

- **library type** can be either:
    - **shared**: indicating a dynamically-linked ParaMonte library build, or,  
    - **static**: indicating a statically-linked (archive) ParaMonte library build.  
    {% include tip.html content="If you are unsure which library type is suitable, choose `shared` over `static` ParaMonte library builds." %}  

- **memory allocation type** can be either:
    - **stack**: indicating static allocation of all automatic arrays and arrays created for temporary computations on the [stack](https://en.wikipedia.org/wiki/Stack-based_memory_allocation){:target="_blank"}, or,  
    - **heap**: indicating heap allocation of all automatic arrays and arrays created for temporary computations on the [heap](https://en.wikipedia.org/wiki/Memory_management#HEAP){:target="_blank"}).  
    {% include tip.html content="In general, stack memory allocation can lead to slightly more efficient codes than heap memory allocation. However, applications that use the stack for temporary memory allocations often run into the **stack overflow** kind of errors caused by the application reaching its maximum stack memory usage limit set by the operating system. While the stack size for an application can often be increased on both Windows and Unix-like OS, it can be potentially a challenging task for programmers with insufficient experience. Therefore, **if you do not know the difference between stack vs. heap memory allocation, always choose heap-enabled ParaMonte library builds to avoid unexpected `stack overflow` errors**." %}  

- **parallelism type** can be either:
    - **serial**: indicating no parallelism, that is, a library built for serial simulations, or,  
    - **openmp**: indicating a library built via the OpenMP standard for shared-memory (thread-based) parallelism, or,  
    - **mpi**: indicating a library built via (some unknown brand) Message Passing Interface (MPI) that is meant to be linked against parallel main applications for parallel simulations via MPI, or,  
    - **impi**: indicating a library built via the Intel Message Passing Interface (MPI) that is meant to be linked against parallel main applications for parallel simulations via Intel MPI, or,  
    - **mpich**: indicating a library built via the MPICH Message Passing Interface (MPI) that is meant to be linked against parallel main applications for parallel simulations via MPICH MPI, or,  
    - **openmpi**: indicating a library built via the OpenMPI Message Passing Interface (MPI) that is meant to be linked against parallel main applications for parallel simulations via OpenMPI, or,  
    - **cafsingle**: indicating a library built via Coarray Fortran parallelism paradigm that is meant to be linked against Coarray parallel main applications optimized and usable for serial simulations only (i.e., no parallelization), or,  
    - **cafshared**: indicating a library built via Coarray Fortran parallelism paradigm that is meant to be linked against Coarray parallel main applications for Coarray-enabled parallel simulations on shared-memory architecture, or,  
    - **cafdist**: indicating a library built via Coarray Fortran parallelism paradigm that is meant to be used for Coarray-enabled parallel simulations on distributed-memory architecture, or,  
    {% include warning.html content="The Coarray parallelism is currently under development in the new ParaMonte 2 release of the library." %}  
    {% include warning.html content="The three Coarray parallelism options are only available when the ParaMonte library is compiled via the Intel Fortran compiler. When compiled via the GNU Fortran compiler, the only option is `cafsingle`. When compiled via the GNU Fortran compiler with [OpenCoarrays library](http://www.opencoarrays.org/), the sole option is `cafdist`. Also, the Coarray-enabled parallel ParaMonte libraries can only be built as static (archive) libraries. Also, the Coarray parallelism is exclusively available for ParaMonte library builds that are meant to be statically linked against **main** applications exclusively written in Fortran." %}  

- **runtime checking mode** can be either:
    - **checked**: indicating all runtime memory-bound input argument sanity checks are enabled (which is useful for testing but can slow down the code), or,  
    - **nocheck**: indicating all runtime memory-bound input argument sanity checks are disabled (which is the default behavior for production `release` code), or,    

{% comment %}
- **multithreading type** can be:
    - **mt**: indicating a library built via the multi-threaded compiler libraries.  
    {% include warning.html content="Although all ParaMonte library builds are linked against the multi-threaded compiler libraries by default, the ParaMonte library by itself is not thread-safe. There is no need for thread-safety since all multi-tasking features of the ParaMonte library are exclusively achieved via the distributed-memory (MPI/Coarray) parallelism paradigms." %}  
{% endcomment %}

## Supported platform and architecture  

The ParaMonte library is currently developed with the presumption that it will be used on Windows/Linux/macOS operating systems (OS) built on an `amd64` architecture system (also known as `x64` on Windows and `x86_64` on Linux and macOS). There is, however, no technical or programming barrier to building ParaMonte for other architectures as long as compatible MPI and Fortran/C compilers are available on the specific platform and architecture of interest.  

### Why are the prebuilt ParaMonte libraries available only for amd64 and arm64 architectures?  

As of 2020, the `amd64` and `arm64` processor architectures takes the lion's share of the market demand (illustrated in the figure below). It is costly for the ParaMonte developers (in terms of energy, money, and time) to build and release the library for all available architectures in the market. Note, however, that the library can be built on any architecture as long as a ParaMonte-compatible C/Fortran compiler can be installed on the system.  
<figure>
    <img src="cpu_arch_market_share.png" width="100%">
    <figcaption>
        An illustration of the dynamics of the market share for different families of microprocessors in the <a href="https://www.top500.org/" target="_blank">TOP500 supercomputer ranking list</a>, from 1992 to 2019.
    </figcaption>
</figure>


### How can I find out the platform and architecture of my system?  

- On **Windows OS**, open a Windows command-line interface (`cmd.exe`).  
    - To find out your system's OS, type,  
```shell
echo %OS%
```
    which should result in an answer like the following,  
```
Windows_NT
```  
    - To check your system's platform/architecture, type,  
```shell
echo %PLATFORM%
```
    which should result in an answer like the following,  
```
x64
```
    or,  
```shell
echo %PROCESSOR_ARCHITECTURE%
```  
    which should result in an answer like the following,  
```
AMD64
```
    if your system's architecture is `amd64`.  

<br>

- On **Unix-like OS** (Linux/macOS), open a Bash shell.  
    - To find out your system's OS, type,  
```shell
uname -s
```
    which should result in an answer like the following,  
```
Linux
```  
    or,  
```
Darwin
```  
    depending on the type of your OS.  
    - To check your system's platform/architecture, type,  
```shell
uname -m
```
    which should result in an answer like the following,  
```
x86_64
```
    if your system's architecture is `amd64`.  




{% include askme.html %}
{% include links.html %}
