## The compile-time and runtime prerequisites  

{% include install.instructions.autoCompilerInstall.md %}

Regardless of which ParaMonte installation method you choose from the above, you will need some compilers and libraries to link your C/C++/Fortran applications against the ParaMonte library and build your executable, or to run the executable. You likely have many, if not all, of these prerequisites already installed on your system,  

-   A C/C++ compiler, if you intend to link C/C++ code against the ParaMonte library. Possible compiler options are the [Intel C/C++ compiler](https://software.intel.com/en-us/parallel-studio-xe/choose-download){:target="_blank"} `icc`, the macOS' default C/C++ compiler front-end `clang`, and the GNU C/C++ compilers (`gcc`/`g++`).  
-   A Fortran compiler, if you intend to link Fortran code against the ParaMonte library or build the ParaMonte library from scratch on your system. Possible compiler options are the [Intel Fortran compiler](https://software.intel.com/en-us/parallel-studio-xe/choose-download){:target="_blank"} `ifort` (version &#8805; {{site.intelVersionDarwin}}) and the GNU Fortran compiler `gfortran` (version {{site.gnuVersionDarwin}}).  
-   The Open-MPI library (version &#8805; {{site.openmpiVersionDarwin}}), if you intend to use the prebuilt ParaMonte libraries to build MPI-parallelized C/C++/Fortran applications or if you intend to build the MPI-parallel ParaMonte library from scratch on your system.  
-   The MPICH library (version &#8805; {{site.mpichVersionDarwin}}), if you intend to build the MPI-parallel ParaMonte library from scratch on your system and for some reason do not want to install and use the Open-MPI library.  
-   The OpenCoarrays library (version {{site.cafVersionDarwin}} or newer) if you intend to use the prebuilt ParaMonte libraries to build Coarray-parallelized Fortran applications or if you intend to build the Coarray-parallel ParaMonte library from scratch on your system.  
-   A recent version of the Cmake software (version {{site.cmakeVersion}} or newer) if you intend to build the ParaMonte library from scratch on your system.  

<a name="prereqs-install"></a>

{% include note.html content="Intel Parallel Studio is available **free of charge** to all students, teachers, and open-source software developers." %}   

{{site.data.alerts.tip}}
If you intend to use the prebuilt ParaMonte libraries built via GNU compiler collection, you may want to ensure that the required runtime libraries (such as the MPI library) are installed on your system. The easiest way to install all of the prerequisites in the above is via <b><code>Homebrew</code></b> (except the proprietary Intel compilers which are distributed exclusively from Intel's website). 

To install Homebrew on your Mac, try the following on a Bash terminal,  
<pre>
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
</pre>

To install the latest version of gcc, try,  
<pre>
brew install gcc
brew link gcc
</pre>

To install a specific version of gcc, for example, gcc 10, simply add the version number,  
<pre>
brew install gcc@10
brew link gcc@10
</pre>

Similarly, to install the latest version of gfortran, try,  
<pre>
brew install gfortran
brew link gfortran
</pre>


To install Open-MPI &#8805; {{site.openmpiVersionDarwin}}, try,  
<pre>
brew install open-mpi
brew link open-mpi
</pre>

If you have to use MPICH &#8805; {{site.mpichVersionDarwin}} instead of Open-MPI, try,  
<pre>
brew install mpich
brew link mpich
</pre>
However, keep in mind that MPICH and Open-MPI are conflicting packages and cannot coexist on your system.  

To install OpenCoarrays &#8805; {{site.cafVersionDarwin}}, try,  
<pre>
brew install opencoarrays
brew link opencoarrays
</pre>

To install the most recent version of CMake on your system, try,  
<pre>
brew install cmake
brew link cmake
</pre>

{{site.data.alerts.end}}