
### description  

```text
The variable 'description' contains general information about the specific {{include.sampler}} simulation 
that is going to be performed. It has no effects on the simulation and serves only as a general description 
of the simulation for future reference. The {{include.sampler}} parser automatically recognizes the C-style '\n' 
escape sequence as the new-line character, and '\\' as the backslash character '\' if they used in 
the description. For example, '\\n' will be converted to '\n' on the output, while '\n' translates 
to the new-line character. Other C escape sequences are neither supported nor needed. The default 
value for description is 'Nothing provided by the user.'.
```
<br>

### inputFileHasPriority  

```text
A logical (boolean) variable. If TRUE (or .true. or true or .t. from within an input file), then the 
input specifications of the {{include.sampler}} simulation will be read from the input file provided by the user, and the 
simulation specification assignments from within the programming language environment (if any are made) 
will be completely ignored. If inputFileHasPriority is FALSE, then all simulation specifications of the 
{{include.sampler}} sampler that are taken from the user-specified input file will be overwritten by their 
corresponding input values that are set from within the user's programming environment (if any is provided). 
Note that this feature is useful when, for example, some simulation specifications have to computed and specified 
at runtime and therefore, cannot be specified before the program execution. Currently, this functionality 
(i.e., prioritizing the input file values to input-procedure-argument values) is available only in the 
Fortran-interface to the {{include.sampler}} sampler. The default value is FALSE.
```
<br>

### outputSplashMode  

```text
A logical (boolean) variable. If TRUE (or .true. or true or .t. from within an input file), then 
the following contents will not be printed in the output report file of the {{include.sampler}} sampler:

    - The ParaMonte library interface, compiler, and platform specifications.
    - The {{include.sampler}} simulation specification descriptions.

Setting this variable to TRUE may break the functionality of the report-file parser methods of the 
ParaMonte library in high-level languages (e.g., MATLAB, Python, R, ...). The default value is FALSE.
```
<br>

### domainCubeLimitLower  

