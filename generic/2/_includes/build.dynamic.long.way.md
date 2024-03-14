{% if include.lang == "MATLAB" %}
{% elsif include.lang == "Python" %}
{% endif %}

If your platform is other than Windows/Linux/macOS or, if your system's architecture is other than `amd64`, also known as `x64`, or, if you are a professional programmer constantly challenging your computer programming knowledge and skills, then the last resort to install the ParaMonte {{include.lang}} library on your system is to build the library from scratch on your system. In such a case, you will have to follow the special instructions given for your platform on this website,  
-   [Windows](../windows/#building-the-paramonte-library-locally-on-your-system){:target="_blank"},  
-   [Darwin (macOS)](../macos/#building-the-paramonte-library-locally-on-your-system){:target="_blank"},  
-   [Linux or similar operating systems](../linux/#building-the-paramonte-library-locally-on-your-system){:target="_blank"},  
