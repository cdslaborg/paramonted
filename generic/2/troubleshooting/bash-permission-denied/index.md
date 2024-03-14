---
title: "-bash: Permission denied"
#tags: 
keywords: 
        troubleshooting
        bash
        Permission
        denied
        chmod
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


{{site.data.alerts.note}}

While attempting to run Bash scripts ( for example,<b><code>./install.sh</code></b> ),  if you encounter such errors as the following,  

<pre>
-bash: ./install.sh: Permission denied
</pre>

it means that the script file does not have the executable rights to run as an executable. To solve the problem, type the folllowing on the Bash terminal,  

{% highlight bash %}
chmod +x ./install.sh
{% endhighlight %}

This will give the <b><code>./install.sh</code></b> Bash script the executable attribute. Replace <b><code>./install.sh</code></b> with the filename of the script that you are trying to run.

{{site.data.alerts.end}}

{% include askme.html %}
{% include links.html %}
