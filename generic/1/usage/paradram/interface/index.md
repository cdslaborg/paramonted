---
title: "Calling the ParaDRAM sampler: A quick start"
#tags: [python, ParaDRAM, API, Fortran, C, C++, interoperation]
keywords: 
        C
        C++
        Fortran
        python
        input 
        file
        ParaDRAM
        API
        usage
        interface
sidebar: home_sidebar
#permalink: ///index.html
summary:
last_updated: August 20, 2020
mathjax: true
---
{% comment %}
[](){:target="_blank"}
{% if pmSampler == "ParaDRAM" %}
{% endif %}
{% endcomment %}
<br>

{% include tip.quick.start.md %}

## One API for usage from all programming languages  

Special care has been made to ensure that we develop highly-similar (if not the same) Application Programming Interface (API) for the ParaMonte library routines across all supported programming languages. In particular, every simulation performed via the ParaDRAM routine requires **only two** mandatory pieces of information to be supplied by the user. 

The generic minimal form of the call to initiate a ParaDRAM simulation from within C, C++, Fortran, MATLAB, or Python has the following universal signature:  

```text
ParaDRAM_SAMPLER( ndim       : the number of dimensions of the domain of the objective function.
                , getLogFunc : returns the natural log of the objective function to be sampled.
                , inputFile  : (optional) the path to the input file containing the ParaMonte simulation's specifications.
                )
```  

where the routine name (that goes in place of `PARADRAM_SAMPLER`) can be,  

-   the `runSampler()` method of an object of class `ParaDRAM()` in Python, MATLAB, and Fortran programming languages, or,  
-   the global `runParaDRAM()` name when called from C/C++/Fortran programming languages.  

The first two arguments `ndim` and `getLogFunc()` are mandatory while `inputFile` is optional. This is true across all programming languages (except in the C/C++ interfaces to the ParaMonte routines, where an empty string `""` can be used to signal no `inputFile` presence).  

## Calling the ParaDRAM sampler  

### Calling the ParaDRAM sampler from C  

