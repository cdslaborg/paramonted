---
title: List of Python examples as Jupyter notebooks
#tags: [multivariate, normal, sampling, paradram]
keywords: 
        example
        jupyter
        notebook
        python
        MVN
        multivariate
        univariate
        normal
        gaussian
#summary: "."
sidebar: home_sidebar
#permalink: /program-units/functions/index.html
last_updated: March 14, 2024
mathjax: true
---
{% comment %}
1. [web-link](){:target="_blank"}  
{% assign examples_root_dir = "https://github.com/cdslaborg/paramontex/blob/main/jupyter/Python" %}
-   [sampling_multivariate_normal_distribution_via_paradram]({{examples_root_dir}}/sampling_multivariate_normal_distribution_via_paradram.ipynb){:target="_blank"}  
-   [sampling_univariate_gaussian_distribution_via_paradram]({{examples_root_dir}}/sampling_univariate_gaussian_distribution_via_paradram.ipynb){:target="_blank"}  
{% endcomment %}
<div id="toc"></div>  
<br>

The best way to learn about and interact with the Python interface to the ParaMonte library is via the Jupyter notebooks. The following is a list of example Jupyter Notebooks that are currently kept in the [examples repository of the package on GitHub](https://github.com/cdslaborg/paramontex){:target="_blank"}.  

{% assign examples_root_dir = "https://nbviewer.jupyter.org/github/cdslaborg/paramontex/blob/main/Python/Jupyter" %}
{% assign examples_github_dir = "https://github.com/cdslaborg/paramontex/blob/main/Python/Jupyter" %}
{% assign examples_download_dir = "https://github.com/cdslaborg/paramontex/raw/main/Python/Jupyter" %}

## General topics  

{% for file in site.data.general_python_jupyter_notebooks %}
-   [{{file.name}}]({{examples_root_dir}}/{{file.name}}/{{file.name}}.ipynb){:target="_blank"} ([**GitHub**]({{examples_github_dir}}/{{file.name}}/{{file.name}}.ipynb){:target="_blank"}, [**direct download**]({{examples_download_dir}}/{{file.name}}/{{file.name}}.ipynb))  
{% endfor %}

## The ParaDRAM sampler  

{% for file in site.data.paradram_python_jupyter_notebooks %}
-   [{{file.name}}]({{examples_root_dir}}/{{file.name}}/{{file.name}}.ipynb){:target="_blank"} ([**GitHub**]({{examples_github_dir}}/{{file.name}}/{{file.name}}.ipynb){:target="_blank"}, [**direct download**]({{examples_download_dir}}/{{file.name}}/{{file.name}}.ipynb))  
{% endfor %}

## Bayesian regression and data analysis  

{% for file in site.data.regression_python_jupyter_notebooks %}
-   [{{file.name}}]({{examples_root_dir}}/{{file.name}}/{{file.name}}.ipynb){:target="_blank"} ([**GitHub**]({{examples_github_dir}}/{{file.name}}/{{file.name}}.ipynb){:target="_blank"}, [**direct download**]({{examples_download_dir}}/{{file.name}}/{{file.name}}.ipynb))  
{% endfor %}

{% include askme.html %}
{% include links.html %}
