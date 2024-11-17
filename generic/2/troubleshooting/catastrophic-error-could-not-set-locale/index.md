---
title: 'C/C++ Catastrophic error: could not set locale "" to allow processing of multibyte characters'
#tags: 
keywords: 
        troubleshooting
        libgfortran
        not-found
        runtime
        dynamic
        shared
        dll
        so
        Fortran
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
{{site.data.alerts.note}}
{{site.data.alerts.end}}
{% endcomment %}


While compiling and linking your C/C++ code against the ParaMonte libraries via the Intel C/C++ compilers, in particular, on macOS, you may receive a compiler error message similar to the following,  
<pre>
Catastrophic error: could not set locale "" to allow processing of multibyte characters
</pre>

This is apparently a bug in Intel C/C++ compiler on macOS, as of 2020. Such compile/link time errors can be resolved by passing the following compiler flag to the Intel compilers,  
```bash
-no-multibyte-chars
```  
By default, this compiler flag is added to the example-build-scripts of the prebuilt ParaMonte libraries on macOS. Therefore, this problem will only arise if you are manually compiling and linking your example C/C++ codes against the ParaMonte library routines.

{% include askme.html %}
{% include links.html %}
