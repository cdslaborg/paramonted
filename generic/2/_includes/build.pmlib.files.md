{% assign windowsDriveChange = "If you encounter difficulties in navigating to your target build folder on the command-prompt, see [the troubleshooting page](../../troubleshooting/windows-drive-change/){:target='_blank'} for the possible cause and the solution." %}

{% if include.ptype == "MPI" %}
    {% if include.pmcs == "Intel" %}
        {% assign ptype = "_impi" %}
    {% elsif include.os == "Linux" and include.pmcs == "GNU" %}
        {% assign ptype = "_mpich" %}
    {% endif %}
{% else %}
    {% assign ptype = "" %}
{% endif %}

{% assign osname = include.os %}
{% if include.os == "Linux" %}
    {% assign pmLibExt = "so" %}
{% elsif include.os == "macOS" %}
    {% assign osname = "Darwin" %}
    {% assign pmLibExt = "dylib" %}
{% endif %}

-   Navigate to the folder containing the ParaMonte library on your local system. Move your {{progLang}} example codes to this folder (This will overwrite the existing `logfunc.{{progLangExt}}` and `main.{{progLangExt}}` files in this folder with yours). You should then be able to see the following files inside the folder,  
    {% if include.os == "Windows" %}
    ```batch
    dir /a /b /n
    ```  
    {% if pmLang == "C" or pmLang == "C++" %}
    ```  
    build.bat
    libparamonte_{{pmLang|downcase|replace:"+","p"}}_{{osname|downcase}}_x64_{{include.pmcs|downcase}}_release_shared_heap{{ptype}}.dll
    libparamonte_{{pmLang|downcase|replace:"+","p"}}_{{osname|downcase}}_x64_{{include.pmcs|downcase}}_release_shared_heap{{ptype}}.exp
    libparamonte_{{pmLang|downcase|replace:"+","p"}}_{{osname|downcase}}_x64_{{include.pmcs|downcase}}_release_shared_heap{{ptype}}.lib
    logfunc.{{pmLang|downcase|replace:"+","p"}}
    logfunc.{{progHeadExt|replace:"+","p"}}
    main.{{pmLang|downcase|replace:"+","p"}}
    paramonte.{{progHeadExt|replace:"+","p"}}
    paramonte.in
    README.md
    ```  
    {% elsif pmLang == "Fortran" %}
    ```  
    build.bat
    libparamonte_{{pmLang|downcase|replace:"+","p"}}_{{osname|downcase}}_x64_{{include.pmcs|downcase}}_release_shared_heap{{ptype}}.dll
    libparamonte_{{pmLang|downcase|replace:"+","p"}}_{{osname|downcase}}_x64_{{include.pmcs|downcase}}_release_shared_heap{{ptype}}.exp
    libparamonte_{{pmLang|downcase|replace:"+","p"}}_{{osname|downcase}}_x64_{{include.pmcs|downcase}}_release_shared_heap{{ptype}}.lib
    logfunc.{{pmLang|downcase|replace:"+","p"}}
    main.{{pmLang|downcase|replace:"+","p"}}
    paramonte.in
    README.md
    ```  
    {% endif %}
    {% include tip.html content = windowsDriveChange %}
    {% else %}
    ```bash
    ls -1
    ```  
    {% if pmLang == "C" or pmLang == "C++" %}
    ```  
    build.sh
    libparamonte_{{pmLang|downcase|replace:"+","p"}}_{{osname|downcase}}_x64_{{include.pmcs|downcase}}_release_shared_heap{{ptype}}.{{pmLibExt}}
    logfunc.{{progLangExt}}
    logfunc.{{progHeadExt}}
    main.{{progLangExt}}
    paramonte.{{progHeadExt}}
    paramonte.in
    README.md
    ```  
    {% elsif pmLang == "Fortran" %}
    ```  
    build.sh
    libparamonte_{{pmLang|downcase|replace:"+","p"}}_{{osname|downcase}}_x64_{{include.pmcs|downcase}}_release_shared_heap{{ptype}}.{{pmLibExt}}
    logfunc.f90
    main.f90
    paramonte.in
    README.md
    ```  
    {% endif %}
    {% endif %}