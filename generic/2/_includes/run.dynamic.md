{% if include.lang == "MATLAB" %}
    {% assign langExt = "m" %}
    {% capture cmdSerialScriptCall %}{{include.lang|downcase}} -batch "main"{% endcapture %}
    {% capture cmdMpiScriptCall %}{{include.lang|downcase}} -batch "main_mpi"{% endcapture %}
{% elsif include.lang == "Python" %}
    {% assign langExt = "py" %}
    {% capture cmdSerialScriptCall %}{{include.lang|downcase}} main.py{% endcapture %}
    {% capture cmdMpiScriptCall %}{{include.lang|downcase}} main_mpi.py{% endcapture %}
{% endif %}

{% if include.lang == "MATLAB" %}
{% elsif include.lang == "Python" %}
{% endif %}

{% comment %}
{% if include.lang == "MATLAB" %}
{% endif %}
{% endcomment %}


The procedure for running {{include.lang}} simulations, whether serial or parallel, is identical to the procedure for running C/C++/Fortran applications, except that the user needs to replace the executable's name `main.exe` with `{{cmdSerialScriptCall}}` on a command prompt to run the {{include.lang}} script. Here, `main` is the name of the {{include.lang}} script containing your ParaMonte simulation code (whether serial or parallel, does not matter).  

{% include important.macos.sip.md %}  

## Running {{include.lang}} simulations **on the command-prompt**  

### Running {{include.lang}} simulations on the command-prompt **on a single processor**  

{% if include.lang == "MATLAB" %}
{% capture thisCommandPrompt %}the Windows `cmd.exe`{% endcapture %}
{% elsif include.lang == "Python" %}
{% capture thisCommandPrompt %}the **Anaconda3**{% endcapture %}
{% endif %}

