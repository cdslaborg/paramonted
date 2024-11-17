---
title: Finding the MPI libraries on Windows
#tags: [multivariate, normal, sampling, paradram]
keywords: 
        troubleshooting
        MPI
        Intel
        not-found
        runtime
        dynamic
        shared
        dll
        so
        Windows
        mpiexec
        parallel
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
{% endcomment %}

{{site.data.alerts.note}}
While compiling and linking your parallel application via the Intel MPI libraries from within the dedicated Microsoft Visual Studio (MSVC) <b><code>x64</code></b> or <b><code>x86_64</code></b> command prompts, you may receive such linking errors as the following,  
<br>
<pre>
LINK : fatal error LNK1181: cannot open input file 'impi.lib'
ERROR in the compiling/linking [2]
</pre>
This error implies that the path to your Intel MPI library installation files is not properly setup in your environment. You can fix the error by calling the Intel's dedicated Batch script <b><code>mpivars.bat</code></b> that Intel has developed solely for the purpose of setting up the MPI environmental variables and paths before using the Intel MPI library. For detailed instructions on how to set up your Intel MPI environment see <a href="https://software.intel.com/en-us/get-started-with-mpi-for-windows" target="_blank">Getting Started with Intel® MPI Library for Windows OS (Beta)</a>. In brief, this script normally lives in a directory like,  

{% highlight text %}
C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019.4.245\windows\mpi\intel64\bin\mpivars.bat
{% endhighlight %}

Locate this setup-script on your system and execute the contents of it on your command line, like the following,  

{% highlight text %}
"C:\Program Files (x86)\IntelSWTools\compilers_and_libraries_2019.4.245\windows\mpi\intel64\bin\mpivars.bat"
{% endhighlight %}
{% highlight text %}
Intel(R) MPI Library 2019 Update 4 for Windows* Target Build Environment for Intel(R) 64 applications
Copyright 2007-2019 Intel Corporation.
{% endhighlight %}

Notice the use of double-quotations around the path to the script. This is ensure that any special <b>escape characters</b> in the path (such as the <b>white-space</b> characters) are properly taken care of.
{{site.data.alerts.end}}

{% include askme.html %}
{% include links.html %}
