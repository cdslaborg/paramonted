---
title: List of MATLAB examples as MATLAB Live Scripts
#tags: [multivariate, normal, sampling, paradram]
keywords: 
        example
        mlx
        live
        script
        notebook
        matlab
        MVN
        multivariate
        univariate
        normal
        gaussian
#summary: "."
sidebar: home_sidebar
#permalink: /program-units/functions/index.html
last_updated: January 1, 2020
mathjax: true
---
{% comment %}
1. [web-link](){:target="_blank"}  
{% endcomment %}
<div id="toc"></div>  
<br>

The best way to learn about and interact with the MATLAB interface to the ParaMonte library is via the MATLAB live scripts. The following is a list of example MATLAB live scripts in HTML format, that are currently kept in the [examples repository of the package on GitHub](https://github.com/cdslaborg/paramontex/blob/fbeca6745684c798ff28c1bf57cfae0c190db478){:target="_blank"}.  

{% assign examples_root_dir = "." %}

## General topics    

{% for file in site.data.general_matlab_live_scripts %}
-   [{{file.name}}]({{examples_root_dir}}/{{file.name}}.html){:target="_blank"}  
{% endfor %}

## The ParaDRAM sampler  

{% for file in site.data.paradram_matlab_live_scripts %}
-   [{{file.name}}]({{examples_root_dir}}/{{file.name}}.html){:target="_blank"}  
{% endfor %}

## Bayesian regression and data analysis  

{% for file in site.data.regression_matlab_live_scripts %}
-   [{{file.name}}]({{examples_root_dir}}/{{file.name}}.html){:target="_blank"}  
{% endfor %}

{% include askme.html %}
{% include links.html %}
