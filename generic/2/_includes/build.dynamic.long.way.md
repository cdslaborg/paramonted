{% if include.lang == "MATLAB" %}
{% elsif include.lang == "Python" %}
{% endif %}

If,  

+   the ParaMonte prebuilt library is not available for your platform, or,
+   your system's architecture is other than those supported by the pre-built libraries, or,
+   you are testing a ParaMonte library pre-release, or,
+   you are a professional programmer constantly challenging your computer programming knowledge and skills, 

then the last resort to install the ParaMonte {{include.lang}} library is to build the library from scratch on your system. 
In such a case, you will have to follow the special instructions given for your platform on this website,  

+   [Windows](../install.bat.md){:target="_blank"}.  
+   [Darwin (macOS)](../install.sh.md){:target="_blank"}.  
+   [Linux or similar operating systems](../install.sh.md){:target="_blank"}.

See also the [pre-installation notes](../readme){:target="_blank"} and the [quick installation guidelines](../QUICKSTART.md){:target="_blank"}.