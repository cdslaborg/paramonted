{% assign osname = include.os|downcase %}
{% if include.os == "Linux" %}
    {% assign pmLibExt = "so" %}
{% elsif include.os == "macOS" %}
    {% assign osname = "Darwin" %}
    {% assign pmLibExt = "dylib" %}
{% elsif include.os == "Windows" %}
    {% assign pmLibExt = "dll" %}
{% endif %}

{% capture pmLibName %}libparamonte_{{pmLang|downcase|replace:"+","p"}}_{{osname|downcase}}_amd64_{{include.pmcs|downcase}}_release_shared_heap{% endcapture %}
{% capture pmLibNameMPI %}libparamonte_{{pmLang|downcase|replace:"+","p"}}_{{osname|downcase}}_amd64_{{include.pmcs|downcase}}_release_shared_heap_impi{% endcapture %}

### Building the executable on **Windows** via the **Intel {{progLang}} compiler**  

{% include build.flags.md os="Windows" pmcs="Intel" %}

#### Building the executable on Windows via the Intel {{progLang}} compiler for **serial applications**  

-   {{ donwloadParaMonteFrom }} [here]({{site.currentReleaseDownload}}/{{pmLibName}}.zip).  
{% include build.pmlib.files.md pmcs=include.pmcs ptype="serial" os="Windows" %}
-   Now, we are going to use the Intel {{progLang}} compiler to compile and link your code,  
    {% if pmLang == "Fortran" %}
    ```batch
    {{fppFlagsCmd}}
    ```  
    {% endif %}
    ```batch
    set "COMPILER_LINKER_FLAGS={{releaseFlags}}"
    ```  
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    {% if pmLang == "C" or pmLang == "C++" %}
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    ```batch
    icl %COMPILER_LINKER_FLAGS% logfunc.{{progLangExt}} main.{{progLangExt}} {{pmLibName}}.lib /link /out:main.exe
    ```  
    ```  
    Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.4.245 Build 20190417
    Copyright (C) 1985-2019 Intel Corporation.  All rights reserved.

    logfunc.{{progLangExt}}
    main.{{progLangExt}}
    Microsoft (R) Incremental Linker Version 14.22.27905.0
    Copyright (C) Microsoft Corporation.  All rights reserved.

    -out:main.exe
    C:\Users\SHAHMO~1\AppData\Local\Temp\ipo_4826420.obj
    {{pmLibName}}.lib
    ```  
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    {% elsif pmLang == "Fortran" %}
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    ```batch
    ifort %COMPILER_LINKER_FLAGS% %PREPROCESSOR_FLAGS% paramonte.f90 logfunc.f90 main.f90 {{pmLibName}}.lib -o main.exe
    ```  
    ```  
    Intel(R) Visual Fortran Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.4.245 Build 20190417
    Copyright (C) 1985-2019 Intel Corporation.  All rights reserved.

    Microsoft (R) Incremental Linker Version 14.22.27905.0
    Copyright (C) Microsoft Corporation.  All rights reserved.

    -out:main.exe
    -subsystem:console
    logfunc.obj
    main.obj
    {{pmLibName}}.lib
    ```  
    Note the **missing** `/DIS_COMPATIBLE_COMPILER` macro definition as the value of the `PREPROCESSOR_FLAGS` environmental variable, implying that we have used the old-style, but more-portable Fortran interface to the ParaMonte library.  
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    {% endif %}
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
-   {{ runApplication }}  

#### Building the executable on Windows via the Intel {{progLang}} compiler for **parallel applications**  

