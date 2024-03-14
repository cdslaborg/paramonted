### Compiling and linking on **Windows** via the **Intel {{progLang}} compiler**  

{% include example.build.flags.md os="windows" pmcs="intel" %}

#### Compiling and linking on Windows via the Intel {{progLang}} compiler for **serial applications**  

-   {{ donwloadParaMonteFrom }} [here]({{site.currentReleaseDownload}}/{{site.pmVersion}}/libparamonte_dynamic_heap_release_intel_{{pmLang|downcase}}_windows_x64_mt.zip).  
{% include example.build.pmlib.files.md pmcs="intel" ptype="serial" os="windows" %}
-   Now, we are going to use the Intel {{progLang}} compiler to compile and link your code,  
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    {% if pmLang == "C" %}
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    ```text
    icl %COMPILER_LINKER_FLAGS% logfunc.c main.c libparamonte_dynamic_heap_release_intel_c_windows_x64_mt.lib /link /out:main.exe
    ```  
    ```  
    Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.4.245 Build 20190417
    Copyright (C) 1985-2019 Intel Corporation.  All rights reserved.

    logfunc.c
    main.c
    Microsoft (R) Incremental Linker Version 14.22.27905.0
    Copyright (C) Microsoft Corporation.  All rights reserved.

    -out:main.exe
    C:\Users\SHAHMO~1\AppData\Local\Temp\ipo_4826420.obj
    libparamonte_dynamic_heap_release_intel_c_windows_x64_mt.lib
    ```  
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    {% elsif pmLang == "Fortran" %}
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    ```text
    ifort %PREPROCESSOR_FLAGS% %COMPILER_LINKER_FLAGS% logfunc.f90 main.f90 libparamonte_dynamic_heap_release_intel_fortran_windows_x64_mt.lib -o main.exe
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
    libparamonte_dynamic_heap_release_intel_fortran_windows_x64_mt.lib
    ```  
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    {% endif %}
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
-   {{ runApplication }}  

#### Compiling and linking on Windows via the Intel {{progLang}} compiler for **parallel applications**  

