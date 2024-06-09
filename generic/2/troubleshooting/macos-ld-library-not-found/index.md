---
title: "macOS ld: library not found for -lSystem"
#tags: 
keywords: 
        troubleshooting
        not-found
        runtime
        dynamic
        shared
        macOS
        dylib
        dll
        ld
        so
        System
        Fortran
        gfortran
#summary: "."
sidebar: home_sidebar
#permalink: /program-units/functions/index.html
last_updated: March 14, 2024
mathjax: true
---

{% comment %}
1. [web-link](){:target="_blank"}  
C/C++ examples documentation is currently being developed. Please check back in a few days, or contact the authors for quick help.  
<div id="toc"></div>  
{{site.data.alerts.note}}
{% include build.windows.drive.change.md %}
{{site.data.alerts.end}}
{% highlight text %}
{% endhighlight %}
<b><code></code></b>
{% endcomment %}


## Problem  

While building the ParaMonte library on a macOS (Darwin) operating system, you may encounter an error of the following nature:  

```bash  
ld: library not found for -lSystem
collect2: error: ld returned 1 exit status
```  

This error happens particularly when the GCC Fortran compiler `gfortran` is directly called by the ParaMonte library build script `install.sh` located in the root directory of the library's repository on [GitHub](https://github.com/cdslaborg/paramonte).  

## Solution  


While CMake is typically capable of finding the require link time libraries, adding the following two lines to the `.zshrc` (or `.bashrc`) file in the user home directory will resolve the error for all usages on the `zsh` (or `bash`) command line:  

```bash  
export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
export LIBRARY_PATH="$LIBRARY_PATH:$SDKROOT/usr/lib"
```  

If the `.zshrc` (or `.bashrc`) file does not exist in the user home directory represented by `~` on the command-line, first create the file and then add the above two commands to it, save it, and close it.  

{% include askme.html %}
{% include links.html %}