The simulation specifications are all automatically set to the appropriate default values. However, to assign non-default values to the simulation specifications from the C languages, the user must provide all simulation specifications as an external input file in the format described on [this page](../input/){:target="_blank"}. The benefits of using an external file to specify the properties of a ParaMonte simulation are also detailed [here](../input/#why-is-input-file-the-preferred-method-of-simulation-setup){:target="_blank"}.  

For a complete descriptive example ParaDRAM usage from within C see [this sampling example](../../../examples/c/mvn/){:target="_blank"}. You can also download the full source codes for this example form the [GitHub release page of the ParaMonte library]({{site.releases}}){:target="_blank"}.  

### Calling the ParaDRAM sampler from C++  

The simulation specifications are all automatically set to the appropriate default values. However, to assign non-default values to the simulation specifications from the C++ languages, the user must provide all simulation specifications as an external input file in the format described on [this page](../input/){:target="_blank"}. The benefits of using an external file to specify the properties of a ParaMonte simulation are also detailed [here](../input/#why-is-input-file-the-preferred-method-of-simulation-setup){:target="_blank"}.  

For a complete descriptive example ParaDRAM usage from within C++ see [this sampling example](../../../examples/cpp/mvn/){:target="_blank"}. You can also download the full source codes for this example form the [GitHub release page of the ParaMonte library]({{site.releases}}){:target="_blank"}.  

### Calling the ParaDRAM sampler from Fortran  

The simulation specifications are all automatically set to the appropriate default values. However, if needed, there are two ways to assign non-default values to the simulation specifications from the Fortran language:  
-   passing the specifications as optional arguments to the ParaMonte sampler routine of choice (For example, [here](https://github.com/cdslaborg/paramonte/blob/3548c097f2a25dfc0613061800656d27d0e0ddbe/src/kernel/ParaXXXX_mod.inc.f90){:target="_blank"} is the set of input optional arguments to the `runSampler()` method of the `ParaDRAM` sampler class in the ParaMonte library), or,  
-   providing all simulation specifications in an external input file in the format described on [this page](../input/){:target="_blank"}.
    {% include tip.html content="When using the ParaMonte Fortran library, we recommend that you always specify the simulation specifications via an external input file. The reasons are detailed [here](../input/#why-is-input-file-the-preferred-method-of-simulation-setup)." %}  

For a complete descriptive example ParaDRAM usage from within Fortran see [this sampling example](../../../examples/fortran/mvn/){:target="_blank"}. You can also download the full source codes for this example form the [GitHub release page of the ParaMonte library]({{site.releases}}){:target="_blank"}.  

### Calling the ParaDRAM sampler from MATLAB  

The simulation specifications are all automatically set to the appropriate default values. However, if needed, there are two ways to assign non-default values to the simulation specifications from the MATLAB language (somewhat similar to the Fortran interface to the ParaMonte library as the two languages have very similar syntax rules):  
1.  The recommended way is to assign all simulation specifications as attributes of the ParaMonte sampler object that you have constructed. For example, here is a very simple ParaDRAM simulation in MATLAB,  
    ```matlab  
    addpath(genpath("./"),"-begin");        % path to the paramonte library
    getLogFunc = @(x) -sum(x.^2);           % define a simple log multivariate Normal (MVN) target density
    pm = paramonte();                       % generate a paramonte class instance
    pmpd = pm.ParaDRAM();                   % generate a ParaDRAM sampler instance
    pmpd.spec.outputFileName = "./out/mvn"; % set the file prefix for the output files of ParaDRAM
    pmpd.spec.overwriteRequested = true;    % overwrite the output files if they already exist.
    pmpd.runSampler ( 3 ...                 sample a 3-dimensional MVN
                    , getLogFunc ...        the anonymous function returning the log of MVN
                    );
    ```  
    The following screenshot shows a partial list of the ParaDRAM simulation attributes within the `spec` attribute of the constructed `ParaDRAM` object in MATLAB (to see the full set of ParaDRAM simulation specifications and their descriptions see [this page](../specifications){:target="_blank"},  
    ![MATLAB ParaDRAM object's specification attributes screenshot]({{site.baseurl}}/images/matlabParadramSpecScreenshot.png)  
    Use `pmpd.spec.helpme()` to get help on the meanings of the simulation specifications. To get help with a specific simulation attribute, pass the attribute name as string to the method, for example, `pmpd.spec.helpme("overwriteRequested")`.  
1.  Another way is to provide all simulation specifications in an external input file with the format described on [this page](../input/){:target="_blank"}.  
    {% include tip.html content="Unlike the case for C/C++/Fortran, we **do NOT recommend** specifying the simulation properties via an external input file since hardcoding the simulation specifications in the MATLAB script does not cause long and severe compilation headaches that one gets in compiled languages." %}

### Calling the ParaDRAM sampler from Python  

The simulation specifications are all automatically set to the appropriate default values. However, if needed, there are two ways to assign non-default values to the simulation specifications from the Python language (similar to the ParaMonte MATLAB library):  
1.  assigning all simulation specifications as attributes of the ParaMonte sampler object that you have constructed (**the recommended method**). Here is a very simple ParaDRAM simulation in Python,  
    ```python  
    import paramonte as pm
    import numpy as np
    getLogFunc = lambda x : -np.sum(x**2)       # define a simple log multivariate Normal (MVN) target density.
    pmpd = pm.ParaDRAM()                        # generate a ParaDRAM sampler instance.
    pmpd.spec.outputFileName = "./out/mvn"      # set the file prefix for the output files of ParaDRAM.
    pmpd.spec.overwriteRequested = True         # overwrite the output files if they already exist.
    pmpd.runSampler ( ndim = 3                  # sample a 3-dimensional MVN.
                    , getLogFunc = getLogFunc   # the anonymous function returning the log of MVN.
                    )
    ```  
    The following screenshot shows a partial list of the ParaDRAM simulation attributes within the `spec` attribute of the constructed `ParaDRAM` object in Python (to see the full set of ParaDRAM simulation specifications and their descriptions see [this page](../specifications){:target="_blank"},  
    ![IPython ParaDRAM object's specification attributes screenshot]({{site.baseurl}}/images/pythonParadramSpecScreenshot.png)  
    Use `pmpd.spec.helpme()` to get help on the meanings of the simulation specifications. To get help with a specific simulation attribute, pass the attribute name as string to the method, for example, `pmpd.spec.helpme("overwriteRequested")`.  
1.  providing all simulation specifications in an external input file with the format described on [this page](../input/){:target="_blank"}.
    {% include tip.html content="Unlike the case for C/C++/Fortran, **we do NOT recommend** specifying the simulation properties via an external input file since hardcoding the simulation specifications in the Python script does not cause long and severe compilation headaches as in compiled languages." %}

{% include askme.html %}
{% include links.html %}
