{% if include.lang == "MATLAB" %}
{% elsif include.lang == "Python" %}
{% endif %}

If,  

+   the ParaMonte prebuilt library is not available for your platform, or,
+   your system's architecture is other than those supported by the pre-built libraries, or,
+   you are testing a ParaMonte library pre-release, or,
+   you are a professional programmer yearning to challenge your computer programming knowledge and skills, 

then the last resort to install the ParaMonte {{include.lang}} library is to build the library from scratch on your system. 
In such a case, you will have to follow the special instructions given for your platform on this website,  

+   [Windows](../install.bat.md){:target="_blank"}.  
+   [Darwin (macOS)](../install.sh.md){:target="_blank"}.  
+   [Linux or similar operating systems](../install.sh.md){:target="_blank"}.

{% if include.lang == "MATLAB" %}

{{site.data.alerts.important}}
Before proceeding to the platform-specific build instructions above, you must set up your <b>MATLAB MEX compiler</b>. 
To do so, open a ParaMonte-compatible MATLAB session which you intend to use with ParaMonte application later. 
Type the following command on the MATLAB command prompt:
<br>
<pre>
mex -setup C
</pre>
This command will set up the MATLAB MEX compiler for the C programming language. 
If necessary or desired, you can additionally set up the MATLAB MEX compiler for C++ and Fortran programming languages.
<pre>
mex -setup C++
mex -setup Fortran
</pre>

Beware that each MATLAB version release is only compatible with a handful of C, C++, and Fortran compilers. 
For information on this matter, consult the MATLAB documentation website for the MATLAB MEX compiler. 
{{site.data.alerts.end}}

{% elsif include.lang == "Python" %}

{% endif %}

See also the [pre-installation notes](../readme){:target="_blank"} and the [quick installation guidelines](../QUICKSTART.md){:target="_blank"}.