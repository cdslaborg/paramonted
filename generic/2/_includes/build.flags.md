{% if pmLang == "C" or pmLang == "C++" %}
    {% assign ppEnvVar = "" %}
{% elsif pmLang == "Fortran" %}
    {% assign ppEnvVar = "$PREPROCESSOR_FLAGS" %}
{% endif %}


{% include build.flags.definitions.md %}

{% if pmLang == "C" or pmLang == "C++" %}

    {% if include.pmcs == "Intel" %}

        {% if include.os == "Windows" %}
            {% assign releaseFlags = iclWindowsReleaseFlags %}
            {% assign testingFlags = iclWindowsTestingFlags %}
            {% assign debugFlags   = iclWindowsDebugFlags   %}
        {% elsif include.os == "Linux" %}
            {% assign releaseFlags = iccLinuxReleaseFlags %}
            {% assign testingFlags = iccLinuxTestingFlags %}
            {% assign debugFlags   = iccLinuxDebugFlags   %}
        {% else %}
            {% assign releaseFlags = iccDarwinReleaseFlags %}
            {% assign testingFlags = iccDarwinTestingFlags %}
            {% assign debugFlags   = iccDarwinDebugFlags   %}
        {% endif %}

    {% elsif include.pmcs == "msvc" %}

        {% assign releaseFlags = clWindowsReleaseFlags %}
        {% assign testingFlags = clWindowsTestingFlags %}
        {% assign debugFlags   = clWindowsDebugFlags   %}

    {% elsif include.pmcs == "GNU" %}

        {% assign releaseFlags = gccLinuxReleaseFlags %}
        {% assign testingFlags = gccLinuxTestingFlags %}
        {% assign debugFlags   = gccLinuxDebugFlags   %}        

    {% endif %}

{% elsif pmLang == "Fortran" %}

    {% assign fppFlagsCmd    = 'unset PREPROCESSOR_FLAGS' %}
    {% assign fppFlagsCmdOOP = 'export PREPROCESSOR_FLAGS="-DIS_COMPATIBLE_COMPILER"' %}

    {% if include.pmcs == "Intel" %}

        {% if include.os == "Windows" %}

            {% assign fppFlagsCmd     = 'set "PREPROCESSOR_FLAGS="' %}
            {% assign fppFlagsCmdOOP  = 'set "PREPROCESSOR_FLAGS=/DIS_COMPATIBLE_COMPILER"' %}
            {% assign releaseFlags    = ifortWindowsReleaseFlags %}
            {% assign testingFlags    = ifortWindowsTestingFlags %}
            {% assign debugFlags      = ifortWindowsDebugFlags   %}

        {% else %}

            {% assign releaseFlags = ifortLinuxReleaseFlags %}
            {% assign testingFlags = ifortLinuxTestingFlags %}
            {% assign debugFlags   = ifortLinuxDebugFlags   %}

        {% endif %}

    {% elsif include.pmcs == "GNU" %}

        {% assign releaseFlags = gfortranLinuxReleaseFlags %}
        {% assign testingFlags = gfortranLinuxTestingFlags %}
        {% assign debugFlags   = gfortranLinuxDebugFlags %}        

    {% endif %}

{% endif %}

{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}

Depending on the build type you would like to specify for your application ( `release`, `testing`, `debug` ), you may want to define the compiler/linker flags,  

{% if include.os == "Windows" %}

-   for `release`:  
```batch
set "COMPILER_LINKER_FLAGS={{releaseFlags}}"
```  
-   for `testing`:  
```batch
set "COMPILER_LINKER_FLAGS={{testingFlags}}"
```  
-   for `debug`:  
```batch
set "COMPILER_LINKER_FLAGS={{debugFlags}}"
```  

{% else %}

-   for `release`:  
```bash
export COMPILER_LINKER_FLAGS="{{releaseFlags}}"
```  
-   for `testing`:  
```bash
export COMPILER_LINKER_FLAGS="{{testingFlags}}"
```  
-   for `debug`:  
```bash
export COMPILER_LINKER_FLAGS="{{debugFlags}}"
```  

{% if include.os == "macOS" and include.pmcs == "Intel" and (pmLang == "C" or pmLang == "C++") %}
To understand the reason for adding the compiler flag `-no-multibyte-chars` on macOS, see [this troubleshooting page](../../troubleshooting/catastrophic-error-could-not-set-locale/){:target="_blank"} 
{% endif %}

{% endif %}

{% if pmLang == "Fortran" %}

**Choose your ParaMonte interface style**  

If you are using the same compiler/linker version that has been used to build the ParaMonte library and you would like to use the Object-Oriented (OOP) interface of the ParaMonte routines, then you will have to pass the following preprocessor macro to the compiler as well,  
```bash
{{fppFlagsCmdOOP}}
```  
This will define the preprocessor macro `IS_COMPATIBLE_COMPILER`, which will enable the use of the OOP interface of the ParaMonte routines. Otherwise, you may want to unset this variable to ensure that you will be using the old-style Fortran interface to the ParaMonte library,  
```bash
{{fppFlagsCmd}}
```  
{% include tip.html content="If you are using the prebuilt ParaMonte libraries and you are not sure whether you are using a ParaMonte-compatible compiler to build your application, do not pass this preprocessor macro to the compiler. Instead, use [the old-style Fortran interface](../../examples/fortran/mvn/#calling-the-paramonte-samplers-the-old-less-flexible-but-more-portable-style){:target='_blank'} to the ParaMonte library." %}

{% endif %}