```text
domainCubeLimitLower represents the lower boundaries of the cubical domain of the objective function 
to be sampled. It is an ndim-dimensional vector of 64-bit real numbers, where ndim is the number of 
variables of the objective function. It is also possible to assign only select values of domainCubeLimitLower 
and leave the rest of the components to be assigned the default value. This is POSSIBLE ONLY when 
domainCubeLimitLower is defined inside the input file to the {{include.sampler}} sampler. For example, 
having the following inside the input file, 

    domainCubeLimitLower(3:5) = -100

            will only set the lower limits of the third, fourth, and the fifth dimensions to -100, 
            or,

    domainCubeLimitLower(1) = -100, domainCubeLimitLower(2) = -1.e6 

            will set the lower limit on the first dimension to -100, and 1.e6 on the second dimension, 
            or,

    domainCubeLimitLower = 3*-2.5e100

            will only set the lower limits on the first, second, and the third dimensions to -2.5*10^100, 
            while the rest of the lower limits for the missing dimensions will be automatically set 
            to the default value.

The default value for all elements of domainCubeLimitLower is: -1.797693134862316E+307.
```  
See also the input simulation specification 
[domainCubeLimitUpper](#domainupperlimitvec).  
<br>

### domainCubeLimitUpper  

```text
domainCubeLimitUpper represents the upper boundaries of the cubical domain of the objective function 
to be sampled. It is an ndim-dimensional vector of 64-bit real numbers, where ndim is the number of 
variables of the objective function. It is also possible to assign only select values of domainCubeLimitUpper 
and leave the rest of the components to be assigned the default value. This is POSSIBLE ONLY when 
domainCubeLimitUpper is defined inside the input file to the {{include.sampler}} sampler. For example,

    domainCubeLimitUpper(3:5) = 100

            will only set the upper limits of the third, fourth, and the fifth dimensions to 100, or,

    domainCubeLimitUpper(1) = 100, domainCubeLimitUpper(2) = 1.e6 

            will set the upper limit on the first dimension to 100, and 1.e6 on the second dimension, 
            or,

    domainCubeLimitUpper = 3*2.5e100

            will only set the upper limits on the first, second, and the third dimensions to 2.5*10^100, 
            while the rest of the upper limits for the missing dimensions will be automatically set 
            to the default value.

The default value for all elements of domainCubeLimitUpper is: 1.797693134862316E+307.
```  
See also the input simulation specification 
[domainCubeLimitLower](#domainlowerlimitvec).  
<br>

### domainAxisName  

```text
domainAxisName contains the names of the variables to be sampled. It is used to construct 
the header of the output sample file. Any element of domainAxisName that is not set by the user 
will be automatically assigned a default name. The default value is 'sampleVariablei' where integer 
'i' is the index of the variable.
```
<br>

### parallelism  

```text
parallelism is a string variable that represents the parallelization method to be used in 
the {{include.sampler}} sampler. The string value must be enclosed by either single or double 
quotation marks when provided as input. Two options are currently supported:

    parallelism = 'multiChain'

            This method uses the Perfect Parallel scheme in which multiple MCMC chains are 
            generated independently of each other. In this case, multiple output MCMC chain files 
            will also be generated.

    parallelism = 'singleChain'

            This method uses the fork-style parallelization scheme. A single MCMC chain file will be 
            generated in this case. At each MCMC step multiple proposal steps will be checked in 
            parallel until one proposal is accepted.

Note that in serial mode, there is no parallelism. Therefore, this option does not affect non-parallel 
simulations and its value is ignored. The serial mode is equivalent to either of the parallelism 
methods with only one simulation image (processor, core, or thread). The default value is 
parallelism = 'singleChain'. Note that the input values are case-INsensitive and white-space 
characters are ignored.
```  
See also the input simulation specification 
[parallelismMpiFinalizeEnabled](#mpifinalizerequested).  
<br>

### parallelismMpiFinalizeEnabled  

```text
In parallel {{include.sampler}} simulations via MPI communication libraries, if parallelismMpiFinalizeEnabled = true 
(or T, both case-INsensitive), then a call will be made to the MPI_Finalize() routine from within the {{include.sampler}} 
sampler at the end of the simulation to finalize the MPI communications. Set this variable to false (or f, 
both case-INsensitive) if you do not want the {{include.sampler}} sampler to finalize the MPI communications for you. 
This is a low-level simulation specification variable, relevant to simulations that directly involve MPI 
parallelism. If you do not have any MPI-routine calls in your main program, you can safely ignore 
this variable with its default value. Note that in non-MPI-enabled simulations, such as serial and 
Coarray-enabled simulations, the value of this variable is completely ignored. The default value is 
TRUE.
```  
See also the input simulation specification 
[parallelism](#parallelism).  
<br>

### outputFileName  

```text
outputFileName contains the path and the base of the filename for the {{include.sampler}} sampler output files. If not 
provided by the user, the default outputFileName is constructed from the current date and time:

    {{include.sampler}}_run_yyyymmdd_hhmmss_mmm

where yyyy, mm, dd, hh, mm, ss, mmm stand respectively for the current year, month, day, hour, minute, 
second, and millisecond. In such a case, the default directory for the output files will be the current 
working directory of the {{include.sampler}} sampler. If outputFileName is provided, but ends with a 
separator character '/' or '\' (as in Linux or Windows OS), then its value will be used as the directory to 
which the {{include.sampler}} sampler output files will be written. In this case, the output file naming 
convention described above will be used. Also, the given directory will be automatically created if 
it does not exist already.
```  
See also the input simulation specification 
[outputStatus](#overwriterequested).  
<br>

### outputStatus  

```text
A logical (boolean) variable. If true (or .true. or TRUE or .t. from within an input file), then any 
existing old simulation files with the same name as the current simulation will be overwritten with 
the new simulation output files. Note that if outputStatus is set to TRUE, then the restart 
functionality is automatically turned off and any existing old simulation output files with the 
same name as the current simulation will be overwritten by the {{include.sampler}} sampler. 
The default value is FALSE.
```  
See also the input simulation specification 
[outputRestartFileFormat](#outputrestartfileformat), 
[outputFileName](#outputfilename).  
<br>

### targetAcceptanceRate  

```text
targetAcceptanceRate sets an optimal target for the ratio of the number of accepted objective function 
calls to the total number of function calls by the {{include.sampler}} sampler. It is a real-valued array of length 2, 
whose elements determine the upper and lower bounds of the desired acceptance rate. When the acceptance 
rate of the {{include.sampler}} sampler is outside the specified limits, the sampler's settings will be automatically adjusted 
to bring the overall acceptance rate to within the specified limits by the input simulation specification targetAcceptanceRate. 
When assigned from within a dynamic-language programming environment, such as MATLAB or Python, or from 
within an input file, targetAcceptanceRate can also be a single real number between 0 and 1. In such case, the 
{{include.sampler}} sampler will constantly attempt (with no guarantee of success) to bring the average acceptance ratio 
of the sampler as close to the user-provided target ratio as possible. The success of the {{include.sampler}} sampler 
in keeping the average acceptance ratio close to the requested target value depends heavily on:

    1) the value of proposalAdaptationPeriod; the larger, the easier.
    2) the value of proposalAdaptationCount; the larger, the easier.

Note that the acceptance ratio adjustments will only occur every proposalAdaptationPeriod sampling 
steps for a total number of proposalAdaptationCount. There is no default value for targetAcceptanceRate, 
as the acceptance ratio is not directly adjusted during sampling.
```  
{% if include.sampler == "ParaDRAM" or include.sampler == "ParaDISE" %}
See also the input simulation specification 
[proposalScale](#proposalscale).  
{% endif %}
<br>

### sampleSize  

```text
The variable sampleSize is an integer that dictates the number of (hopefully, independent and 
identically distributed [i.i.d.]) samples to be drawn from the user-provided objective function. 
Three ranges of values are possible. If, 

    sampleSize < 0,

            then, the absolute value of sampleSize dictates the sample size in units of the final 
            effective sample size generated by the sampler. The effective sample is by definition 
            i.i.d., and free from duplicates. The effective sample size is automatically determined 
            by {{include.sampler}} toward the end of the simulation.
            For example:    

                    sampleSize = -1 yields the effective i.i.d. sample drawn from the objective 
                    function.

                    sampleSize = -2 yields a (potentially non-i.i.d.) sample twice as big as the 
                    effective sample.

    sampleSize > 0,

            then, the specified value will represent the number of points to appear in the final 
            output sample file. If sampleSize turns out to be less than the estimated effective sample 
            size, then the resulting final sample will be i.i.d.. If sampleSize turns out to be larger 
            than the effective sample size, then the resulting sample will be potentially non-i.i.d.. 
            The larger this difference, the more non-i.i.d. the resulting final refined sample will be. 
            For example, 

                    sampleSize = 1000 yields a 1000-points final sample from the objective function.

    sampleSize = 0,

            in which case, no sample file will be generated.

The default value is sampleSize = -1. 
```  
{% if include.sampler == "ParaDRAM" or include.sampler == "ParaDISE" %}
See also the input simulation specification 
[chainSize](#chainsize), 
[sampleRefinementCount](#samplerefinementcount), 
[sampleRefinementMethod](#samplerefinementmethod).  
{% endif %}
<br>

### randomSeed  

```text
randomSeed is a scalar 32bit integer that serves as the seed of the random number generator. When it 
is provided, the seed of the random number generator will be set in a specific deterministic manner 
to enable future replications of the simulation with the same configuration and input specifications. 
The default value for randomSeed is an integer vector of processor-dependent size and value that will 
vary from one simulation to another. However, enough care has been taken to assign unique random seed 
values to the random number generator on each of the parallel threads (or images, processors, cores, 
...) at all circumstances.
```
<br>

### outputColumnWidth  

```text
The variable outputColumnWidth is a non-negative integer number that determines the width of the data 
columns in the formatted output files of a {{include.sampler}} simulation with tabular structure. If it 
is set to zero, the {{include.sampler}} sampler will ensure to set the width of each output element to 
the minimum possible width without losing the requested output precision. In other words, setting 
outputColumnWidth = 0 will result in the smallest-size for the formatted output files that are in ASCII 
format. The default value is 0.
```  
See also the input simulation specification 
[outputSeparator](#outputseparator), 
[outputPrecision](#outputprecision), 
[outputChainFileFormat](#outputchainfileformat).  
<br>

### outputSeparator  

```text
outputSeparator is a string variable, containing a sequence of one or more characters (excluding 
digits, the period symbol '.', and the addition and subtraction operators: '+' and '-'), that is used 
to specify the boundary between separate, independent information elements in the tabular output 
files of the {{include.sampler}} sampler. The string value must be enclosed by either single or double 
quotation marks when provided as input. To output in Comma-Separated-Values (CSV) format, set 
outputSeparator = ','. If the input value is not provided, the default delimiter ',' will be used when 
input outputColumnWidth = 0, and a single space character, ',' will be used when input 
outputColumnWidth > 0. A value of '\t' is interpreted as the TAB character. To avoid this interpretation, 
use '\\t' to yield '\t' without being interpreted as the TAB character. The default value is ','.
```  
See also the input simulation specification 
[outputColumnWidth](#outputcolumnwidth), 
[outputPrecision](#outputprecision), 
[outputChainFileFormat](#outputchainfileformat).  
<br>

### outputPrecision  

```text
The variable outputPrecision is a 32-bit integer number that determines the precision - that is, 
the number of significant digits - of the real numbers in the output files of a {{include.sampler}} simulation. 
Any positive integer is acceptable as the input value of outputPrecision. However, any digits of the output 
real numbers beyond the accuracy of 64-bit real numbers (approximately 16 digits of significance) 
will be meaningless and random. Set this variable to 16 (or larger) if full reproducibility of the 
simulation is needed in the future. But keep in mind that larger precisions will result in larger-size 
output files. This variable is ignored for binary output (if any occurs during the simulation). The 
default value is 8.
```  
See also the input simulation specification 
[outputColumnWidth](#outputcolumnwidth), 
[outputSeparator](#outputseparator), 
[outputChainFileFormat](#outputchainfileformat).  
<br>

### outputChainFileFormat  
 
```text
outputChainFileFormat is a string variable that represents the format of the output chain file(s) of a 
{{include.sampler}} simulation. The string value must be enclosed by either single or double quotation 
marks when provided as input. Three values are possible:

    outputChainFileFormat = 'compact'

            This is the ASCII (text) file format which is human-readable but does not preserve the 
            full accuracy of the output values. It is also a significantly slower mode of chain file 
            generation, compared to the binary file format (see below). If the compact format is 
            specified, each of the repeating MCMC states will be condensed into a single entry (row) 
            in the output MCMC chain file. Each entry will be then assigned a sample-weight that is 
            equal to the number of repetitions of that state in the MCMC chain. Thus, each row in 
            the output chain file will represent a unique sample from the objective function. This 
            will lead to a significantly smaller ASCII chain file and faster output size compared to 
            the verbose chain file format (see below).

    outputChainFileFormat = 'verbose'

            This is the ASCII (text) file format which is human-readable but does not preserve the 
            full accuracy of the output values. It is also a significantly slower mode of chain file 
            generation, compared to both compact and binary chain file formats (see above and below). 
            If the verbose format is specified, all MCMC states will have equal sample-weights of 1 
            in the output chain file. The verbose format can lead to much larger chain file sizes 
            than the compact and binary file formats. This is especially true if the target objective 
            function has a very high-dimensional state space.

    outputChainFileFormat = 'binary'

            This is the binary file format which is not human-readable, but preserves the exact values 
            in the output MCMC chain file. It is also often the fastest mode of chain file generation. 
            If the binary file format is chosen, the chain will be automatically output in the compact 
            format (but as binary) to ensure the production of the smallest-possible output chain 
            file. Binary chain files will have the .bin file extensions. Use the binary format if 
            you need full accuracy representation of the output values while having the smallest-size 
            output chain file in the shortest time possible.

The default value is outputChainFileFormat = 'compact' as it provides a reasonable trade-off between speed 
and output file size while generating human-readable chain file contents. Note that the input values 
are case-INsensitive.
```  
See also the input simulation specification 
[outputColumnWidth](#outputcolumnwidth), 
[outputSeparator](#outputseparator), 
[outputPrecision](#outputprecision).  
<br>

### outputRestartFileFormat  

```text
outputRestartFileFormat is a string variable that represents the format of the output restart file(s) which 
are used to restart an interrupted {{include.sampler}} simulation. The string value must be enclosed by either 
single or double quotation marks when provided as input. Two values are possible:

    outputRestartFileFormat = 'binary'

            This is the binary file format which is not human-readable, but preserves the exact values 
            of the specification variables required for the simulation restart. This full accuracy 
            representation is required to exactly reproduce an interrupted simulation. The binary 
            format is also normally the fastest mode of restart file generation. Binary restart files 
            will have the .bin file extensions.

    outputRestartFileFormat = 'ASCII'

            This is the ASCII (text) file format which is human-readable but does not preserve the 
            full accuracy of the specification variables required for the simulation restart. It is 
            also a significantly slower mode of restart file generation, compared to the binary 
            format. Therefore, its usage should be limited to situations where the user wants to 
            track the dynamics of simulation specifications throughout the simulation time. ASCII 
            restart file(s) will have the .txt file extensions.

The default value is outputRestartFileFormat = 'binary'. Note that the input values are case-INsensitive.
```  
See also the input simulation specification 
[outputFileName](#outputfilename), 
[outputStatus](#overwriterequested).  
<br>

### outputReportPeriod  

```text
Every outputReportPeriod calls to the objective function, the sampling progress will be reported 
to the log file. Note that outputReportPeriod must be a positive integer. The default value is 1000.
```
<br>

### domainErrCount  

```text
domainErrCount is an integer number beyond which the user will be warned about the newly-proposed 
points being excessively proposed outside the domain of the objective function. For every 
domainErrCount consecutively-proposed new points that fall outside the domain of the objective 
function, the user will be warned until domainErrCount = domainErrCountMax, in which 
case the sampler returns a fatal error and the program stops globally. The counter for this warning 
message is reset after a proposal sample from within the domain of the objective function is obtained. 
When out-of-domain sampling happens frequently, it is a strong indication of something fundamentally wrong in the 
simulation. It is, therefore, important to closely inspect and monitor for such frequent out-of-domain samplings. 
This can be done by setting domainErrCount to an appropriate value determined by the user. 
The default value is 1000.
```  
See also the input simulation specification 
[domainErrCountMax](#maxnumdomainchecktostop).  
<br>

### domainErrCountMax  

```text
domainErrCountMax is an integer number beyond which the program will stop globally with a fatal 
error message declaring that the maximum number of proposal-out-of-domain-bounds has reached. The 
counter for this global-stop request is reset after a proposal point is accepted as a sample from 
within the domain of the objective function. 
When out-of-domain sampling happens frequently, it is a strong indication of something fundamentally wrong in the 
simulation. It is, therefore, important to closely inspect and monitor for such frequent out-of-domain samplings. 
This can be done by setting domainErrCountMax to an appropriate value determined by the user. 
The default value is 10000.
```  
See also the input simulation specification 
[domainErrCount](#maxnumdomainchecktowarn).  
<br>
