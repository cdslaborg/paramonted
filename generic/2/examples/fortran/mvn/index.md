---
title: Sampling a Multivariate Normal (MVN) distribution
#tags: [multivariate, normal, sampling, paradram]
keywords: 
        multivariate
        Gaussian
        normal
        MVN
        example
        sampling
        ParaDRAM
        Fortran
#attn: "Despite the relatively-long length of this page, the actual setup of this ParaMonte example will not take more than 3-5 minutes. The long length of this page is due to covering all aspects of the simulation build process on different Operating Systems via different compilers. For a quick start, see <a href='../../c/mvn/' target='_blank'>this page</a>"
#summary: "."
sidebar: home_sidebar
#permalink: /program-units/functions/index.html
last_updated: March 14, 2024
mathjax: true
---

{% comment %}
1. [web-link](){:target="_blank"}  
{% include note.html content="" %}
{% endcomment %}

{% assign pmExam = "mvn" %}
{% assign pmLang = "Fortran" %}
 
<div id="toc"></div>  

{% include example.mvn.open.md %}

## Implementing the objective function in Fortran  

Here is a minimalistic implementation of the 4-D multivariate normal distribution objective function in Fortran, which can also be downloaded as [logfunc.f90](https://raw.githubusercontent.com/cdslaborg/paramonte/main/example/mvn/Fortran/logfunc.f90){:target="_blank"}.  

```fortran
{% include git/example/mvn/Fortran/logfunc.f90 %}
```  

{% include example.logfunc.md %}
{% include example.main.md %}
{% include example.mvn.input.md %}
{% include example.build.md %}
{% include example.run.md %}

{% include askme.html %}
{% include links.html %}
