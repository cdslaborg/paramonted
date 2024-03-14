---
title: Reporting Defects
tags: [defects, troubleshooting, debug, bug, contribution, contributing]
keywords: defects, troubleshooting, debug, bug, contribution, contributing
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

{% include shields.contributing.md %}

<br>

If you encounter problems during the course of Installing the ParaMonte library or using the library, please take the following actions,  

1.  Search the [issues](https://github.com/cdslaborg/paramonte/issues){:target="_blank"} page (including [closed issues](https://github.com/cdslaborg/paramonte/issues?q=is%3Aissue+is%3Aclosed){:target="_blank"}) 
    to see if anyone has encountered the same problem. If so add your experience to that issue thread.  
1.  If unable to resolve the problem, please file a [new issue](https://github.com/cdslaborg/paramonte/issues/new?assignees=&labels=&template=reproducible-bug-report.md&title=Defect%3A+){:target="_blank"} and include the following information:  
    +   The programming language interface within which the bug has been detected.  
    +   The specific compiler (for C. C++, Fortran) or language interpreter (for Julia, Python, R, ...) used.  
    +   If parallel, the communication library being used e.g., MPICH, OpenMPI, MVAPICH, Intel MPI, GASNet, ... and the version number.  
    +   The ParaMonte library version number. If you are building from the `main` (formerly `master`) branch on GitHub, then preferably provide the commit SHA.  
    +   Conditions required to reproduce the problem,  
        +   The Operating System, name and version.  
        +   The Architecture of machine/hardware the code is running on.  
        +   If parallel, the number of MPI ranks/processing elements/coarray images being run on.  
        +   If applicable, your code compilation process, including all flags and commands.  
        +   If possible, a minimal reproducer code that could trigger the bug.  
1.  Any help you can provide diagnosing, isolating and fixing the
    problem is appreciated! Please see the [development guidelines](../development/general/){:target="_blank"} for more information.


{% include askme.html %}
{% include links.html %}