-   For simplicity, we will only consider the MPI-parallelism here. {{ donwloadParaMonteFrom }} [here]({{site.currentReleaseDownload}}/{{pmLibNameMPI}}.zip).  
{% include build.pmlib.files.md pmcs="Intel" ptype="MPI" os=osname %}
-   Now, we are going to use the Intel {{progLang}} MPI compiler wrapper to compile and link your code,  
    {% if pmLang == "Fortran" %}
    ```batch
    {{fppFlagsCmd}}
    ```  
    {% endif %}
    ```batch
    set "COMPILER_LINKER_FLAGS={{releaseFlags}}"
    ```  
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    {% if pmLang == "C" or pmLang == "C++" %}
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    ```batch
    mpiicc %COMPILER_LINKER_FLAGS% logfunc.c main.c {{pmLibNameMPI}}.lib /link /out:main.exe
    ```  
    ```  
    mpicc.bat for the Intel(R) MPI Library 2019 Update 4 for Windows*
    Copyright 2007-2019 Intel Corporation.

    Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.4.245 Build 20190417
    Copyright (C) 1985-2019 Intel Corporation.  All rights reserved.

    logfunc.{{progLangExt}}
    main.{{progLangExt}}
    Microsoft (R) Incremental Linker Version 14.22.27905.0
    Copyright (C) Microsoft Corporation.  All rights reserved.

    -out:main.exe
    "/LIBPATH:C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019.4.245\windows\mpi\intel64\bin\..\..\intel64\lib\release"
    "/LIBPATH:C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019.4.245\windows\mpi\intel64\bin\..\..\intel64\lib"
    impi.lib
    impicxx.lib
    C:\Users\SHAHMO~1\AppData\Local\Temp\ipo_4049220.obj
    {{pmLibNameMPI}}.lib
    ```  
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    {% elsif pmLang == "Fortran" %}
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    ```batch
    mpiifort %COMPILER_LINKER_FLAGS% %PREPROCESSOR_FLAGS% paramonte.f90 logfunc.f90 main.f90 {{pmLibNameMPI}}.lib -o main.exe
    ```  
    ```  
    mpifc.bat for the Intel(R) MPI Library 2019 Update 4 for Windows*
    Copyright 2007-2019 Intel Corporation.

    Intel(R) Visual Fortran Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.4.245 Build 20190417
    Copyright (C) 1985-2019 Intel Corporation.  All rights reserved.

    Microsoft (R) Incremental Linker Version 14.22.27905.0
    Copyright (C) Microsoft Corporation.  All rights reserved.

    -out:main.exe
    -subsystem:console
    "/LIBPATH:C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019.4.245\windows\mpi\intel64\bin\..\..\intel64\lib\release"
    "/LIBPATH:C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019.4.245\windows\mpi\intel64\bin\..\..\intel64\lib"
    impi.lib
    C:\Users\SHAHMO~1\AppData\Local\Temp\ipo_4449624.obj
    {{pmLibNameMPI}}.lib
    ```  
    Note the **missing** `/DIS_COMPATIBLE_COMPILER` macro definition as the value of the `PREPROCESSOR_FLAGS` environmental variable, implying that we have used the old-style, but more-portable Fortran interface to the ParaMonte library.  
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    {% endif %}
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
-   {{ runParallelApplication }}  

