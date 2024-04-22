{% if pmLang == "C" %}
    {% assign progHeadExt = "h" %}
{% elsif pmLang == "C++" %}
    {% assign progHeadExt = "hpp" %}
{% else %}
{% endif %}
{% if pmLang == "C" or pmLang == "C++" %}

Here is the contents of the corresponding {{pmLang}} header file, which can also be downloaded as [logfunc.{{progHeadExt}}](https://github.com/cdslaborg/paramonte/blob/3548c097f2a25dfc0613061800656d27d0e0ddbe/example/mvn/{{pmLang}}/logfunc.{{progHeadExt}}){:target="_blank"}.

{% if pmLang == "C" %}
```c
{% include git/example/mvn/C/logfunc.h %}
```  
{% else %}
```cpp
{% include git/example/mvn/CPP/logfunc.hpp %}
```  
{% endif %}

{% endif %}
