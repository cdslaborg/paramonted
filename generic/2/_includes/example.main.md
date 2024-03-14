{% if pmLang == "C" %}
    {% assign progLangExt = "c" %}
    {% assign progHeadExt = "h" %}
{% elsif pmLang == "C++" %}
    {% assign progLangExt = "cpp" %}
    {% assign progHeadExt = "hpp" %}
{% elsif pmLang == "Fortran" %}
    {% assign progLangExt = "f90" %}
    {% assign progHeadExt = "f90" %}
{% endif %}

<br>

## Calling the ParaMonte samplers  

Suppose we want to randomly sample the above objective function via the **D**elayed-**R**ejection **A**daptive **M**etropolis-Hastings **M**arkov Chain Monte Carlo sampler of ParaMonte (the **ParaDRAM** sampler).  

{% comment %}
    <a name="linking-methods"></a><br><br>
    There are two ways to compile and link the above objective function to the ParaMonte library:  
    1. you have built the ParaMonte library on your system from scratch using a Fortran/C compiler suite installed on your system (ideally, the Intel Parallel Studio or the GNU Compiler Collection), or,  
    2. you want to use the prebuilt ParaMonte libraries, which can be downloaded from [the ParaMonte release page on GitHub]({{site.currentRelease}}){:target="_blank"}.    
{% endcomment %}

