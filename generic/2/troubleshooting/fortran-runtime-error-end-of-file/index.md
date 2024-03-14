---
title: "Fortran runtime error: End of file"
#tags: [multivariate, normal, sampling, paradram]
keywords: 
        troubleshooting
        Fortran runtime error
        End of file
        gfortran
        gnu
        input file
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

While running your simulations that use the ParaMonte library built via the GNU compilers, you may receive a runtime error message on the terminal like the following,  
<br>
<pre>
At line 1469 of file XXX
Fortran runtime error: End of file
</pre>
where the XXX is the name of some ParaMonte source file. The likely cause of this error is that the processor attempted to parse the contents of the external input file that you provided to the ParaMonte routines. However, while doing do, it reached the end of file before completing the input file reading. A quick fix to this error is to add one (or more) empty line(s) to the last line of the input file and to ensure that the files properly ends with an end-of-file signal. In particular, the last line should NOT be the terminating-character (the forward-slash: <b>/</b>) of a namelist-group.

{{site.data.alerts.end}}

{% include askme.html %}
{% include links.html %}
