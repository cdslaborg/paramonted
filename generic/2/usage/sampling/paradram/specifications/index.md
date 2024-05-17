---
title: "The ParaDRAM sampler specifications"
#tags: [Python, ParaDRAM, API, Fortran, C, C++, interoperation]
keywords: 
        specifications
        simulation
        ParaDRAM
        API
        Fortran
        C
        C++
        Python
sidebar: home_sidebar
#permalink: ///index.html
summary:
last_updated: January 1, 2020
mathjax: true
---
{% comment %}
[](){:target="_blank"}
{% if pmSampler == "ParaDRAM" %}
{% endif %}
{% endcomment %}
<br>

The following variables specify the properties of simulations that are performed via the ParaDRAM routine of ParaMonte library. 
The abbreviation **ParaDRAM** stands for **Para**llel **D**elayed-**R**ejection **A**daptive **M**etropolis-Hastings Markov Chain Monte Carlo. 
The simulation specifications listed on this page can appear either in an external input file whose path is passed to the ParaDRAM sampler from
within any programming environment or can be set as ParaDRAM sampler object components from within specific programming environments such as MATLAB and Python. 
Refer to the corresponding programming language documentations for more details on the usage. 

{% include specdram.md sampler="ParaDRAM" %}

{% include askme.html %}
{% include links.html %}
