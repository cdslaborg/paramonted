---
title: "Calling the ParaDRAM sampler: A quick start"
#tags: [Python, ParaDRAM, API, Fortran, C, C++, interoperation]
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

We have taken special care to develop a highly similar (if not the same) Application Programming Interface (API) for the ParaMonte library routines across all supported programming languages. In particular, every simulation performed via the ParaDRAM routine requires the user to supply only two mandatory pieces of information:  
1.  A user-supplied density function `getLogFunc()` that the sampler must explore.  
1.  The number of dimensions `ndim` of the domain of the user-supplied density function `getLogFunc()`.  

## Calling the ParaDRAM sampler  

### Calling the ParaDRAM sampler from C  

The [simulation specifications](../specifications/){:target="_blank"} are all automatically set to the appropriate default values. However, to assign non-default values to the [simulation specifications](../specifications/){:target="_blank"} from the C language, the user must provide all or any [simulation specifications](../specifications/){:target="_blank"} as an external input file in the format described on [this page](../input/){:target="_blank"}. The benefits of using an external file to specify the properties of a ParaMonte simulation are also detailed [here](../input/#why-is-input-file-the-preferred-method-of-simulation-setup){:target="_blank"}.  

For a complete descriptive example of ParaDRAM usage from within C, see [the ParaMonte C documentation]({{site.baseurl}}/../../c/2/group__pm__sampling.html){:target="_blank"}.  

### Calling the ParaDRAM sampler from C++  

The [simulation specifications](../specifications/){:target="_blank"} are all automatically set to the appropriate default values. However, to assign non-default values to the [simulation specifications](../specifications/){:target="_blank"} from the C++ language, the user must provide all or any [simulation specifications](../specifications/){:target="_blank"} as an external input file in the format described on [this page](../input/){:target="_blank"}. The benefits of using an external file to specify the properties of a ParaMonte simulation are also detailed [here](../input/#why-is-input-file-the-preferred-method-of-simulation-setup){:target="_blank"}.  

For a complete descriptive example of ParaDRAM usage from within C++, see [the ParaMonte C++ documentation]({{site.baseurl}}/../../cpp/2/group__pm__sampling.html){:target="_blank"}.  

### Calling the ParaDRAM sampler from Fortran  

The [simulation specifications](../specifications/){:target="_blank"} are all automatically set to the appropriate default values. However, if needed, there are two ways to assign non-default values to the [simulation specifications](../specifications/){:target="_blank"} from the Fortran language: 
1.  via the `sampler` argument in the generic interface of the ParaDRAM sampler routine [getErrSampling]({{site.baseurl}}/../../fortran/2/interfacepm__sampling_1_1getErrSampling.html){:target="_blank"}. The [simulation specifications](../specifications/){:target="_blank"} specified would have to be set as components of the derived type [paradram_type]({{site.baseurl}}/../../fortran/2/structpm__sampling_1_1paradram__type.html){:target="_blank"}.
1.  via an [external input file](../input/){:target="_blank"} passed to the ParaDRAM sampler routine [getErrSampling]({{site.baseurl}}/../../fortran/2/interfacepm__sampling_1_1getErrSampling.html){:target="_blank"}.

For a complete descriptive example of ParaDRAM usage from within Fortran, see [the ParaMonte Fortran documentation]({{site.baseurl}}/../../fortran/2/interfacepm__sampling_1_1getErrSampling.html){:target="_blank"}.  

{% comment %}
### Calling the ParaDRAM sampler from MATLAB  

The [simulation specifications](../specifications/){:target="_blank"} are all automatically set to the appropriate default values. However, if needed, there are two ways to assign non-default values to the [simulation specifications](../specifications/){:target="_blank"} from the MATLAB language (somewhat similar to the Fortran interface to the ParaMonte library as the two languages have very similar syntax rules):  
1.  The recommended way is to assign all or any [simulation specifications](../specifications/){:target="_blank"} as attributes of the ParaMonte sampler object you constructed. For example, here is a simple ParaDRAM simulation in MATLAB,  
    ```matlab  
    addpath(genpath("./"),"-begin");        % path to the paramonte library
    getLogFunc = @(x) -sum(x.^2);           % define a simple log multivariate Normal (MVN) target density
    pm = paramonte();                       % generate a paramonte class instance
    pmpd = pm.ParaDRAM();                   % generate a ParaDRAM sampler instance
    pmpd.spec.outputFileName = "./out/mvn"; % set the file prefix for the ParaDRAM output files.
    pmpd.spec.outputStatus = true;          % overwrite the output files if they already exist.
    pmpd.runSampler ( 3 ...                 sample a 3-dimensional MVN
                    , getLogFunc ...        the anonymous function returning the log of MVN
                    );
    ```  
    The following screenshot shows a partial list of the ParaDRAM simulation attributes within the `spec` attribute of the constructed `ParaDRAM` object in MATLAB (to see the full set of ParaDRAM [simulation specifications](../specifications/){:target="_blank"} and their descriptions, see [this page](../specifications){:target="_blank"},  
    ![MATLAB ParaDRAM object's specification attributes screenshot]({{site.baseurl}}/images/matlabParadramSpecScreenshot.png)  
    Use `pmpd.spec.helpme()` to get help on the meanings of the simulation specifications. To get help with a specific simulation attribute, pass the attribute name as a string to the method, for example, `pmpd.spec.helpme("outputStatus")`.  
1.  Another way is to provide all or any [simulation specifications](../specifications/){:target="_blank"} in an external input file with the format described on [this page](../input/){:target="_blank"}.  
    {% include tip.html content="Unlike the case for C/C++/Fortran, we **do NOT recommend** specifying the simulation properties via an external input file since hardcoding the [simulation specifications](../specifications/) in the MATLAB script does not cause long and severe compilation headaches that one gets in compiled languages." %}

### Calling the ParaDRAM sampler from Python  

The [simulation specifications](../specifications/){:target="_blank"} are all automatically set to the appropriate default values. However, if needed, there are two ways to assign non-default values to the [simulation specifications](../specifications/){:target="_blank"} from the Python language (similar to the ParaMonte MATLAB library):  
1.  assigning all or any [simulation specifications](../specifications/){:target="_blank"} as attributes of the ParaMonte sampler object that you have constructed (**the recommended method**). Here is a simple ParaDRAM simulation in Python,  
    ```python  
    import paramonte as pm
    import numpy as np
    getLogFunc = lambda x : -np.sum(x**2)       # define a simple log multivariate Normal (MVN) target density.
    pmpd = pm.ParaDRAM()                        # generate a ParaDRAM sampler instance.
    pmpd.spec.outputFileName = "./out/mvn"      # set the file prefix for the ParaDRAM output files.
    pmpd.spec.outputStatus = True         # overwrite the output files if they already exist.
    pmpd.runSampler ( ndim = 3                  # sample a 3-dimensional MVN.
                    , getLogFunc = getLogFunc   # the anonymous function returning the log of MVN.
                    )
    ```  
    The following screenshot shows a partial list of the ParaDRAM simulation attributes within the `spec` attribute of the constructed `ParaDRAM` object in Python (to see the full set of ParaDRAM [simulation specifications](../specifications/){:target="_blank"} and their descriptions see [this page](../specifications){:target="_blank"},  
    ![IPython ParaDRAM object's specification attributes screenshot]({{site.baseurl}}/images/pythonParadramSpecScreenshot.png)  
    Use `pmpd.spec.helpme()` to get help on the meanings of the simulation specifications. To get help with a specific simulation attribute, pass the attribute name as a string to the method, for example, `pmpd.spec.helpme("outputStatus")`.  
1.  providing all or any [simulation specifications](../specifications/){:target="_blank"} in an external input file with the format described on [this page](../input/){:target="_blank"}.
    {% include tip.html content="Unlike the case for C/C++/Fortran, **we do NOT recommend** specifying the simulation properties via an external input file since hardcoding the [simulation specifications](../specifications/) in the Python script does not cause long and severe compilation headaches as in compiled languages." %}
{% endcomment %}

{% include askme.html %}
{% include links.html %}
