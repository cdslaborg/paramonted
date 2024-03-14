---
title: "The ParaDRAM simulation specifications"
#tags: [python, ParaDRAM, API, Fortran, C, C++, interoperation]
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

The following variables specify the properties of simulations that are performed via the ParaDRAM routine of ParaMonte library. **ParaDRAM** stands for **Para**llel **D**elayed-**R**ejection **A**daptive **M**etropolis-Hastings Markov Chain Monte Carlo.  

## The simulation specifications of ParaMonte's ParaDRAM sampler  

{% include specbase.md sampler="ParaDRAM" %}
{% include specmcmc.md sampler="ParaDRAM" %}
{% include specdram.md sampler="ParaDRAM" %}

{% include askme.html %}
{% include links.html %}
