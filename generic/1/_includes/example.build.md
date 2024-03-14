<br>

{% assign buildPage = "../../../build" %}
{% if pmLang == "C" %}
    {% assign progLang = "C" %}
    {% assign progLangExt = "c" %}
    {% assign progHeadExt = "h" %}
    {% capture buildPage %}{{buildPage}}/c/{% endcapture %}
{% elsif pmLang == "C++" %}
    {% assign progLang = "C++" %}
    {% assign progHeadExt = "hpp" %}
    {% assign progLangExt = "cpp" %}
    {% capture buildPage %}{{buildPage}}/cpp/{% endcapture %}
{% elsif pmLang == "Fortran" %}
    {% assign progLang = "Fortran" %}
    {% assign progLangExt = "f90" %}
    {% capture buildPage %}{{buildPage}}/fortran/{% endcapture %}
{% endif %}

## Compiling and linking to generate the executable  

Now, follow [the instructions on this page]({{buildPage}}){:target="_blank"} on how to build your {{progLang}} example for serial and parallel simulations on the Operating System (OS) of you choice: `Windows`, `Linux`, or `macOS` / `Darwin`.
