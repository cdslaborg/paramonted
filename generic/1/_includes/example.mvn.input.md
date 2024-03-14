### Calling the ParaMonte samplers: The input file  

We will store the simulation specifications in a separate external input file whose path `"./paramonte.in"` is given by the variable `inputFile` in the main code above. See [this page](../../../../usage/paradram/interface){:target="_blank"} for a detailed description of the structure and convention rules of the input files. Also, see [this page](../../../../usage/paradram/specifications){:target="_blank"} for detailed descriptions of the simulation specifications of the ParaDRAM sampler.  

{% include tip.html content="Note that the entire contents of the input file is optional. If not provided, all simulation variables will be assigned appropriate default values. Nevertheless, in some cases the user may need to provide further information about the simulation via the input simulation variables to help the ParaMonte routines yield better performance or more accurate results." %}  

{% include tip.html content="You can also pass the entire contents of the input file as a string value to the input variable `inputFile` of the ParaMonte routines, instead of passing the-path-to-this-input-file." %}  

Here is the contents of this `paramonte.in` input file,  

{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
{% if pmExam == "mvn" %}
{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}

```text
{% include git/example/mvn/input/paramonte.in %}
```  

{% endif %}
