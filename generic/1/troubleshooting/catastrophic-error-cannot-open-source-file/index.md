---
title: 'catastrophic error: cannot open source file "stdio.h"'
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
last_updated: January 1, 2020
mathjax: true
---

{% comment %}
https://github.com/nodejs/node-gyp/issues/569
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

While compiling and linking your C/C++ code against the ParaMonte libraries via the Intel C/C++ compilers on macOS, you may receive a compiler error message similar to the following,  
```text  
catastrophic error: cannot open source file "stdio.h"
```  

or,
```text  
catastrophic error: cannot open source file "math.h"
```  

or, 
```text  
xcode-select: error: tool 'xcodebuild' requires Xcode, but active developer directory '/Library/Developer/CommandLineTools' is a command line tools instance
```  

Taking the following steps to install the macOS <b>Command Line Tools</b> and then agreeing with its license terms may fix this issue. 
Open a <b>Bash command prompt</b> and type the following and run them,  
```bash  
xcode-select --install # Install the Command Line Tools in case you do not have it already.
sudo xcode-select --switch /Library/Developer/CommandLineTools # Enable command line tools
```  

or, alternatively, via the full Xcode.app (if it is already installed on your system), 
```bash  
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer # change the path if Xcode is installed somewhere else.
```  

You will have to also agree with the Xcode license terms, which requires running the following command on the Bash terminal,
```bash  
sudo xcodebuild -license accept
```  

{% include askme.html %}
{% include links.html %}
