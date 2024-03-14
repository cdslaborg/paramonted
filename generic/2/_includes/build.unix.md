### Building the executable on **{{include.os}}** via the **{{include.pmcs}} {{progLang}} compiler**  

Open a Bash terminal that recognizes your local installation of the {{include.pmcs}} compilers and libraries. 

{% include build.flags.md pmcs=include.pmcs os=include.os %}

{% include build.unix.parallelism.md pmcs=include.pmcs os=include.os ptype="serial" %}

{% if include.pmcs == "GNU" %}
    {% assign parallelismAllowed = "true" %}
{% elsif include.os == "Linux" and include.pmcs == "Intel" %}
    {% assign parallelismAllowed = "true" %}
{% else %}
    {% assign parallelismAllowed = "false" %}
{% endif %}

{% if parallelismAllowed == "true" %}
    {% include build.unix.parallelism.md pmcs=include.pmcs os=include.os ptype="MPI" %}
{% endif %}
