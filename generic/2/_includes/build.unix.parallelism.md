{% if include.ptype == "serial" %}

    {% assign ptype = "" %}
    {% capture compilerBrand %}{{include.pmcs}} {{progLang}} compiler{% endcapture %}
    {% assign thisApplicationParallelism = "serial applications" %}

    {% if pmLang == "C" %}
        {% if include.pmcs == "GNU" %}
            {% assign compilerName = "gcc" %}
        {% elsif include.pmcs == "Intel" %}
            {% assign compilerName = "icc" %}
        {% endif %}
    {% elsif pmLang == "C++" %}
        {% if include.pmcs == "GNU" %}
            {% assign compilerName = "g++" %}
        {% elsif include.pmcs == "Intel" %}
            {% assign compilerName = "icpc" %}
        {% endif %}
    {% elsif pmLang == "Fortran" %}
        {% if include.pmcs == "GNU" %}
            {% assign compilerName = "gfortran" %}
        {% elsif include.pmcs == "Intel" %}
            {% assign compilerName = "ifort" %}
        {% endif %}
    {% endif %}

{% elsif include.ptype == "MPI" %}

    {% assign openMPIMessage = "" %}
    {% assign thisApplicationParallelism = "MPI-parallel applications" %}

    {% if include.pmcs == "GNU" %}
        {% assign ptype = "_mpich" %}
    {% elsif include.pmcs == "Intel" %}
        {% assign ptype = "_impi" %}
    {% endif %}

    {% if pmLang == "C" %}

        {% if include.pmcs == "GNU" %}
            {% assign compilerName = "mpicc" %}
        {% elsif include.pmcs == "Intel" %}
            {% assign compilerName = "mpiicc" %}
        {% endif %}

    {% elsif pmLang == "C++" %}

        {% if include.pmcs == "GNU" %}
            {% assign compilerName = "mpicxx" %}
        {% elsif include.pmcs == "Intel" %}
            {% assign compilerName = "mpiicpc" %}
        {% endif %}

    {% elsif pmLang == "Fortran" %}

        {% if include.pmcs == "GNU" %}
            {% assign compilerName = "mpifort" %}
        {% elsif include.pmcs == "Intel" %}
            {% assign compilerName = "mpiifort" %}
        {% endif %}

    {% endif %}

    {% if include.pmcs == "GNU" %}
        {% if include.os == "Linux" %}
            {% capture compilerBrand %}MPICH MPI compiler wrapper for the {{include.pmcs}} {{progLang}} compiler{% endcapture %}
        {% elsif include.os == "macOS" %}
            {% capture compilerBrand %}Open-MPI compiler wrapper for the {{include.pmcs}} {{progLang}} compiler{% endcapture %}
        {% endif %}
    {% elsif include.pmcs == "Intel" %}
        {% if include.os == "Linux" %}
            {% capture compilerBrand %}Intel MPI compiler wrapper for the {{include.pmcs}} {{progLang}} compiler{% endcapture %}
        {% elsif include.os == "macOS" %}
            {% capture compilerBrand %}{% endcapture %}
        {% endif %}
    {% endif %}

{% endif %}

{% assign osname = include.os|downcase %}
{% if include.os == "Linux" %}
    {% assign pmLibExt = "so" %}
{% elsif include.os == "macOS" %}
    {% assign osname = "Darwin" %}
    {% assign pmLibExt = "dylib" %}
{% endif %}

{% capture pmLibName %}libparamonte_{{pmLang|downcase|replace:"+","p"}}_{{osname|downcase}}_amd64_{{include.pmcs|downcase}}_release_shared_heap{{ptype}}{% endcapture %}

#### Building the executable on {{include.os}} via the {{include.pmcs}} {{progLang}} compiler for **{{thisApplicationParallelism}}**  

-   {{ donwloadParaMonteFrom }} [here]({{site.githubReleaseCurrentDownload}}/{{pmLibName}}.tar.gz).  
    {{site.data.alerts.tip}}
    Although here we are downloading and using the ParaMonte libraries prebuilt via the {{include.pmcs}} {{progLang}} compiler, in general, you should be able to use the {{include.pmcs}} {{progLang}} compiler to link your applications against the ParaMonte libraries prebuilt via either Intel or GNU {{progLang}} compilers.
    {{site.data.alerts.end}}
{% include build.pmlib.files.md ptype=include.ptype pmcs=include.pmcs os=include.os %}
    {% if include.pmcs == "GNU" and include.ptype == "MPI" %}
    {% include note.html content="If you are using the **`OpenMPI`** library in place of the **`MPICH`** MPI library, simply replace the keyword **`mpich`** with **`openmpi`** anywhere it appears on this page." %}
    {% endif %}
-   Now, we are going to use the {{compilerBrand}} to compile and link your code,  
    {% if pmLang == "Fortran" %}
    ```bash
    {{fppFlagsCmd}}  # the missing macro definition implies we are using the procedural-style-Fortran interface to the ParaMonte library
    ```  
    {% assign signatureFile = "paramonte.f90 " %}
    {% endif %}
    ```bash
    export COMPILER_LINKER_FLAGS="{{releaseFlags}}"
    ```  
    ```bash
    {{compilerName}} $COMPILER_LINKER_FLAGS {{ppEnvVar}} {{signatureFile}}logfunc.{{progLangExt}} main.{{progLangExt}} {{pmLibName}}.{{pmLibExt}} -o main.exe
    ``` 
    {% if pmLang == "Fortran" %}
    Note the **missing** `-DIS_COMPATIBLE_COMPILER` macro definition as the value of the `PREPROCESSOR_FLAGS` environmental variable, implying that we have used the procedural-style, but more-portable Fortran interface to the ParaMonte library.  
    {% endif %}
    
    {% if include.ptype == "serial" %}
-   {{ runApplication }}  
    {% else %}
-   {{ runParallelApplication }}  
    {% endif %}