-   For simplicity, we will only consider the MPI-parallelism here. {{ donwloadParaMonteFrom }} [here]({{site.currentReleaseDownload}}/libparamonte_dynamic_heap_release_intel_{{pmLang|downcase}}_mpi_windows_x64_mt.zip).  
{% include example.build.pmlib.files.md pmcs="intel" ptype="MPI" os="windows" %}
-   Now, we are going to use the Intel {{progLang}} MPI compiler wrapper to compile and link your code,  
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    {% if pmLang == "C" %}
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    ```text
    mpiicc %COMPILER_LINKER_FLAGS% logfunc.c main.c libparamonte_dynamic_heap_release_intel_c_mpi_windows_x64_mt.lib /link /out:main.exe
    ```  
    ```  
    mpicc.bat for the Intel(R) MPI Library 2019 Update 4 for Windows*
    Copyright 2007-2019 Intel Corporation.

    Intel(R) C++ Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.4.245 Build 20190417
    Copyright (C) 1985-2019 Intel Corporation.  All rights reserved.

    logfunc.c
    main.c
    Microsoft (R) Incremental Linker Version 14.22.27905.0
    Copyright (C) Microsoft Corporation.  All rights reserved.

    -out:main.exe
    "/LIBPATH:C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019.4.245\windows\mpi\intel64\bin\..\..\intel64\lib\release"
    "/LIBPATH:C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019.4.245\windows\mpi\intel64\bin\..\..\intel64\lib"
    impi.lib
    impicxx.lib
    C:\Users\SHAHMO~1\AppData\Local\Temp\ipo_4049220.obj
    libparamonte_dynamic_heap_release_intel_c_mpi_windows_x64_mt.lib
    ```  
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    {% elsif pmLang == "Fortran" %}
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    ```text
    mpiifort %PREPROCESSOR_FLAGS% %COMPILER_LINKER_FLAGS% logfunc.f90 main.f90 libparamonte_dynamic_heap_release_intel_fortran_mpi_windows_x64_mt.lib -o main.exe
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
    libparamonte_dynamic_heap_release_intel_fortran_mpi_windows_x64_mt.lib
    ```  
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
    {% endif %}
    {% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
-   {{ runMpiApplication }}  

{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
{% if pmLang == "C" %}
{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}

### Compiling and linking on **Windows** via the **Microsoft Visual {{progLang}} compiler**  

{% include tip.html content="For directions on how to install the MSVC compiler on your system, follow steps 3 and 4 of the solution provided on [this page](https://www.cdslab.org/recipes/programming/intel-parallel-studio-installation-windows/intel-parallel-studio-installation-windows){:target='_blank'}." %}

If you choose to use the [MSVC {{progLang}} compiler](https://en.wikipedia.org/wiki/Microsoft_Visual_C%2B%2B){:target="_blank"} `cl`, then we strongly recommend you to use the Microsoft Visual Studio's customized command-line interface that is automatically installed on your system along with the compiler. It is normally named **x64 Native Tools Command Prompt for VS 2XXX**, where `2XXX` is the version of the MSVC you have installed on your system. You can access it from the Windows startup menu as illustrated in the figure below, where the Microsoft Visual Studio 2019 is located (as well as an older existing installation of the Visual Studio 2017).  

![Microsoft Visual Studio's customized command-line interface]({{site.baseurl}}/images/msvc_cmd.png){:target="_blank"}  
<br>

Open an instance of the x64 Native Tools Command Prompt which is automatically installed on your system along with the MSVC compiler. This command-line comes with all the relevant compiler and linker environmental variables predefined in your session so that you won't need to manually modify the contents of the environmental `PATH` variable.  

{% include important.html content="It is imperative that you open an x64-compatible version of the MSVC command prompt, just as shown in the above. The ParaMonte library binaries are exclusively built for x64 (x86_64) type of architecture and therefore any compilation and linking via non-x64 tools will fail." %}

{% include example.build.flags.md os="windows" pmcs="msvc" %}

#### Compiling and linking on Windows via the Microsoft Visual {{progLang}} compiler for **serial applications**  

-   {{ donwloadParaMonteFrom }} [here]({{site.currentReleaseDownload}}/libparamonte_dynamic_heap_release_intel_{{pmLang|downcase}}_windows_x64_mt.zip).  
{% include example.build.pmlib.files.md pmcs="msvc" ptype="serial" os="windows" %}
-   Now, we are going to use the MSVC {{progLang}} compiler `cl` to compile and link your code,  
    ```text
    cl %COMPILER_LINKER_FLAGS% logfunc.c main.c libparamonte_dynamic_heap_release_intel_c_windows_x64_mt.lib /link /out:main.exe
    ```  
    ```  
    Microsoft (R) C/C++ Optimizing Compiler Version 19.22.27905 for x64
    Copyright (C) Microsoft Corporation.  All rights reserved.

    logfunc.c
    main.c
    Generating Code...
    Microsoft (R) Incremental Linker Version 14.22.27905.0
    Copyright (C) Microsoft Corporation.  All rights reserved.

    /out:logfunc.exe
    /out:main.exe
    logfunc.obj
    main.obj
    libparamonte_dynamic_heap_release_intel_c_windows_x64_mt.lib
    ```  
-   {{ runApplication }}

#### Compiling and linking on Windows via the Microsoft Visual {{progLang}} compiler for **parallel applications**  

{% include warning.html content="At this point, you need to have an MPI library already installed on your system. All **prebuilt** ParaMonte libraries on Windows OS rely on the Intel MPI library. Therefore, if you intend to use the prebuilt ParaMonte libraries for your C/C++ applications, you will have to install [the Intel MPI library](https://software.intel.com/en-us/mpi-library){:target='_blank'} on your system before continuing." %}  

-   For simplicity, we will only consider the MPI-parallelism here. {{ donwloadParaMonteFrom }} [here]({{site.currentReleaseDownload}}/libparamonte_dynamic_heap_release_intel_{{pmLang|downcase}}_mpi_windows_x64_mt.zip).  
{% include example.build.pmlib.files.md pmcs="intel" ptype="MPI" os="windows" %}
-   Now, we are going to use the Intel `mpicc` or `mpicl` {{progLang}} MPI compiler wrappers along with the Microsoft {{progLang}} compiler `cl.exe` (specified by the flag `-cc=cl`) to compile and link your code,  
    ```text
    mpiicc -cc=cl %COMPILER_LINKER_FLAGS% logfunc.c main.c libparamonte_dynamic_heap_release_intel_c_mpi_windows_x64_mt.lib /link /out:main.exe
    ```  
    ```  
    mpicc.bat for the Intel(R) MPI Library 2019 Update 4 for Windows*
    Copyright 2007-2019 Intel Corporation.

    Microsoft (R) C/C++ Optimizing Compiler Version 19.22.27905 for x64
    Copyright (C) Microsoft Corporation.  All rights reserved.

    logfunc.c
    main.c
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
    libparamonte_dynamic_heap_release_intel_c_mpi_windows_x64_mt.lib
    ```  
    {{site.data.alerts.note}}
    <b>Troubleshooting</b>: While compiling and linking your application from within the MSVC <code>x64</code> or <code>x86_64</code> command prompts, you may receive such linking errors as the following,  
    <br>
    <pre>
    LINK : fatal error LNK1181: cannot open input file 'impi.lib'
    ERROR in the compiling/linking [2]
    </pre>
    This error implies that the path to your Intel MPI library installation files is not properly setup in your environment. You can fix the error by calling the Intel's dedicated Batch script <code>mpivars.bat</code> that Intel has developed solely for the purpose of setting up the MPI environmental variables and paths before using the Intel MPI library. For detailed instructions on how to set up your Intel MPI enviroment see <a href="https://software.intel.com/en-us/get-started-with-mpi-for-windows" target="_blank">Getting Started with Intel® MPI Library for Windows OS (Beta)</a>. In brief, this script normally lives in a directory like,  
    <pre>
    C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019.4.245\windows\mpi\intel64\bin\mpivars.bat
    </pre>
    Locate this setup-script on your system and execute the contents of it on your command line, like the following,  
    <pre>
    D:\example>"C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019.4.245\windows\mpi\intel64\bin\mpivars.bat"

    Intel(R) MPI Library 2019 Update 4 for Windows* Target Build Environment for Intel(R) 64 applications
    Copyright 2007-2019 Intel Corporation.

    </pre>
    Notice the use of double-quotations around the path to the script. This is ensure that any special <b>escape characters</b> in the path (such as <b>white-space</b> characters) are properly taken care of.
    {{site.data.alerts.end}}
-   {{ runMpiApplication }}  

{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
{% endif %}
{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