{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
{% if pmLang == "C" or pmLang == "C++" %}
{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}

The following [{{pmLang}} main code](https://raw.githubusercontent.com/cdslaborg/paramonte/main/example/main.{{progLangExt}}){:target="_blank"} can be used to call the ParaMonte library routine `runParaDRAM()`,  

{% if pmLang == "C" %}
```c
{% include git/example/main.c %}
```
{% elsif pmLang == "C++" %}
```cpp
{% include git/example/main.cpp %}
```
{% endif %}

### Calling the ParaMonte samplers: The signature header file  

Here is the contents of the {{pmLang}} `paramonte.{{progHeadExt}}` [signature header file](https://raw.githubusercontent.com/cdslaborg/paramonte/main/src/interface/{{pmLang}}/paramonte.{{progHeadExt}}){:target="_blank"} for the ParaMonte library routines,  

{% if pmLang == "C" %}
```c
{% include git/src/interface/C/paramonte.h %}
```
{% elsif pmLang == "C++" %}
```cpp
{% include git/src/interface/CPP/paramonte.hpp %}
```
{% endif %}

{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
{% elsif pmLang == "Fortran" %}
{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}

Depending on whether you have already built the ParaMonte library from scratch on your system or you intend to use the prebuilt ParaMonte libraries, as well as the compiler you are using to build your application, there are two interfaces to the ParaDRAM sampler. These two interfaces are separated via the compiler preprocessor flag `IS_COMPATIBLE_COMPILER` in the [main.f90](https://raw.githubusercontent.com/cdslaborg/paramonte/main/example/main.f90){:target="_blank"} code below,  

```fortran
{% include git/example/main.f90 %}
```  

Therefore, if you intend to use the Object-Oriented Programming (OOP) calling interface, you will have to define and pass the preprocessor flag `IS_COMPATIBLE_COMPILER` at compile-time to your compiler (to be discussed later). If this flag is not defined at compile-time, the compiler will automatically use the latter procedural-style calling method enclosed between `#else` and `#endif` Fortran preprocessor directives in the main code above.  

### Calling the ParaMonte samplers: The signature module file  

Here is the contents of the Fortran `paramonte.90` [signature module file](https://raw.githubusercontent.com/cdslaborg/paramonte/main/src/interface/Fortran/paramonte.f90){:target="_blank"} for the ParaMonte library routines,  

```fortran
{% include git/src/interface/Fortran/paramonte.f90 %}
```

Again, note that there are two interfaces to the ParaMonte library routines, separated via the compiler preprocessor flag `IS_COMPATIBLE_COMPILER` in the signature module file.  

In the following sections, we will describe which interface is suitable for what circumstances.  

### Calling the ParaMonte samplers: The modern object-oriented style  

The Object-Oriented-Programing (OOP) style interface is the parts of the codes in the above that are enclosed by the `IS_COMPATIBLE_COMPILER` preprocessor flag. The OOP interface can be used only if,  

1. you have built the ParaMonte library from scratch on your system using a Fortran compiler installed on your system (ideally, the Intel `ifort` Fortran compiler), or,  
2. you intend to use the prebuilt ParaMonte libraries which can be downloaded from the [ParaMonte release page on GitHub]({{site.currentRelease}}){:target="_blank"}, but you promise that you are using a compatible compiler to compile your example. Typically this means using the [same compiler/library suite and version](https://github.com/cdslaborg/paramonte/blob/main/CHANGES.md){:target="_blank"} that has been used to build ParaMonte.  

If one of the above two scenarios describes your situation, then you can safely use the OOP-style interface (enclosed between the two preprocessor directives `#if defined IS_COMPATIBLE_COMPILER` and `#else`) in the above code.  

{% include tip.html content='As you may have noticed in the above main code, one advantage of the object-oriented style is that upon finishing the simulation, all simulation properties and results are stored in a single object (e.g., **`pmpd`** in the above program) which belongs to the [ParaDRAM_type](https://github.com/cdslaborg/paramonte/blob/main/src/kernel/ParaXXXX_mod.inc.f90){:target="_blank"} class. This information can be then readily used and processed for other purposes within your simulation at runtime.' %}

Using this modern Fortran style, you can also provide optional arguments at the time of calling the ParaMonte routines. For example, the variables `chainSize`, `adaptiveUpdateCount`, ..., specified in the OOP-style interface of the `runSampler()` method in the above code would overwrite any values for the corresponding variables specified taken from the [input file](https://raw.githubusercontent.com/cdslaborg/paramonte/main/example/{{pmExam}}/input/paramonte.in){:target="_blank"}: `./paramonte.in` (unless you set the input specification variable [inputFileHasPriority](../../../usage/paradram/specifications/#inputfilehaspriority){:target="_blank"} to `true` from within the input file).  

In addition to being able to assign simulation specifications from within an input file, the current major release the ParaMonte library also enables the assignment of all simulation specifications from the Fortran Object-Oriented interface to the ParaMonte sampler routines (except the input specification variable [inputFileHasPriority](../../../usage/paradram/specifications/#inputfilehaspriority){:target="_blank"} which is always available only from within the input file).  

{% include note.html content="You can view the full object-oriented interface of the **`runSampler()`** method of the **`ParaDRAM_type`** sampler class in [ParaDRAM_mod.inc.f90](https://github.com/cdslaborg/paramonte/blob/main/src/kernel/ParaXXXX_mod.inc.f90){:target='_blank'}." %}

### Calling the ParaMonte samplers: The old, less flexible, but more portable style  

If you intend to use the prebuilt ParaMonte libraries to build your application (or for some reason, you are building your example with a compiler other than the one you used for building the ParaMonte library), then the modern object-oriented style of calling ParaMonte routines described in the previous section may not work for you. This is mainly due to the potential mismatch between the existing symbols in the ParaMonte library and the symbols that your different compiler expects to see in the ParaMonte library.  

In such a case, you can use the simpler procedural Fortran interface to the ParaMonte library routines as shown in the above main code, enclosed between `#else` and `#endif` Fortran preprocessor directives. You can view the `runParaDRAM()` sampler routine's interface in the signature module file `paramonte.f90` shown in the previous sections in the above.

{% include note.html content="Although, the procedural interface provides more portability, there is, in general, no guarantee that this procedural interface compiled by a certain compiler would match an example main code compiled with a different compiler. However, as of today, the procedural interface to the ParaMonte library routines is interoperable between the Intel and GNU Fortran compilers. This means that **you can link your main procedural-interface codes compiled via the GNU Fortran compiler against the ParaMonte libraries prebuilt via the Intel Fortran compiler, and vice versa**. While this is true at the moment, the situation may change in the future releases of the two compilers (although it seems unlikely)." %}  

{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
{% endif %}
{% comment %}%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{% endcomment %}
