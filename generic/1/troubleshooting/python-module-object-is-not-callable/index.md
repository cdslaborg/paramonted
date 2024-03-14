---
title: "TypeError: 'module' object is not callable"
tags: [multivariate, normal, sampling, paradram]
keywords: 
        troubleshooting
        runtime
        Python
        segmentation
        fault
        matplotlib
        seaborn
#summary: "."
sidebar: home_sidebar
#permalink: /program-units/functions/index.html
last_updated: January 1, 2020
mathjax: true
---

{% comment %}
1. [web-link](){:target="_blank"}  
C/C++ examples documentation is currently being developed. Please check back in a few days, or contact the authors for quick help.  
<div id="toc"></div>  
{{site.data.alerts.note}}
{% include build.windows.drive.change.md %}
{{site.data.alerts.end}}
{% endcomment %}

While attempting to install (or upgrade) the `ParaMonte::Python` library via `pip` or `pip3`,  

```bash  
pip install --user --upgrade paramonte
```  

one may get an error like the following,  

```bash  
Traceback (most recent call last):
  File "/opt/apps/intel18/python3/3.7.0/bin/pip", line 11, in <module>
    sys.exit(main())
TypeError: 'module' object is not callable
```  

Apparently, this error happens because of a conflict between the user-specific and the global installations of `pip`. If you encounter such an error, a quick resolution might be the following command,  

```bash  
python3 -m pip uninstall pip
```  

{% include askme.html %}
{% include links.html %}
