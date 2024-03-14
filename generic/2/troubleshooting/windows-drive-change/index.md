---
title: Changing the root drive on the Windows CMD
tags: [multivariate, normal, sampling, paradram]
keywords: 
        troubleshooting
        windows
        drive
        change
        command
        prompt
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
{% endcomment %}


{{site.data.alerts.note}}

When you open an instance of the Intel Parallel Studio or the Microsoft Visual Studio command-line interface on Windows, the default working directory is on the drive where the software is installed, typically a path like

<pre>
C:\Program Files (x86)\IntelSWTools
</pre>

or

<pre>
C:\Program Files (x86)\Microsoft Visual Studio\2019\Community
</pre>

respectively.  

If the directory containing your ParaMonte source files is on a drive (e.g., <b><code>D:</code></b>) other than the software installation drive (e.g., <b><code>C:</code></b>), you will have to first change the drive letter on the command line and then change the directory to your target folder. For example, to switch from a folder on the <b><code>C:</code></b> drive to a folder <b><code>example</code></b> on the <b><code>D:</code></b> drive, you have to first change the drive like the following,  

{% highlight text %}
C:\Program Files (x86)\IntelSWTools> d:  
{% endhighlight %}

<pre>
D:\>
</pre>

and then change the directory to the destination folder,  

{% highlight text %}
D:\> cd example
{% endhighlight %}

<pre>
D:\example>
</pre>

{{site.data.alerts.end}}

{% include askme.html %}
{% include links.html %}
