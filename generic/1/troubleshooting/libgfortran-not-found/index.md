---
title: libgfortran not found
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
The latest release of the prebuilt ParaMonte libraries for dynamic linking for the Linux Operating System has been built via the <b>GNU Compiler Collection <code>version {{site.gnuVersionLinux}}</code></b>. As a result, when using these specific GNU-based prebuilt ParaMonte libraries, you may encounter C/C++/Fortran application compilation and linking errors, similar in nature to the following error message,  
<pre>
/opt/apps/gcc/6.3.0/bin/ld: warning: libgfortran.so.5, needed by libparamonte_c_linux_x64_gnu_release_shared_heap.so, not found
</pre>
All of such errors imply that the compiler/linker cannot locate the required <b><code>libgfortran</code></b> or other shared library files on your system, or if they exist, they are not compatible with the required missing shared file and therefore cannot serve as a substitute. The possible resolutions are the following,  

<ol>
    <li>
        If you are confident that the missing shared library files already exist on your system, then locate the missing files and help your compiler (or the ParaMonte library) find the missing files by redefining the Bash environmental variable <b><code>LD_LIBRARY_PATH</code></b>,  
        {% highlight bash %}export LD_LIBRARY_PATH=PATH_TO_SHARED_OBJECT_FOLDER:$LD_LIBRARY_PATH{% endhighlight %}
        where you will have to replace <b><code>PATH_TO_SHARED_OBJECT_FOLDER</code></b> with the path to the folder containing the required object file(s).
        <br>
        For example, for a local build of the ParaMonte library for which the required GNU compilers have been also automatically built by the ParaMonte build-scripts, this {{site.libgfortranLinux}} shared object file resides in the build directory,  
        <pre>/build/prerequisites/prerequisites/installations/gnu/{{site.gnuVersionLinux}}/lib64</pre> relative to the root directory of the ParaMonte library.
    </li>
    <li>
        Install a fresh compatible version of the GNU Compiler Collection, or,  
    </li>
    <li>
        As the last resort, download the <a href="{{site.currentReleaseDownload}}/{{site.libgfortranLinux}}">libgfortran shared library file</a> against which the prebuilt ParaMonte libaries have been linked, then place thelibrary file in the same folder as the ParaMonte library folder. Then redefine the Bash environmental variable <b><code>LD_LIBRARY_PATH</code></b> to also search the working build directory of your application for the dependencies,  
        {% highlight bash %}export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH{% endhighlight %}
        and then rebuild or rerun your application.
    </li>
    <li>
        If none of the above works, installing the full ParaMonte library from scratch via the build-script <b><code>install.sh</code></b> could potentially resolve the problem,
        {% highlight bash %}./install.sh --fresh --yes-to-all{% endhighlight %}
        The ParaMonte libraries built for differenent configurations will be strored in the root folder of the project inside the folder <b><code>bin/</code></b>. Each build folder will contain a <b><code>setup.sh</code></b> Bash script. Sourcing this Bash script on the command line will automatically add all the relevant library paths to your current Bash session, which in turn, will potentially resolve the compile/link-time missing-library errors you have encountered,  
        {% highlight bash %}source ./setup.sh{% endhighlight %}
        When you build your applications via the dedicated <b><code>build.sh</code></b> scripts, this <b><code>setup.sh</code></b> script will be automatically called.
    </li>
    <li>
        Finally, if misery seems to be never-ending, we suggest you switch to using the same ParaMonte library configuration of your choice, but built via the Intel compilers, which will not cause such missing library errors.
    </li>
</ol>

{{site.data.alerts.end}}

{% include note.html content="On macOS (Darwin), such missing-library errors should generally never happen, if you follow [the macOS installation guidelines](../../installation/macos/){:target='_blank'} and make sure to install the same GNU compilers and MPI libraries with which the ParaMonte libraries have been built." %}

{% include askme.html %}
{% include links.html %}
