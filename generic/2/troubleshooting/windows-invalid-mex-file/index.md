---
title: "Windows - MATLAB:mex:ErrInvalidMEXFile : Invalid MEX-file"
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
        mex
        MATLAB
        System
        Windows
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

While running the ParaMonte library functionalities that rely on precompiled MATLAB MEX files, the functionality may not work as expected by returning an error message like the following:  

```bash  
Error using pm.sampling.Sampler/run (line 415)
MATLAB:mex:ErrInvalidMEXFile : Invalid MEX-file
'D:\paramonte\bin\libparamonte_matlab_windows_amd64\+pm\lib\windows\amd64\gnu12\release\shared\heap\serial\nocheck\pm_sampling.mexw64':
The specified procedure could not be found.
```  

## Solution  


None identified as of today.

{% include askme.html %}
{% include links.html %}
