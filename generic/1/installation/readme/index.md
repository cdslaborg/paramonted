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
last_updated: January 1, 2020
mathjax: true
---
{% comment %}
[](){:target="_blank"}
{% if pmSampler == "ParaDRAM" %}
{% endif %}
{% endcomment %}
<br>


## Naming convention used for ParaMonte library builds  

Across all supported Operating Systems (OS) and platforms / architectures, a universal naming convention is currently used to build the ParaMonte kernel libraries,  

```
libparamonte_<interface language: c/cpp/fortran/matlab/python/r/...>_<OS: windows/linux/darwin/...>_<architecture: x64/x86/...>_<compiler suite: intel/gnu/...>_<build type: release/testing/debug>_<library type: shared/static>_<memory allocation type: stack/heap>_<parallelism library/type: (none)/mpi/impi/mpich/openmpi/cafsingle/cafshared/cafdistributed/...>.<library file extension: dll/lib/so/a/dylib>  
```  

where,  

- **interface language** can be either:
    - **c**: indicating a library build that is meant to be called and used from C or C-complaint main applications.  
    - **cpp**: indicating a library build that is meant to be called and used from C++ main applications.  
    - **fortran**: indicating a library build that is meant to be called and used from Fortran main applications.  
    - **matlab**: indicating a library build that is meant to be called and used from MATLAB main applications.  
    - **python**: indicating a library build that is meant to be called and used from Python main applications.  
    - **r**: indicating a library build that is meant to be called and used from R main applications.  
    {% comment %}
    {% include tip.html content="Both Fortran and C library interfaces can be used from both languages as well as others (e.g., Python). However, for Fortran main applications, the use of the C-interface ParaMonte library build will be far less flexible than the full-fledged Object-Oriented Fortran-interface. Conversely, calling the Fortran-interface ParaMonte library builds from non-Fortran main applications will be likely challenging, unless the user deeply familiar with all the details of C-Fortran interoperability and mixed-language programming." %}  
    {% endcomment %}

- **operating system type** can be either:
    - **windows**: indicating a library that can only be used on Windows OS, or,  
    - **darwin**: indicating a library that can only be used on macOS, or,  
    - **linux**: indicating a library that can only be used on Linux OS, or,  
    - some other name (or **unknown** if it cannot be identified), indicating a library build that is meant to be used on the specific OS for which the library has been built.  
    {% include note.html content="The ParaMonte build-scripts have only been tested on Windows, Linux, and Darwin operating systems. However, it should be possible to build ParaMonte on any other platform or architecture on which 1. the GNU compiler Collection or the Intel Parallel Studio can be installed, 2. a Unix Bash script or a Windows Bash script can run." %}  

- **architecture type** can be either:
    - **x64**: indicating a library that is built usage on `amd64` 64-bit architectures (also known as `x86_64`), or,  
    - some other architecture (or **unknown** if it cannot be identified), indicating a library build that is meant to be used on the specific architecture for which the library has been built.  
    {% include important.html content="`x64` does NOT stand for Intel's 64-bit architecture `IA-64`  (also called Intel Itanium architecture)." %}  

- **compiler suite** can be any ParaMonte-compatible compiler vendor name that you are using to build the ParaMonte library. Currently, the ParaMonte build-scripts support only:
    -   **intel**: 
        on Windows and Linux OS for both serial and parallel ParaMonte library builds, as well as on Darwin (macOS), but only for serial ParaMonte library builds,  
        {{site.data.alerts.important}}
        The minimum Intel compiler versions required for building the ParaMonte library from source are,
        <br>
        <ul>
            <li>
                <b>Intel icl / ifort &#8805; {{site.intelVersionWindows}}</b> on <b>Windows</b>, 
            </li>
            <li>
                <b>Intel icc / icpc / ifort &#8805; {{site.intelVersionLinux}}</b> on <b>Linux</b>, 
            </li>
            <li>
                <b>Intel icc / icpc / ifort &#8805; {{site.intelVersionDarwin}}</b> on <b>macOS (Darwin)</b>, 
            </li>
        </ul> 
        {{site.data.alerts.end}}
    -   **gnu**: 
        on Linux and Darwin OS for both serial and parallel ParaMonte library builds.  
        {{site.data.alerts.important}}
        The minimum GNU compiler versions required for building ParaMonte library are <b>GNU gcc / g++ / gfortran > {{site.gnuVersionMinimum}}</b>.
        {{site.data.alerts.end}}

- **build type** can be either:
    - **release**: indicating a build with compiler flags that ensure the fastest possible simulations at runtime, or,  
    - **testing**: indicating a build with compiler default optimization flags used only for testing purposes, or,  
    - **debug**: indicating a build with compiler flags that enable tracing of any compile-time or run-time errors.  
    {% include tip.html content="If you are not sure which one is appropriate for your case, always choose `release`. In general, the `debug` and `testing` build types are mostly useful to developers and professional programmers. In some cases where the code consistently crashes in the release mode, it may be useful to run the same simulation using a `debug` build of the library to trace the source of the runtime error in the code." %}  

