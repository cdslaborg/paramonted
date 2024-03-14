---
title: 'Python: Could not find module "libparamonte_python_*" (or one of its dependencies)'
#tags: 
keywords: 
        troubleshooting
        mpi
        intel
        python
        parallel
        dependency
        shared
        dylib
        impi
        dll
        so
#summary: "."
sidebar: home_sidebar
#permalink: /program-units/functions/index.html
last_updated: January 1, 2020
mathjax: true
---

{% comment %}
1. [web-link](){:target="_blank"}.  
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


One error that is frequently encountered by the ParaMonte users in parallel simulations is of the following nature,  
```python  
Could not find module 'libparamonte_python_windows_x64_intel_release_shared_heap_impi.dll' (or one of its dependencies). Try using the full path with constructor syntax.
Traceback (most recent call last):
  File "C:\Users\cmbac\AppData\Roaming\Python\Python38\site-packages\paramonte\_ParaMonteSampler.py", line 612, in _runSampler
    pmdll = ct.CDLL(libPath)
  File "C:\ProgramData\Anaconda3\lib\ctypes\__init__.py", line 373, in _init_
    self._handle = _dlopen(self._name, mode)
FileNotFoundError: Could not find module 'C:\Users\cmbac\AppData\Roaming\Python\Python38\site-packages\paramonte\libparamonte_python_windows_x64_intel_release_shared_heap_impi.dll' (or one of its dependencies). Try using the full path with constructor syntax.
```  

The primary reason for getting such error messages is that the MPI runtime library variables and paths have not been defined in your Python, Bash, or Anaconda command-prompt session. To resolve this error, type the following commands in your Python session and carefully follow the instructions provided to (re)install the MPI library or define the MPI runtime variables prior to running your MPI simulations,  
```python  
import paramonte as pm
pm.verify()
```  

If this does not resolve the error, please report this error on [the issues page of the ParaMonte repository on GitHub]({{site.issues}}){:target="_blank"}.  

{% include askme.html %}
{% include links.html %}
