If you linking your applications (on <b>Linux</b> or <b>macOS</b>) against a <b>shared</b> build of the ParaMonte library, you may encounter runtime errors similar in nature to the following,  
<pre>
main.exe: error while loading shared libraries: 
libparamonte.so: cannot open shared object file: No such file or directory
</pre>
Such an error message imply that the shared runtime library mentioned in the error message is missing from the known search paths to application. To resolve such runtime errors, you will have to add the path to the required runtime shared library to your Bash environmental variable <b><code>LD_LIBRARY_PATH</code></b>. For example, the following will prepend the current directory to the list of paths for the runtime library search.  
{% highlight bash %}
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
{% endhighlight %}
