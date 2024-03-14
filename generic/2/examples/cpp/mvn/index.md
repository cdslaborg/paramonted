---
title: Sampling a Multivariate Normal (MVN) distribution
#tags: [multivariate, normal, sampling, paradram]
keywords: 
        example
        multivariate
        Gaussian
        normal
        MVN
        sampling
        ParaDRAM
        C++
#summary: "."
sidebar: home_sidebar
#permalink: /program-units/functions/index.html
#last_updated: March 14, 2024
mathjax: true
---

{% comment %}
1. [web-link](){:target="_blank"}  
C/C++ examples documentation is currently being developed. Please check back in a few days, or contact the authors for quick help.  
{% endcomment %}

{% assign pmExam = "mvn" %}
{% assign pmLang = "C++" %}

<div id="toc"></div>  

{% include example.mvn.open.md %}

## Implementing the objective function in C++  

Here is a minimalistic implementation of the 4-D multivariate normal distribution objective function in C++, which can also be downloaded as [logfunc.cpp](https://raw.githubusercontent.com/cdslaborg/paramonte/main/example/mvn/C++/logfunc.cpp){:target="_blank"}.  

```cpp
{% include git/example/mvn/CPP/logfunc.cpp %}
```  

{% include example.logfunc.md %}
{% include example.main.md %}
{% include example.mvn.input.md %}
{% include example.build.md %}
{% include example.run.md %}

{% include askme.html %}
{% include links.html %}
