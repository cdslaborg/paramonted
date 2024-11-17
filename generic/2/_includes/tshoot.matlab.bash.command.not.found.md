While invoking the MATLAB application from the Bash command line, the path to the MATLAB executable may be undefined in your Bash terminal. Consequently, calling MATLAB on the command line via,
{% highlight bash %}matlab{% endhighlight %}
would lead to such error messages as the following,  
<pre>bash: matlab: command not found</pre>
To resolve the error, you need to provide the full path to the MATLAB executable. On macOS, the full path to the MATLAB executable typically is, 
{% highlight bash %}
/Applications/MATLAB_R2023a.app/bin/matlab
{% endhighlight %}
and on Linux, 
{% highlight bash %}
/usr/local/MATLAB/R2023a/bin/matlab
{% endhighlight %}
where in both cases you will have to replace <b><code>R2023a</code></b> with the MATLAB version installed on your system. You can also execute the following command on your Bash terminal to add a MATLAB executable alias to your <b><code>~/.bashrc</code></b> file so that every time a bash terminal is opened on your system, or when you execute <b><code>source ~/.bashrc</code></b> in your current Bash session, it would automatically recognize the path to the MATLAB executable, 
{% highlight bash %}
echo "alias matlab=path_to_matlab_executable" >> ~/.bashrc
{% endhighlight %}
where in the above command, you will have to replace <b><code>path_to_matlab_executable</code></b> with the correct full path to the MATLAB executable on your system. 
<br><br>
If for any reasons, you can not find the MATLAB executable's path, you can open a MATLAB session via the Linux / macOS search software. Once MATLAB session is open, type in the MATLAB command line,
{% highlight matlab %}
matlabroot
{% endhighlight %}
to get the root installation path of MATLAB. You can find information about this command on <a href="https://www.mathworks.com/help/matlab/ref/matlabroot.html" target="_blank">MATLAB website</a>. Then, add <code>/bin/matlab</code> to this path to construct the full path to the MATLAB executable and repeat the above instructions again.  