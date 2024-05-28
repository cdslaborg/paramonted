---
title: 'xcrun: error: unable to find utility "clang"'
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
last_updated: March 14, 2024
mathjax: true
---

{% comment %}
1. [web-link](){:target="_blank"}  
https://www.mathworks.com/matlabcentral/answers/512901-mex-xcodebuild-error-sdk-macosx10-15-4-cannot-be-located
{{site.data.alerts.note}}
{{site.data.alerts.end}}
{% endcomment %}



While building the ParaMonte MATLAB library on macOS, you may receive a compiler error message similar to the following,  

```text  
xcrun: error: unable to find utility "clang", not a developer tool or in PATH
```  

or particularly, after macOS automatic update to a more recent version, for example, macosx10.15.4,  

```text  
MEX - xcodebuild: error: SDK "macosx10.15.4" cannot be located
```  

To resolve this error,  

-   Open MATLAB. On the MATLAB command line, type,  
    ```matlab  
    compilerCfg = mex.getCompilerConfigurations
    open(compilerCfg(1).MexOpt)
    open(compilerCfg(2).MexOpt)
    ```  
-   The above commands should open two MATLAB internal files named `mex_C_maci64.xml` and `mex_C++_maci64.xml`. Toward the ends of each one of these files, look for a line that is similar to, or exactly, the following,  
    ```xml  
    <SDKVER>
        <cmdReturns name="xcrun -sdk macosx --show-sdk-version"/>
    </SDKVER>
    ```  
-   Once you find the lines, replace them with the following,  
    ```xml  
    <SDKVER>
        <cmdReturns name="xcrun -sdk macosx --show-sdk-version | cut -c1-5"/>
    </SDKVER>
    ```  
    Once you make the changes, save boths files and close them.  
-   Now, on the MATLAB command line, type,  
    ```matlab  
    mex -setup C++
    mex -setup C
    ```  
-   The above should hopefully fix the error. Now open a Bash terminal and rerun the same command that you originally used to build the ParaMonte library.

{% include askme.html %}
{% include links.html %}