- **library type** can be either:
    - **shared**: indicating a dynamically-linked ParaMonte library build, or,  
    - **static**: indicating a statically-linked (archive) ParaMonte library build.  
    {% include tip.html content="If you are not sure which library type is suitable in your case, choose shared over static ParaMonte library builds." %}  

- **memory allocation type** can be either:
    - **stack**: indicating static allocation of all automatic arrays and arrays created for temporary computations on the [stack](https://en.wikipedia.org/wiki/Stack-based_memory_allocation){:target="_blank"}, or,  
    - **heap**: indicating heap allocation of all automatic arrays and arrays created for temporary computations on the [heap](https://en.wikipedia.org/wiki/Memory_management#HEAP){:target="_blank"}).  
    {% include tip.html content="In general, stack memory allocation can lead to slightly more efficient codes than heap memory allocation. However, applications that use stack for temporary memory allocations often run into the **stack overflow** kind of errors caused by the application reaching its maximum stack memory usage limit that is set by the operating system. While the stack size for an application can be often increased on both Windows and Unix-like OS, it can be potentially a challenging task for programmers with insufficient experience. Therefore, **if you do not know the difference between stack vs. heap memory allocation, always choose heap-enabled ParaMonte library builds to avoid unexpected `stack overflow` errors**." %}  

- **parallelism type** can be either:
    - **NULL**: or nothing (empty), indicating no parallelism, that is, a library built for serial simulations, or,  
    - **mpi**: indicating a library built via (some unknown brand) Message Passing Interface (MPI) that is meant to be linked against parallel main applications for parallel simulations via MPI, or,  
    - **impi**: indicating a library built via the Intel Message Passing Interface (MPI) that is meant to be linked against parallel main applications for parallel simulations via Intel MPI, or,  
    - **mpich**: indicating a library built via the MPICH Message Passing Interface (MPI) that is meant to be linked against parallel main applications for parallel simulations via MPICH MPI, or,  
    - **openmpi**: indicating a library built via the OpenMPI Message Passing Interface (MPI) that is meant to be linked against parallel main applications for parallel simulations via OpenMPI, or,  
    - **cafsingle**: indicating a library built via Coarray Fortran parallelism paradigm that is meant to be linked against Coarray parallel main applications optimized and usable for serial simulations only (i.e., no parallelization), or,  
    - **cafshared**: indicating a library built via Coarray Fortran parallelism paradigm that is meant to be linked against Coarray parallel main applications for coarray-enabled parallel simulations on shared-memory architecture, or,  
    - **cafdistributed**: indicating a library built via Coarray Fortran parallelism paradigm that is meant to be used for coarray-enabled parallel simulations on distributed-memory architecture, or,  
    {% include warning.html content="The three Coarray parallelism options are only available when the ParaMonte library is compiled via the Intel Fortran compiler. When compiled via the GNU Fortran compiler, the only option available is `cafsingle`. When compiled via the GNU Fortran compiler with [OpenCoarrays library](http://www.opencoarrays.org/), the sole option is `cafdistributed`. Also, the Coarray-enabled parallel ParaMonte libraries can only be built as static (archive) libraries. Also, the Coarray parallelism is exclusively available for ParaMonte library builds that are meant to be statically linked against **main** applications exclusively written in Fortran." %}  

{% comment %}
- **multithreading type** can be:
    - **mt**: indicating a library that is built via the multi-threaded compiler libraries.  
    {% include warning.html content="Although by default, all ParaMonte library builds are linked against the multi-threaded compiler libraries, the ParaMonte library by itself is not thread-safe. There is no need for thread-safety, since all multi-tasking features of the ParaMonte library are exclusively achieved via the distributed-memory (MPI/Coarray) parallelism paradigms." %}  
{% endcomment %}

## Supported platform and architecture  

The ParaMonte library is currently developed with the presumption that it will be used on Windows/Linux/macOS operating systems (OS) built on an `amd64` architecture system (also known as `x64` on Windows, and `x86_64` on Linux and macOS). There is, however, no technical or programming barrier to building ParaMonte for other architectures, as long as a compatible MPI and Fortran/C compilers are available on the specific platform and architecture of interest.  

### Why are the prebuilt ParaMonte libraries available only for the x64 architecture?  

As of 2020, the `amd64` processor architecture takes the lion share of the market demand (illustrated in the figure below). It would be very costly for the ParaMonte developers (in terms of energy, money, and time) to build and release the library for all available architectures in the market. Note, however, that the library can be built for usage on any architecture as long as a ParaMonte-compatible C/Fortran compiler can be installed on the system.  
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
