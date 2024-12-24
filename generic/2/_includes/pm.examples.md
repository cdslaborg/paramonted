{% if include.lang == "c" %}
    {% assign progLangName = "C" %}
    {% assign progLangExam = "group__runParaDRAM.html#vis-mvn" %}
    {% capture progLangVers %}{{site.pmvmc}}{% endcapture %}
{% elsif include.lang == "cpp" %}
    {% assign progLangName = "C++" %}
    {% assign progLangExam = "group__runParaDRAM.html#vis-mvn" %}
    {% capture progLangVers %}{{site.pmvmcpp}}{% endcapture %}
{% elsif include.lang == "fortran" %}
    {% assign progLangName = "Fortran" %}
    {% assign progLangExam = "interfacepm__sampling_1_1getErrSampling.html#vis-mixture" %}
    {% capture progLangVers %}{{site.pmvmfortran}}{% endcapture %}
{% elsif include.lang == "matlab" %}
    {% assign progLangName = "MATLAB" %}
    {% assign progLangExam = "classParadram.html#vis-himmelblau" %}
    {% capture progLangVers %}{{site.pmvmmatlab}}{% endcapture %}
{% elsif include.lang == "python" %}
    {% assign progLangName = "Python" %}
    {% assign progLangExam = "classParadram.html#vis-himmelblau" %}
    {% capture progLangVers %}{{site.pmvmpython}}{% endcapture %}
{% elsif include.lang == "r" %}
    {% assign progLangName = "R" %}
    {% assign progLangExam = "classParadram.html#vis-himmelblau" %}
    {% capture progLangVers %}{{site.pmvmr}}{% endcapture %}
{% endif %}

{{site.data.alerts.tip}}
    The examples source codes, build instructions, and an illustration of their output are all available and documented in 
    the <a href="https://www.cdslab.org/paramonte/{{include.lang}}/{{progLangVers}}/" target="_blank">ParaMonte {{progLangName}} API documentation</a>.<br>
    See for example, the illustrations in the documentation of the <a href="https://www.cdslab.org/paramonte/{{include.lang}}/{{progLangVers}}/{{progLangExam}}" target="_blank">ParaMonte {{progLangName}} ParaDRAM sampler</a>.
{{site.data.alerts.end}}

## Building and running examples from the pre-built library releases  

{% if include.lang == "matlab" or include.lang == "python" %}

The [prebuilt ParaMonte {{progLangName}} library releases]({{site.baseurl}}/installation/{{include.lang}}/#the-fast-way){:target="_blank"} 
ship with all available examples for the {{progLangName}} programming language environment.  

{% else %}

The prebuilt ParaMonte {{progLangName}} library releases (yet to be added to the current library prerelease) 
ship with all available examples for the {{progLangName}} programming language environment.  

{% endif %}

To run a specific example in the prebuilt library,

1.  Download your target prebuilt library of your interest.  

1.  Navigate to the example folder of your interest in the prebuilt library containing the `main` example file.

{% if include.lang == "c" or include.lang == "cpp" or include.lang == "fortran" %}

1.  Run the build script in the relevant terminal to **build and run** the example.
    1.  In a **Windows Batch terminal**, try,
        ```batch
        build.bat
        ```
    1.  In a **Unix Bash or other Bash-compatible terminal**, try,
        ```batch
        ./build.sh
        ```
        If the script is not executable, make it so by the following command,
        ```batch
        chmod +x build.sh && ./build.sh
        ```

{% elsif include.lang == "matlab" %}

1.  Either,
    1.  open a MATLAB session and run the supplied MATLAB script `main.m`, or,
    1.  call the MATLAB application from within a relevant terminal 
        (e.g., `CMD` in Windows, `Bash` in Linux, and `Bash` or `zsh` in macOS).
        1.  For examples that are meant to be run in serial mode, try,
            ```bash
            matlab -batch main
            ```
        1.  For MPI-parallel example runs (e.g., for MPI-parallel ParaMonte samplers), try,
            ```bash
            mpiexec -n 3 matlab -batch main
            ```
            The above command will launch `3` MATLAB sessions 
            in parallel to run the specified MATLAB example in parallel.
            You can change `3` to any other positive integer to adjust the number of parallel processes.
            The ParaMonte library will automatically infer and invoke the appropriate 
            MPI-parallel ParaMonte library build to run the example in parallel.
            {{site.data.alerts.tip}}
            On Windows platforms using the Intel MPI library, you need to specify an additional
            flag `-localonly` for the `mpiexec` launcher to limit the parallelism to the local machine.
            <pre class="language-batch highlighter-rouge">
            <code>mpiexec -localonly -n 3 matlab -batch main</code>
            </pre>
            {{site.data.alerts.end}}
        {% include note.html content="The MATLAB `-batch` flag prevents a MATLAB GUI session from opening and instead runs the MATLAB engine in the background. You should always use this flag when using MATLAB on the command line." %}

{% endif %}

## Building and running examples from the library source  

If you are building the ParaMonte library from the source code, 
you can also instruct the build scripts to build, run and postprocess 
the examples after the ParaMonte build is complete. 
To build and run the examples, you must specify the name of the 
example you want to run along with the ParaMonte build configuration 
flag [`--exam`](../../../installation/install.config.md#exam). 
For example,

+   In a **Windows** Batch command line (e.g., CMD), 
    try in the root directory of the ParaMonte GitHub repository,
    ```batch
    install.bat --lang {{include.lang}} --exam sampling
    ```

+   In a **Unix** Bash or ZSH command line,
    try in the root directory of the ParaMonte GitHub repository,
    ```bash
    ./install.sh --lang {{include.lang}} --exam sampling
    ```

The above installation commands will be build the ParaMonte {{progLangName}} library
and subsequently run all ParaMonte {{progLangName}} examples whose name or path, as appearing in the
[example directory of the ParaMonte GitHub repository]({{site.githubTree}}/example/{{include.lang}}){:target="_blank"},
partially matches the specified pattern `sampling`.  

{% include tip.html content='If multiple example patterns are desired, separate the patterns 
with semicolon and double-quote the entire value. For example, `--exam "sampling;himmelblau"`.' %}