Suppose you want to run [this {{include.lang}} script named `main.{{langExt}}`](https://raw.githubusercontent.com/cdslaborg/paramonte/main/example/main.{{langExt}}){:target='_blank'} which calls the ParaMonte library routines to sample a mathematical objective function implemented in [this {{include.lang}} file named `logfunc.{{langExt}}`](https://raw.githubusercontent.com/cdslaborg/paramonte/main/example/mvn/{{include.lang}}/logfunc.{{langExt}}){:target='_blank'} on a single processor. Assuming that you have already successfully [installed the ParaMonte {{include.lang}} library](../../installation/{{include.lang|downcase}}/){:target='_blank'} on your system, all you need to do is to,  
1.  open a {{include.lang}}-aware terminal (e.g., {{thisCommandPrompt}} command-prompt on Windows or the Bash terminal on Linux/macOS),  
1.  navigate to the folder containing your code, and,  
1.  type the following on the command line,  
    ```bash
    {{cmdSerialScriptCall}}
    ```  
    {% if include.lang == "MATLAB" %}
    {% include tip.bash.matlab.command.not.found.md %}  
    {% endif %}

### Running {{include.lang}} simulations on the command-prompt **on multiple processors**  

{{site.data.alerts.important}}
To run MPI-parallel {{include.lang}} applications, an MPI runtime library is required (ideally, the Intel MPI library on Windows/Linux and Open-MPI library on macOS). <b>The ParaMonte library can install the missing MPI library for you automatically</b>, if you do not have it. At the time of installation, the ParaMonte {{include.lang}} library automatically asks for your permission to install any missing libraries on your system when you type
{% if include.lang == "MATLAB" %}
{% highlight matlab %}
addpath(genpath("./"),"-begin"); % add the ParaMonte library directories to MATLAB's list of search paths.
pm = paramonte(); % instantiate an object of class paramonte.
{% endhighlight %}
{% elsif include.lang == "Python" %}
{% highlight python %}
import paramonte as pm
{% endhighlight %}
{% endif %}
for the <b>first time</b> in {{include.lang}} session. So, <b>make sure to run the above command(s) for the first time after installing the ParaMonte library on your system, and before running any MPI-parallel ParaMonte simulations</b>. To verify the existence of the runtime libraries on your system at any later time after running the above command(s), type, 
{% highlight python %}
pm.verify()
{% endhighlight %}
in your {{include.lang}} session.
{{site.data.alerts.end}}

Suppose you want to run [this MPI-enabled {{include.lang}} script named `main_mpi.{{langExt}}`](https://raw.githubusercontent.com/cdslaborg/paramonte/main/example/main_mpi.{{langExt}}){:target='_blank'} which calls the ParaMonte library parallel routines to sample a mathematical objective function implemented in [this {{include.lang}} file named `logfunc.{{langExt}}`](https://raw.githubusercontent.com/cdslaborg/paramonte/main/example/mvn/{{include.lang}}/logfunc.{{langExt}}){:target='_blank'} on multiple processors. 

{{site.data.alerts.tip}}
Note that <b>the only difference</b> between 
<a href="https://raw.githubusercontent.com/cdslaborg/paramonte/main/example/main_mpi.{{langExt}}" target="_blank">the above MPI-enabled {{include.lang}} script <b><code>main_mpi.{{langExt}}</code></b></a>
 and 
<a href="https://raw.githubusercontent.com/cdslaborg/paramonte/main/example/main.{{langExt}}" target="_blank">the corresponding serial {{include.lang}} script <b><code>main.{{langExt}}</code></b></a> 
is the additional simulation attribute,  
{% if include.lang == "MATLAB" %}
{% highlight matlab %}
pmpd.mpiEnabled = true;
{% endhighlight %}
{% elsif include.lang == "Python" %}
{% highlight python %}
pmpd.mpiEnabled = True
{% endhighlight %}
{% endif %}
which ensures the MPI-enabled ParaMonte library routines will be called for the parallel simulation. <b>Absolutely NO MPI parallel programming is needed by the user to run the ParaMonte {{include.lang}} simulations in parallel</b>.
{{site.data.alerts.end}}

Assuming that you have already successfully [installed the ParaMonte {{include.lang}} library](../../installation/{{include.lang|downcase}}/){:target='_blank'} on your system, all you need to do is to,  
1.  open a {{include.lang}}-aware terminal (e.g., {{thisCommandPrompt}} command-prompt on Windows or the Bash terminal on Linux/macOS),  
1.  navigate to the folder containing your code, and,  
1.  run the following on the command line,  
    -   **On Windows**  
        Invoke the MPI launcher `mpiexec` on the command line via,  
        ```batch  
        mpiexec -localonly -n 3 {{cmdMpiScriptCall}}
        ```  
        where the flag `-localonly` ensures that the simulation is run only on a single node. This option avoids the invocation of the Hydra service which would require prior registration of the service. The flag `-n 3` assigns three MPI tasks to three physical processors for the simulation. Change the number 3 to as many processor counts as you wish to use.  
        {% include tip.html content="To run your simulation on a cluster of nodes, follow [the guidelines and instructions provided by the Intel MPI library development team](https://software.intel.com/en-us/mpi-developer-reference-windows-global-options){:target='_blank'}." %}
    -   **On Linux / macOS**  
        Invoke the MPI launcher `mpiexec` on the command line via,  
        ```bash
        mpiexec -n 3 {{cmdMpiScriptCall}}
        ```  
        The flag `-n 3` assigns three MPI tasks to three physical processors for the simulation. Change the number 3 to as many processor counts as you wish to use.  
        {% include note.html content='Some supercomputing centers (for example, the Texas Advanced Computing Center) may have their dedicated MPI launchers other than **`mpiexec`** to run applications in parallel. A prime example of this is **`ibrun`**. Consult your supercomputing center to ensure you invoke the right MPI launcher for parallel applications, in particular, when running the application on a cluster of nodes of multiple processors.' %}
        {% if include.lang == "MATLAB" %}
        {% include tip.bash.matlab.command.not.found.md %}  
        {% endif %}
{% include run.parallel.warning.md %}

{% if include.lang == "MATLAB" %}

## Running {{include.lang}} simulations **from within a MATLAB session**  

You can also run the ParaMonte simulations from within a MATLAB session, but **only in serial mode** (since parallel simulations cannot be performed from within a MATLAB session). To run serial simulations from within MATLAB, 
1.  Depending on your operating system,  
    -   on **Windows**, either open a MATLAB session from the Windows Startup Menu or simply call the MATLAB executable on the Windows command line.  
    -   on **Linux/macOS**, open a MATLAB session by calling the MATLAB executable on the Bash terminal,  
        ```matlab  
        matlab
        ```  
        {% include important.html content="It is imperative that you open your MATLAB session by calling the matlab executable from the Bash command line since the standard output of the ParaMonte library redirects to the Bash command line as opposed to the MATLAB command line." %}  
        {% include tip.bash.matlab.command.not.found.md %}  
1.  Change the working directory of MATLAB to the folder containing your `main.m` script.  
1.  Before running the script, make sure you have added the path to the root directory of the ParaMonte library to your MATLAB's list of search paths via,  
    ```matlab  
    addpath(genpath(ParaMonteRootDir));
    ```  
    where you will have to replace the variable `ParaMonteRootDir` with a string (e.g., `"./"`) that points to the root directory of the ParaMonte MATLAB library (i.e., the directory in which the ParaMonte library's license file `LICENSE` exists).  

{% elsif include.lang == "Python" %}

## Running {{include.lang}} simulations **from within an IPython session**  

The procedures for running ParaMonte {{include.lang|downcase}} simulations from within an IPython or Jupyter session, whether serial or parallel, are the same as the procedures for running {{include.lang}} simulations on the command-line, except that you need to add an exclamation mark (**`!`**) before the commands. For example, 

```bash
!{{include.lang|downcase}} main.py
```  

in an IPython or Jupyter session is equivalent to,  

```bash
{{include.lang|downcase}} main.py
```  

on a Bash terminal on Linux/macOS or an Anaconda3 command-prompt on Windows. So is the syntax for running MPI-enabled ParaMonte {{include.lang}} simulations from within IPython or Jupyter.  

-   **On Windows**  
    ```batch
    !mpiexec -localonly -n 3 {{include.lang|downcase}} main_mpi.py
    ```  

-   **On Linux / macOS**  
    ```bash
    !mpiexec -n 3 {{include.lang|downcase}} main_mpi.py
    ```  

{% endif %}
