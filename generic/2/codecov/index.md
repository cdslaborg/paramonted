---
title: ParaMonte Code Coverage Generation Guidelines
tags: [codecov, kernel, code coverage, gcov, lcov]
keywords: codecov, code coverage, kernel, C, C++, Fortran, gcov, lcov
#summary: "."
sidebar: home_sidebar
#permalink: /program-units/functions/index.html
last_updated: December 15, 2020
mathjax: true
---

{% comment %}
1. [web-link](){:target="_blank"}
C/C++ examples documentation is currently being developed. Please check back in a few days, or contact the authors for quick help.  
{% highlight batch %}
{% endhighlight %}
{% endcomment %}

<div id="toc"></div>  

## The ParaMonte code coverage report  

The code coverage reports of the ParaMonte library can be generated for a wide variety of input build configurations and programming languages. 
For example, corresponding to each programming language (`C`, `C++`, `Fortran`, `MATLAB`, `Python`, `R`, ...), a separate code coverage report for the routines can be generated. 
Similarly, different library builds (`debug`, `testing`, `release`), types (`static`, `shared`), and memory allocation (stack or heap) can lead to different code coverage reports.  

Among all build configurations, however, the most critical specification that yields the largest differences in code coverage reports is the parallelism paradigm (`none`, `mpi`, `cafsingle`, `cafshared`, `cafdist`). 
The the three Coarray (CAF) parallelism subtypes yield the same code coverage reports. 
However, the code coverage reports for the serial, MPI, and Coarray modes are remarkably different since each parallelism type activates a different set of codes in the ParaMonte routines.  
As such, the code coverage reports are only generated separately for the three library parallelism builds. 
For more information on the language-specific code coverage reports see,

+   [The ParaMonte Fortran code coverage report](./fortran/){:target='_blank'}

{% include askme.html %}
{% include links.html %}
