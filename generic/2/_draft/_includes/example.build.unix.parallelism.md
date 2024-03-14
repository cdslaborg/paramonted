{% if include.ptype == "MPI" %}
    {% assign compilerBrand = include.pmcs progLang compiler "wrapper" %}
    {% assign thisApplicationParallelism = "MPI-parallel applications" %}
{% elsif include.ptype == "serial" %}
    {% assign thisApplicationParallelism = "serial applications" %}
    {% assign compilerBrand = include.pmcs progLang compiler %}
{% endif %}

{% assign osname = include.os|downcase %}
{% if include.os == "Linux" %}
    {% assign pmLibExt = "so" %}
{% elsif include.os == "macOS" %}
    {% assign osname = "Darwin" %}
    {% assign pmLibExt = "dylib" %}
{% endif %}

#### Compiling and linking on {{include.os}} via the {{include.pmcs}} {{progLang}} compiler for **{{thisApplicationParallelism}}**  

-   {{ donwloadParaMonteFrom }} [here]({{site.currentReleaseDownload}}/libparamonte_dynamic_heap_release_{{include.pmcs|downcase}}_{{pmLang|downcase}}_linux_x64_mt.tar.gz).  
{% include example.build.pmlib.files.md ptype=include.ptype pmcs=include.pmcs os=include.os %}
-   Now, we are going to use the {{compilerBrand}} to compile and link your code,  
    {% if pmLang == "Fortran" %}
        {% assign ppFlags = "$PREPROCESSOR_FLAGS " %}
    ```text
    {{fppFlagsCmd}}  # the missing macro definition implies we are using the old-style-Fortran interface to the ParaMonte library
    ```  
    {% else %}
        {% assign ppFlags = "" %}
    {% endif %}
    ```text
    export COMPILER_LINKER_FLAGS="{{releaseFlags}}"
    ```  
    ```text
    {{compilerName}} {{ppFlags}}$COMPILER_LINKER_FLAGS logfunc.{{progLangExt}} main.{{progLangExt}} libparamonte_dynamic_heap_release_{{include.pmcs|downcase}}_{{pmLang|downcase}}_{{osname|downcase}}_x64_mt.{{pmLibExt}} -o main.exe
    ```  
-   {{ runApplication }}  