{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
{% if pmLang == "C" or pmLang == "C++" %}
{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}

### Building the executable on **Windows** via the **Microsoft Visual {{progLang}} compiler**  

{% include tip.html content="For directions on how to install the MSVC compiler on your system, follow steps 3 and 4 of the solution provided on [this page](https://www.cdslab.org/recipes/programming/intel-parallel-studio-installation-windows/intel-parallel-studio-installation-windows){:target='_blank'}." %}

Open an instance of the **x64 Native Tools Command Prompt** which is automatically installed on your system along with the MSVC compiler. As discussed in the [preamble](#preamble-setting-up-the-environment), this command-line comes with all the relevant compiler and linker environmental variables predefined in your session so that you won't need to manually modify the contents of the environmental `PATH` variable.  

{% include build.flags.md os="Windows" pmcs="msvc" %}

#### Building the executable on Windows via the Microsoft Visual {{progLang}} compiler for **serial applications**  

{% capture pmLibName    %}libparamonte_{{pmLang|downcase|replace:"+","p"}}_windows_amd64_intel_release_shared_heap{% endcapture %}
{% capture pmLibNameMPI %}{{pmLibName}}_impi{% endcapture %}

-   {{ donwloadParaMonteFrom }} [here]({{site.currentReleaseDownload}}/{{pmLibName}}.zip).  
{% include build.pmlib.files.md pmcs="msvc" ptype="serial" os="Windows" %}
-   Now, we are going to use the MSVC {{progLang}} compiler `cl` to compile and link your code,  
    ```batch
    set "COMPILER_LINKER_FLAGS={{releaseFlags}}"
    ```  
    ```batch
    cl %COMPILER_LINKER_FLAGS% logfunc.c main.c {{pmLibName}}.lib /link /out:main.exe
    ```  
    ```  
    Microsoft (R) C/C++ Optimizing Compiler Version 19.22.27905 for x64
    Copyright (C) Microsoft Corporation.  All rights reserved.

    logfunc.{{progLangExt}}
    main.{{progLangExt}}
    Generating Code...
    Microsoft (R) Incremental Linker Version 14.22.27905.0
    Copyright (C) Microsoft Corporation.  All rights reserved.

    /out:logfunc.exe
    /out:main.exe
    logfunc.obj
    main.obj
    {{pmLibName}}.lib
    ```  
-   {{ runApplication }}

#### Building the executable on Windows via the Microsoft Visual {{progLang}} compiler for **parallel applications**  

{% include warning.html content="At this point, you need to have an MPI library already installed on your system. All **prebuilt** ParaMonte libraries on Windows OS rely on the Intel MPI library. Therefore, if you intend to use the prebuilt ParaMonte libraries for your C/C++ applications, you will have to install [the Intel MPI library](https://software.intel.com/en-us/mpi-library){:target='_blank'} on your system before continuing." %}  

-   For simplicity, we will only consider the MPI-parallelism here. {{ donwloadParaMonteFrom }} [here]({{site.currentReleaseDownload}}/{{pmLibNameMPI}}.zip).  
{% include build.pmlib.files.md pmcs="Intel" ptype="MPI" os="Windows" %}
-   Now, we are going to use the Intel `mpicc` or `mpicl` {{progLang}} MPI compiler wrappers along with the Microsoft {{progLang}} compiler `cl.exe` (specified by the flag `-cc=cl`) to compile and link your code,  
    ```batch
    set "COMPILER_LINKER_FLAGS={{releaseFlags}}"
    ```  
    ```batch
    mpicc -cc=cl %COMPILER_LINKER_FLAGS% logfunc.c main.c {{pmLibNameMPI}}.lib /link /out:main.exe
    ```  
    ```  
    mpicc.bat for the Intel(R) MPI Library 2019 Update 4 for Windows*
    Copyright 2007-2019 Intel Corporation.

    Microsoft (R) C/C++ Optimizing Compiler Version 19.22.27905 for x64
    Copyright (C) Microsoft Corporation.  All rights reserved.

    logfunc.{{progLangExt}}
    main.{{progLangExt}}
    Generating Code...
    Microsoft (R) Incremental Linker Version 14.22.27905.0
    Copyright (C) Microsoft Corporation.  All rights reserved.

    /out:logfunc.exe
    "/LIBPATH:C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019.4.245\windows\mpi\intel64\bin\..\..\intel64\lib\release"
    "/LIBPATH:C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019.4.245\windows\mpi\intel64\bin\..\..\intel64\lib"
    -out:main.exe
    impi.lib
    impicxx.lib
    logfunc.obj
    main.obj
    {{pmLibNameMPI}}.lib
    ```  
    {{site.data.alerts.tip}}
    While building your parallel application, if you encounter linking errors similar to 
    <pre>
    LINK : fatal error LNK1181: cannot open input file 'impi.lib'
    </pre>
    then see <a href="../../troubleshooting/finding-mpi-libraries-on-windows/" target="_blank">this troubleshooting page</a> for a possible resolution.
    {{site.data.alerts.end}}
-   {{ runParallelApplication }}  

{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
{% endif %}
{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
