---
title: ParaMonte Code Coverage Generation and Analysis Guidelines
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

## The ParaMonte kernel code coverage report  

The code coverage reports of the ParaMonte kernel library can be generated for a wide variety of input build configurations. For example, corresponding to each programming language (`C`, `C++`, `Fortran`, `MATLAB`, `Python`, `R`, ...), a separate code coverage report for the kernel routines can be generated. Similarly, different library builds (`debug`, `testing`, `release`), types (`static`, `shared`), and memory allocation (stack or heap) can lead to different code coverage reports.  

Among all build configurations, however, the single most important specification that yields the largest differences in code coverage reports is the parallelism paradigm (`none`, `mpi`, `cafsingle`, `cafshared`, `cafdist`). The the three Coarray (CAF) parallelism subtypes all yield the same code coverage reports. However, the code coverage reports for the serial, MPI, and Coarray modes are remarkably different since each parallelism type activates a different set of codes in the ParaMonte kernel routines.  

As such, the code coverage reports are only generated separately for the three library parallelism builds. The corresponding latest code coverage reports are permanently available at,  

+   [ParaMonte serial kernel]({{site.codecov}}/kernel/serial){:target="_blank"}  
+   [ParaMonte MPI parallel kernel]({{site.codecov}}/kernel/mpi){:target="_blank"}  
+   [ParaMonte Coarray parallel kernel]({{site.codecov}}/kernel/caf){:target="_blank"}  

## The ParaMonte kernel code coverage report generation  

The GNU GCOV instrumentation files and the subsequent LCOV code coverage analysis reports can be readily generated via the following install script command on a Linux or macOS machine, or a [Microsoft Windows Subsystem for Linux](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux){:target="_blank"},  

```bash  
./install.sh --codecov
```  

By default, the above command will `static`ally build the **serial** kernel library for the Fortran programming language in `debug` mode with `heap` memory allocation and will generate the corresponding GCOV instrumentation files and store the final LCOV code coverage report in a folder `codecov/kernel/serial` in the root directory of the ParaMonte library (where the `install.sh` script exists). To generate code coverage for the MPI parallel kernel, simply add the following script flag,  

```bash  
./install.sh --codecov --par mpi
```  

or, for the Coarray parallel kernel,  

```bash  
./install.sh --codecov --par cafshared
```  

or for the serial and all possible parallelism modes, 

```bash  
./install.sh --codecov --par "none mpi cafshared"
```  

The meaning and the syntax rules of the flags follow those of the ParaMonte installation procedure [on Linux](../installation/linux/#building-the-paramonte-library-locally-on-your-system){:target="_blank"} or [on macOS](../installation/linux/#building-the-paramonte-library-locally-on-your-system){:target="_blank"}.  

{% include important.html content="The code coverage report generation currently requires a [ParaMonte-compatible](../overview/paramonte-kernel-release-notes/){:target='_blank'} GNU Fortran compiler. If a compatible compiler is not identified on the system, the ParaMonte build script will automatically install a compatible GNU Compiler Collection on the system and will then perform the coverage analysis." %}

By default, the build script will perform **all** kernel tests. As of Dec 2020, there are $>883$ tests available that are tailored to test different functionalities for different parallelism builds. Broadly speaking, the tests can be categorized into two separate groups,  

1.  **Basic** tests, which test the functionality and accuracy of various fundamental tasks in the library.  
1.  **Sampler** tests, which test the functionality and accuracy of the ParaMonte sampler routines for different simulation settings.  

To focus the code coverage on only a particular aforementioned category of tests, simply provide its name along with the flag `-t` or `--test` on the command prompt when calling the build script like,  

```bash  
./install.sh --codecov --test basic
```  

or,  

```bash  
./install.sh --codecov -t sampler
```  

To get help, one can always try,  

```bash  
./install.sh --help
```  

{% include askme.html %}
{% include links.html %}
