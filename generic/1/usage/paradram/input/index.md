---
title: "The structure of the optional input file"
#tags: [C, C++, Fortran, python, input_file, ParaDRAM, API]
keywords: 
        C
        C++
        Fortran
        python
        input 
        file
        ParaDRAM
        API
        usage
        interface
sidebar: home_sidebar
#permalink: ///index.html
summary:
last_updated: January 1, 2020
mathjax: true
---
{% comment %}
[](){:target="_blank"}
{% if pmSampler == "ParaDRAM" %}
{% endif %}
{% endcomment %}
<br>


## When is the input file needed?

The input files to the ParaMonte library routines are completely optional and if not provided, all simulation specifications will be set to some appropriate default values or to the ParaMonte routine's best guess for the proper values. However, if the user wants to fine-tune the specifics of a ParaMonte simulation, then depending on the programming language interface to the ParaMonte library, the input file may or may not be the sole method of setting up the simulation specifications,  

-   The **C/C++** programming language: Providing the path to an **input external file** is **the sole method of simulation setup** by the user.  
-   The **Fortran** programming language: Providing the path to an **input external file** is **the preferred method of simulation setup** by the user. However, the input file is not the sole method of specifying the simulation setup. See [the usage page](../interface/){:target="_blank"} for more information about the alternative, less flexible method.  
-   The **MATLAB** programming language: Providing the path to an **input external file** is **NOT the preferred method** of simulation setup by the user. This is because [the ParaMonte MATLAB library](https://www.mathworks.com/matlabcentral/fileexchange/78946-paramonte){:target="_blank"} already has a much more flexible dynamic method of simulation specifications setup from within the MATLAB programming language. Nevertheless, it is equally possible to specify everything from within an input simulation specifications file.  
    {% include warning.html content="When you provide the path to an input file, all other simulation specifications that are made from within the MATLAB programming environment will be ignored in favor of the corresponding values that may or may not be present in the specified external input file." %}
-   The **Python** programming language: Providing the path to an **input external file** is **NOT the preferred method** of simulation setup by the user. This is because [the ParaMonte Python library](https://pypi.org/project/paramonte/){:target="_blank"} already has a much more flexible dynamic method of simulation specifications setup from within the Python programming language. Nevertheless, it is equally possible to specify everything from within an input simulation specifications file.  
    {% include warning.html content="When you provide the path to an input file, all other simulation specifications that are made from within the Python programming environment will be ignored in favor of the corresponding values that may or may not be present in the specified external input file." %}

{% include important.html content="If an external input file whose path is given to ParaMonte sampler routine does not exist (or if the path fails to point to the file properly), then the ParaMonte sampler will continue with the simulation, however, with default values assigned to all simulation specification variables. In this case, the ParaMonte routines will print a WARNING message on the screen highliting this failure to locate and read the external input file." %}

## The structure of the optional input file

Here is a summary of useful guildelines and rules for writing ParaMonte input files.  

### **Organization**

-   The structure of the input file for all ParaMonte samplers is the same in all programming languages. 
-   The simulation specifications for each ParaMonte sampler (e.g., the ParaDRAM MCMC sampler) must be grouped under the ParaMonte routine's name. We call each group a `namelist`.  
-   Each group, corresponding to one ParaMonte sampler routine, is identified by a group-name preceded by an `&` and ends by a forward-slash `/` (see below for an example input file).  
-   Multiple namelist groups can coexist within a sinle input file. Only the ones relevant to the simulation of interest will be read and used. The rest will be ignored.  
-   Comments are allowed anywhere inside the input file.  
-   Comments must begin with an exclamation mark (`!`).  
-   Comments can appear anywhere on an empty line or, after a value assignment.  

### **Variables**  

-   **all variable assignments are optional** and can be dropped or commented out. In such cases, the ParaMonte routines will assign appropriate default values  to the missing variables in the input file.  
-   Variables within a namelist group can be separated from each other by either colons `,` or white-space characters.  
-   The **order by which the variables appear** within a namelist group is **irrelevant and unimportant**.  
-   Variables can be defined multiple times, but only **the last definition will be considered as input**.  
-   **All variable names are case-insensitive**. However, **for clarity**, the ParaMonte library follows the **camelCase code-writing practice**.  

### **Values**  

-   Like variables, values within a namelist group can be separated from each other by either colons `,` or white-space characters.  

-   **Strings**  
    -   String values must be enclosed with either single or double quotation marks: `''` or `""`.
    -   String values can be continued on multiple lines, however, any additional white-space characters as a result of the line-continuation will NOT be ignored.
-   **Logical (Boolean)**  
    -   Logical values are all **case-insensitive** and can be either `.true.`, `true`, or `t` for a `TRUE` value, and `.false.`, `false`, or `f` for a `FALSE` value.
-   **Real (Float)**  
    -   Real values are by default double-precision and capable of holding up to 16 digits of precision and representing numbers as large as $\approx 10^{307}$ and as tiny as $\approx 10^{-307}$.
        {% include tip.html content="To keep the representation of numbers accurate up to 16 digits, consider using the letter **`d`** instead of **`e`** for the scientific representation of numbers. The letter **`d`** stands for **double precision** (**`64-bit`** real/float). For example, the value **`1.d0` is guaranteed to be `1.0000000000000000`** in the simulation, whereas `1.e0` is only guaranteed to have single-precision accuracy, although most compilers will represent this as `1.0000000000000000` upon conversion to a full-precision value. But in general, it won't hurt to use **`d`** in place of **`e`** for the scientific representation of double-precision values **only** within the input files (Outside the input files, the number-representation rules of the specific programming language of your choice, in which you are coding your objective function, must be followed)." %}

### **Verctors**  

-   All **vectors and arrays** that are **specified inside the input file** begin with index `1`. This follows the convention of the majority of science-oriented programming languages and libraries including but not limited to **Fortran**, **Julia**, **Mathematica**, **MATLAB**, **R**, [**LAPACK**](https://en.wikipedia.org/wiki/LAPACK), and [**Eigen (C++)**](https://en.wikipedia.org/wiki/Eigen_(C%2B%2B_library)){:target="_blank"}.  
    {% include important.html content="Keep in mind that this 1-based indexing-rule applies only to variable assignments that are made inside the external input file. Any specification variable assigned from within a programming language enviroment follows the rules of that language. For example, all variables specified from within **C/C++/Python** follow the zero-based indexing rules of these languages." %}
-   Vectors (and arrays) of strings, integers, or real numbers can be specified as comma-separated or space-separated values. For example,  
    ```text
    ! real-valued vector of length 4, specified as the starting point of an MCMC simulation
    startPointVec = 1.0, -100 3, 5.6e7 8.d1
    ```  
    You may have noticed in the above that some values are comma-separated while some others are space-separated. This is valid. 
-   Vector (and array) values may be specified separately on multiple lines and in random order like the following,  
    ```text
    ! a vector of strings specifying the names of the variables that are going to be sampled in the simulation, 
    ! each corresponding to one dimension of the objective function.
    variableNameList(2) = "secondVariable"
    variableNameList(1) = "FirstVariable"
    variableNameList(3:4) = "ThirdVariable", "FourthVariable"
    ```  
-   Vector values may be selectively provided in the input file and some values may be missing. For example,  
    ```text
    ! a vector of length 4 specifying the random walker's step-sizes along different dimensions of the objective function in a ParaDRAM simulation.
    proposalStartStdVec(3) = 3.0
    proposalStartStdVec(1:2) = 1.0, 2.0
    ```  
    or,  
    ```text
    proposalStartStdVec = 1.0, 2.0, 3.0     ! this is identical to the above representation
    ```  
    Notice that the missing fourth variable will not be read from the input file. Instead, it be assigned a default value by the ParaMonte routines.  
-   Similar values in a vector that appear sequenctially, can be represented in abbreviated format via a repetition pattern rule involving `*`. For example,  
    ```text
    ! vector of length 4, specifying the lower limits of the domain of the objective function along each dimension
    domainLowerLimitVec = -3.d100, 2*-20.0, -100
    ```  
    is equivalent to,  
    ```text
    domainLowerLimitVec = -3.d100, -20.0, -20.0, -100
    ```  
    or,  
    ```text
    domainLowerLimitVec = 3*-3.d100
    ```  
    is equivalent to,  
    ```text
    domainLowerLimitVec = -3.d100, -3.d100, -3.d100,    ! notice the fourth value is missing
    ```  
    Note that in the latter example, only the first three values were provided. In such case, the missing elements will be assigned appropriate default values.  

### **Arrays**  

-   The Array representation rules are identical to those of vectors described in the previous section. For example, the following array value assignments are all equivalent,  
    ```text
    ! a symmetric matrix of size 4-by-4 of 64-bit real numbers representing the initial covariance matrix of the ParaDRAM sampler
    proposalStartCovMat =   1.0, 0.0, 0.0, 0.0,
                            0.0, 1.0, 0.0, 0.0,
                            0.0, 0.0, 1.0, 0.0,
                            0.0, 0.0, 0.0, 1.0,
    ```  
    or,  
    ```text
    proposalStartCovMat(:,1) = 1.0, 0.0, 0.0, 0.0,
    proposalStartCovMat(:,2) = 0.0, 1.0, 0.0, 0.0,
    proposalStartCovMat(:,3) = 0.0, 0.0, 1.0, 0.0,
    proposalStartCovMat(:,4) = 0.0, 0.0, 0.0, 1.0,
    ```  
    or,  
    ```text
    proposalStartCovMat(1:4,1:4) = 1.0, 4*0.0, 1.0, 4*0.0, 1.0, 4*0.0, 1.0
    ```  
    {% include warning.html content="When dealing with multidimensional arrays, keep in mind that the ParaMonte routines read and store array elements in a [column-major order](https://en.wikipedia.org/wiki/Row-_and_column-major_order){:target='_blank'} from the input file. This is why the columns are represented by `:` in the second representation of the matrix in the example above (as opposed to rows). Matrix rows are NOT stored sequentially in the computer memory. **For symmetric positive-definite matrices (like covariance or correlation matrices), this convention is irrelevant and unimportant** and does not have any effects (as is the case in the example above)." %}  

### Example contents of a ParaMonte simulation input file  

The following box shows the contents of an example input specifications file for a ParaDRAM simulation of an objective function defined on a 4-dimensional domain (Notice the group name `&ParaDRAM` at the beginning and `/` at the end). Notice the ample usage of the comment symbol wherever the user deems appropriate,  
```text
{% include git/example/mvn/input/paramonte.in %}
```  

{{site.data.alerts.tip}}
The following rules and conventions hold for all ParaMonte sampler routines:  
<ul>
    <li>
        The simulation specifications of any specific ParaMonte routine (e.g., the ParaDRAM sampler) are identical across all supported programming languages.
    </li>
    <li>
        When specified <b>from within an input file</b>, all <b>variable names are case-insensitive</b>. However, when specified from <b>within a programming language</b>, all <b>variable names are treated based on the rules of that language</b>. For example, all routines and variable names are case-insensitive from within the Fortran programming language, while the <b>camelCase</b> convention strictly holds for all names defined in Python and C/C++ calls to the ParaMonte library.
    </li>
    <li>
        The best and the most up-to-date method of learning about the simulation specifications of a ParaMonte routine of choice is to run a simple toy simulation problem and then look at the contents of the output <b><code>*_report.txt</code></b> file generated by the ParaMonte routine.  
    </li>
</ul>
{{site.data.alerts.end}}

## Why is input-file the preferred method of simulation setup?  

Specifying the properties of a ParaMonte simulation via an **external input file** is particularly **beneficial** when the ParaMonte library routines are called from **within compiled languages (e.g., C/C++/Fortran)**. The reasons might be already clear to advanced programmers:  

-   Specifying the simulation properties in an external input file ensures the highest level of flexibility and portability of your simulation by avoiding the hardcoding of simulation specifications into your compiled code. Imagine you specify a simulation property inside your code, compile and run it, then you realize that you wanted to change that property value to something else. **Without an external input file, you would have to recompile your code every time for every property change.**  
-   Also, the same specification input file can be used to set up the same simulation settings from any programming language without a single line of change in the input file. **The contents of the input files are programming-language-agnostic**.  
-   All variable names, when specified from the input file, are all case-insensitive across all programming languages.  
-   The order by which the simulation specification variables appear in the input file is irrelevant.  
-   Multiple simulation namelist groups, each corresponding to an independent call to a different ParaMonte routine, can be placed within a single input file, resulting in a cleaner, more portable organization of the input data for the given simulation problem.  


{% include askme.html %}
{% include links.html %}
