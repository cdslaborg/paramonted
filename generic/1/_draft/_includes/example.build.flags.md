{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
{% if pmLang == "C" %}
    {% if include.pmcs == "Intel" %}
        {% if include.os == "Windows" %}
            {% assign releaseFlags = "/O3 /Qip /Qipo /Qunroll /Qunroll-aggressive /Ob2 /Qinline-dllimport" %}
            {% assign testingFlags = "/Od" %}
            {% assign debugFlags = "/debug:full /Zi /Od /Wall /traceback /Qcheck-pointers:rw /Qcheck-pointers-undimensioned /Qdiag-error-limit:10 /Qtrapuv" %}
        {% else %}
            {% assign releaseFlags = "-O3" %}
            {% assign testingFlags = "-O0" %}
            {% assign debugFlags = "-O0 -debug full" %}
        {% endif %}
    {% elsif include.pmcs == "msvc" %}
        {% assign releaseFlags = "/O2" %}
        {% assign testingFlags = "/Od" %}
        {% assign debugFlags = "/Od /Z7" %}
    {% elsif include.pmcs == "GNU" %}
        {% assign releaseFlags = "-O3" %}
        {% assign testingFlags = "-O0" %}
        {% assign debugFlags = "-O0 -g" %}        
    {% endif %}
{% elsif pmLang == "Fortran" %}
    {% if include.pmcs == "Intel" %}
        {% if include.os == "Windows" %}
            {% assign fppFlags = "set PREPROCESSOR_FLAGS=/fpp" %}
            {% assign fppFlagsOOP = "set PREPROCESSOR_FLAGS=/fpp /DIS_COMPATIBLE_COMPILER" %}
            {% assign releaseFlags = "/standard-semantics /O3 /Qip /Qipo /Qunroll /Qunroll-aggressive" %}
            {% assign testingFlags = "/standard-semantics /Od" %}
            {% assign debugFlags = "/standard-semantics /debug:full /CB /Od /Qinit:snan,arrays /warn:all /gen-interfaces /traceback /check:all /check:bounds /fpe-all:0 /Qtrapuv" %}
        {% else %}
            {% assign fppFlags = 'export PREPROCESSOR_FLAGS="-fpp"' %}
            {% assign fppFlagsOOP = 'export PREPROCESSOR_FLAGS="-fpp -DIS_COMPATIBLE_COMPILER"' %}
            {% assign releaseFlags = "-standard-semantics -O3 -ip -ipo -unroll -unroll-aggressive -finline-functions" %}
            {% assign testingFlags = "-O0" %}
            {% assign debugFlags = "-O0 -g" %}
        {% endif %}
    {% elsif include.pmcs == "GNU" %}
        {% assign fppFlags = 'export PREPROCESSOR_FLAGS="-cpp"' %}
        {% assign fppFlagsOOP = 'export PREPROCESSOR_FLAGS="-cpp -DIS_COMPATIBLE_COMPILER"' %}
        {% assign releaseFlags = "-std=gnu -O3 -funroll-loops -finline-functions -ftree-vectorize" %}
        {% assign testingFlags = "-std=gnu -O0" %}
        {% assign debugFlags = "-std=gnu -O0 -g" %}        
    {% endif %}
{% endif %}

**Define the compiler/linker flags**  
Depending on the build type you would like to specify for your application ( `release`, `testing`, `debug` ), you may also want to define the compiler/linker flags,  

{% if include.os == "Windows" %}

-   for `release`:  
```shell
set COMPILER_LINKER_FLAGS={{releaseFlags}}
```  
-   for `testing`:  
```shell
set COMPILER_LINKER_FLAGS={{testingFlags}}
```  
-   for `debug`:  
```shell
set COMPILER_LINKER_FLAGS={{debugFlags}}
```  

{% else %}

-   for `release`:  
```shell
export COMPILER_LINKER_FLAGS="{{releaseFlags}}"
```  
-   for `testing`:  
```shell
export COMPILER_LINKER_FLAGS="{{testingFlags}}"
```  
-   for `debug`:  
```shell
export COMPILER_LINKER_FLAGS="{{debugFlags}}"
```  

{% endif %}

{% if pmLang == "Fortran" %}

**Choose your ParaMonte interface style**  

-   If you are using the same compiler/linker version that has been used to build the ParaMonte library and you would like to use the Object-Oriented (OOP) interface of the ParaMonte routines, then you will have to pass the following preprocessor flags to the compiler as well,  
    ```shell
    {{fppFlagsOOP}}
    ```  
    This will define the preprocessor variable `IS_COMPATIBLE_COMPILER`, which will enable the use of the OOP interface of the ParaMonte routines.  
-   Otherwise, use,  
    ```shell
    {{fppFlags}}
    ```  

{% endif %}
