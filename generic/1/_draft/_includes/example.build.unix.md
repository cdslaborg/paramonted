{% if pmLang == "C" %}
    {% if include.pmcs == "GNU" %}
        {% assign compilerName = "gcc" %}
    {% elsif include.pmcs == "Intel" %}
        {% assign compilerName = "icc" %}
    {% endif %}
{% elsif pmLang == "Fortran" %}
    {% if include.pmcs == "GNU" %}
        {% assign compilerName = "gfortran" %}
    {% elsif include.pmcs == "Intel" %}
        {% assign compilerName = "ifort" %}
    {% endif %}
{% endif %}

### Compiling and linking on **{{include.os}}** via the **{{include.pmcs}} {{progLang}} compiler**  

Open a Bash terminal that recognizes your local installation of the {{include.pmcs}} compilers and libraries. 

{% include example.build.flags.md pmcs=include.pmcs os=include.os %}

{% include example.build.unix.parallelism.md pmcs=include.pmcs os=include.os ptype="serial" %}

{% if include.os == "Linux" and include.pmcs == "GNU" %}
{% include example.build.unix.parallelism.md pmcs=include.pmcs os=include.os ptype="MPI" %}
{% endif %}
