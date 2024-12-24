---
title: ParaMonte Code Coverage Generation Guidelines
tags: [codecov, kernel, fortran, code coverage, gcov, lcov]
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

## The ParaMonte Fortran code coverage report generation  

1.  As of March 2024, roughly $2.5$ million unit tests verify the functionalities of the ParaMonte Fortran library alone for each parallelism build. 
1.  The code coverage report is currently activated only for the ParaMonte Fortran library under the Linux / macOS environment. 
1.  The most recent code coverage reports generated for the ParaMonte Fortran library are the following:
    +   [ParaMonte Fortran 2 serial]({{site.codecov}}/fortran/2/serial){:target="_blank"}  
{% comment %}
    +   [ParaMonte Fortran parallel MPI]({{site.codecov}}/fortran/2/mpi){:target="_blank"}  
    +   [ParaMonte Fortran parallel Coarray]({{site.codecov}}/fortran/2/caf){:target="_blank"}  
{% endcomment %}

1.  Two open-source software `gcov` and `lcov` are required for code instrumentation and HTML generation. 
    {% include important.html content="The code coverage report generation currently requires a [ParaMonte-compatible](../../overview/src/fortran/CHANGES.md){:target='_blank'} GNU Fortran compiler." %}
    {% include warning.html content="The GNU Fortran compiler version must be compatible with the GNU `gcov` (and possibly `lcov`) software version(s)." %}

1.  The `install.sh` build script in the repository's root directory automates the code coverage report.
1.  Specifically, the GNU GCOV instrumentation files and the subsequent LCOV code coverage analysis reports can be readily generated via the following install script command on a Linux or macOS machine or a [Microsoft Windows Subsystem for Linux](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux){:target="_blank"},  
    ```bash  
    ./install.sh --codecov all
    ```  

1.  By default, the above command will build the **serial** library for the Fortran programming language.  
1.  To generate code coverage for the MPI parallelism, simply add the following install script flag,  
    ```bash  
    ./install.sh --codecov all --par mpi
    ```  
    or for the serial and all possible parallelism modes, 
    ```bash  
    ./install.sh --codecov all --par "none;mpi;omp;cafshared"
    ```  

1.  For more information on possible installation configuration flags and their implications see [installation configuration page](../../installation/install.config.md){:target="_blank"}.  

1.  To get help about the installation process and configuration, one can always try,  
    ```bash  
    ./install.sh --help
    ```  

{% include askme.html %}
{% include links.html %}
