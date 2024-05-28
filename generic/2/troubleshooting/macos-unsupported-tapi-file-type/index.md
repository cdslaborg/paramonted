---
title: "ld: unsupported tapi file type '!tapi-tbd' in YAML file"
tags: [multivariate, normal, sampling, paradram]
keywords: 
        troubleshooting
        compilation
        CMake
        macOS
        xcode
        Conda
        Python
        Darwin
        Fortran
        C++
        C
#summary: "."
sidebar: home_sidebar
#permalink: /program-units/functions/index.html
last_updated: March 14, 2024
mathjax: true
---

{% comment %}
1. [web-link](){:target="_blank"}  
C/C++ examples documentation is currently being developed. Please check back in a few days, or contact the authors for quick help.  
<div id="toc"></div>  
{{site.data.alerts.note}}
{% include build.windows.drive.change.md %}
{{site.data.alerts.end}}
{% endcomment %}

## Problem  

While building the ParaMonte library on a macOS (Darwin) operating system, you may encounter an error of the following nature:  

```bash  
CMake Error at /opt/homebrew/Cellar/cmake/3.23.1/share/cmake/Modules/CMakeTestFortranCompiler.cmake:61 (message):
  The Fortran compiler

    "/opt/homebrew/bin/gfortran-14"

  is not able to compile a simple test program.

  It fails with the following output:

    Change Dir: /Users/unknown/git/paramonte/bld/darwin/arm64/gnu/csvs/release/shared/heap/serial/nocheck/fortran/CMakeFiles/CMakeTmp
    
    Run Build Command(s):/usr/bin/make -f Makefile cmTC_f9501/fast && /Library/Developer/CommandLineTools/usr/bin/make  -f CMakeFiles/cmTC_f9501.dir/build.make CMakeFiles/cmTC_f9501.dir/build
    Building Fortran object CMakeFiles/cmTC_f9501.dir/testFortranCompiler.f.o
    /opt/homebrew/bin/gfortran-14   -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX13.1.sdk -mmacosx-version-min=12.4 -c /Users/unknown/git/paramonte/bld/darwin/arm64/gnu/csvs/release/shared/heap/serial/nocheck/fortran/CMakeFiles/CMakeTmp/testFortranCompiler.f -o CMakeFiles/cmTC_f9501.dir/testFortranCompiler.f.o
    Linking Fortran executable cmTC_f9501
    /opt/homebrew/Cellar/cmake/3.23.1/bin/cmake -E cmake_link_script CMakeFiles/cmTC_f9501.dir/link.txt --verbose=1
    /opt/homebrew/bin/gfortran-14  -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX13.1.sdk -mmacosx-version-min=12.4 CMakeFiles/cmTC_f9501.dir/testFortranCompiler.f.o -o cmTC_f9501 
    ld: unsupported tapi file type '!tapi-tbd' in YAML file '/Library/Developer/CommandLineTools/SDKs/MacOSX13.1.sdk/usr/lib/libSystem.tbd' for architecture arm64
    collect2: error: ld returned 1 exit status
    make[1]: *** [cmTC_f9501] Error 1
    make: *** [cmTC_f9501/fast] Error 2
```  

The likely cause of the above or similar errors is that the `ld` linker application is incompatible with the macOS CommandLineTools SDK.  
This is particularly true if there is an Anaconda software installed on the macOS, whose incompatible `ld` binary shadows the operating system's default (compatible) `ld` binary.  
This can be checked by searching for all available `ld` binaries on the command line `PATH` environmental variable,
```bash  
which -a ld
```  

which could yield,

```bash  
/Users/unknown/anaconda3/bin/ld
/usr/bin/ld
```  

## Solution  

1.  One solution is to reorder the contents of the `PATH` environmental variable to make the system's `ld` binary identifiable before any 3rd-party `ld` binary.   
1.  Alternatively, if the conflicting `ld` binary belongs to Anaconda software or the Conda package manager, one can temporarily deactivate Anaconda via,
    ```bash  
    conda deactivate
    ```  
    To reactivate the Anaconda environment, try:
    ```bash  
    conda activate
    ```  

{% include askme.html %}
{% include links.html %}
