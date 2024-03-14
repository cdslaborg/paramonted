{% if include.ptype == "mpich" %}
    {% assign pname = "_mpixxxx" %}
{% else %}
    {% assign pname = "" %}
{% endif %}

{% assign osname = include.os|downcase %}
{% if include.os == "Linux" %}
    {% assign pmLibExt = "so" %}
{% elsif include.os == "macOS" %}
    {% assign osname = "Darwin" %}
    {% assign pmLibExt = "dylib" %}
{% endif %}

-   Navigate to the folder containing the ParaMonte library on your local system. Move your {{progLang}} example codes to this folder (This will overwrite the existing `logfunc.{{progLangExt}}` and `main.{{progLangExt}}` files in this folder with yours). You should then be able to see the following files inside the folder,  
    {% if include.os == "Windows" %}
    {% if pmLang == "C" %}
    ```text
    dir /a /b /n
    ```  
    ```  
    build.bat
    libparamonte_dynamic_heap_release_intel_c_{{include.ptype}}windows_x64_mt.dll
    libparamonte_dynamic_heap_release_intel_c_{{include.ptype}}windows_x64_mt.exp
    libparamonte_dynamic_heap_release_intel_c_{{include.ptype}}windows_x64_mt.lib
    logfunc.c
    logfunc.h
    main.c
    paramonte.h
    paramonte.in
    README.md
    ```  
    {% elsif pmLang == "Fortran" %}
    ```text
    C:\Program Files (x86)\IntelSWTools> d:

    D:\> cd D:\example

    D:\example> dir /a /b /n
    ```  
    ```  
    build.bat
    libparamonte_dynamic_heap_release_intel_fortran_{{pname}}windows_x64_mt.dll
    libparamonte_dynamic_heap_release_intel_fortran_{{pname}}windows_x64_mt.exp
    libparamonte_dynamic_heap_release_intel_fortran_{{pname}}windows_x64_mt.lib
    logfunc.f90
    main.f90
    paramonte.in
    README.md
    ```  
    {% endif %}
    {{site.data.alerts.tip}}
    {% include example.build.windows.drive.change.md pmcs="Intel" %}
    {{site.data.alerts.end}}
    {% else %}
    ```text
    ls -1
    ```  
    {% if pmLang == "C" %}
    ```  
    build.sh
    libparamonte_dynamic_heap_release_intel_{{pmLang|downcase}}_{{pname}}{{osname|downcase}}_x64_mt.{{pmLibExt}}
    logfunc.c
    logfunc.h
    main.c
    paramonte.h
    paramonte.in
    README.md
    ```  
    {% elsif pmLang == "Fortran" %}
    ```  
    build.sh
    libparamonte_dynamic_heap_release_intel_{{pmLang|downcase}}_{{pname}}{{osname|downcase}}_x64_mt.{{pmLibExt}}
    logfunc.f90
    main.f90
    paramonte.in
    README.md
    ```  
    {% endif %}
    {% endif %}