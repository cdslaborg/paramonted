---
title: "Preface"
#tags: [amir_shahmoradi, python, getting_started, homepage, front_matter, frontpage, author, about, scientific_computing, audience, outcomes, Fortran, C, interoperation]
keywords: 
    acknowledgment
    acknowledge
    version
    author
    cite
    citation
    reference
    credit
    paper
    article
    git
    github
    repository
    ParaMonte
    ParaDRAM
    ParaDISE
    ParaNest
    ParaTemp
    Amir
    Shahmoradi
    Fatemeh
    Bagheri
    Shashank
    Kumbhare
    Joshua
    Alexander
    Osborne
    getting_started
    homepage
    front_matter
    frontpage
    author
    about
    scientific_computing
    audience
    outcomes
    Fortran
    C
    C++
    MATLAB
    Python
    R
    interoperation
    potability
    scalability
    cite
sidebar: home_sidebar
#permalink: /overview/preface/index.html
summary:
last_updated: January 1, 2020
mathjax: true
---

<br>

{% 
include note.html content="The fact that you have reached this page indicates your desire or need to learn the foundations of scientific inference and Data Science. If this is indeed true, then I encourage you to follow the [Computational Data Science Lab's social media](https://www.cdslab.org/#about){:target='_blank'}, if you would like to stay updated with the latest trends, best practices and tips on Scientific Computing, Scientific Inference, Machine Learning, Deep Learning, and Data Science Techniques." 
%}

## What is ParaMonte?  

A serial/parallel library of Monte Carlo routines for sampling mathematical objective functions of arbitrary-dimensions, in particular, the posterior distributions of Bayesian models in data science, Machine Learning, and scientific inference, with the design goal of unifying the **automation** (of Monte Carlo simulations), **user-friendliness** (of the library), **accessibility** (from multiple programming environments), **high-performance** (at runtime), and **scalability** (across many parallel processors).  

{% include image    src="../../images/paramonte_hierarchy.png" alt="paramonte_hierarchy.png" 
                    caption="
                        <b>The hierarchy of the ParaMonte library</b><br>
                        <b>ParaDRAM</b> (current release): Parallel Delayed-Rejection Adaptive Metropolis Markov-Chain Monte Carlo sampler<br>
                        <b>ParaTemp</b> (in preparation for public release): Parallel Tempering sampler<br>
                        <b>ParaNest</b> (in preparation for public release): Parallel Nested sampler<br>
                    " capstyle="text-aling:center;margin-top:15px;" %}

## Where is ParaMonte maintained?  

ParaMonte is maintained on GitHub: [https://github.com/cdslaborg/paramonte/](https://github.com/cdslaborg/paramonte/){:target="_blank"}  

## What are the origins of ParaMonte?   

The Parallel Monte Carlo library (hence named ParaMonte) grew out of the need for a free, readily-accessible, user-friendly, unified, robust, high-performance parallel software for stochastic optimization, sampling, and integration problems in scientific inference and Data Science applications. This project started in 2010 to aid the research goals of the primary author of the package in the field of High Energy Astrophysics and Bioinformatics. It remained in private usage over the years, until 2018, when we decided to release the package as an open-source project for public usage and contributions.  

## What are the design goals of ParaMonte?  

Since this project's inception, many new Monte Carlo packages and programming environments (in particular, in high-level languages) have been developed. What likely makes the ParaMonte library unique among other existing packages is the following set of design goals and features:

- **Full automation** of all Monte Carlo simulations to the highest levels possible to ensure the **highest-level of user-friendliness** of the library and minimal time investment requirements for building, running, and post-processing of simulation models.  
- **Interoperability** of the core library with as many programming languages as currently possible, including C/C++, Fortran, MATLAB, Python, with ongoing efforts to support other popular programming languages.  
- **High-Performance** meticulously-low-level implementation of the library to ensure the fastest-possible Monte Carlo simulations.  
- **Parallelizability** of all simulations via two-sided/one-sided MPI/Coarray communications while requiring **zero-parallel-coding efforts** from the user.  
- **Virtually zero-dependence** of ParaMonte::Kernel on external libraries to ensure hassle-free ParaMonte library builds and Monte Carlo simulations.  
- **Fully-deterministic reproducibility** and automatically-enabled restart functionality for all simulations up 16 digits of precision as requested by the user.  
- **Comprehensive-reporting and post-processing** of each simulation and its results, as well as their automatic storage in external files to ensure the simulation results will be comprehensible and reproducible at any time in the distant future.  

## Who are the ParaMonte authors and developers?  

In chronological order,  

- [**Amir Shahmoradi**]({{site.companyurl}}/people/#amir-shahmoradi){:target="_blank"} (Contributions: ParaMonte kernel routines + C/C++/Fortran/MATLAB/Python interfaces)  
    - astrophysicist / bioinformatician by training (and a science-lover in general),  
    - Ph.D. in computational physics / bioinformatics from the University of Texas at Austin,  
    - currently a faculty member of Physics and Data Science at The University of Texas at Arlington,  
    - with teaching / research experience/background in computational and data sciences, statistics, data analysis and modeling, stochastic processes, Monte Carlo Methods, Bayesian probability theory, high energy physics, astronomy and astrophysics, computational physics, Molecular Dynamics simulations, biomedical science and MRI data analysis, bioinformatics and evolutionary biology (viral evolution, protein dynamics and interactions),  
    - contact: [shahmoradi@utexas.edu](mailto:"shahmoradi@utexas.edu") or [{{site.companyurl}}]({{site.companyurl}}){:target="_blank"}  

- [**Fatemeh Bagheri**](https://www.linkedin.com/in/fbagheri){:target="_blank"} (Contributions: ParaMonte kernel routines + Python interface)  
    - physicist / cosmologist by training,  
    - currently a UTA Physics member,  
    - deep philosophical thinker,  
    - contact: [Fatemeh.Bagheri@uta.edu](mailto:"Fatemeh.Bagheri@uta.edu")

- [**Shashank Kumbhare**]({{site.companyurl}}/people/#shashank-kumbhare){:target="_blank"} (Contributions: ParaMonte MATLAB interface)  
    - physicist / Computational Data Scientist,  
    - currently a UTA Physics member,  
    - contact: [shashankkumbhare8@gmail.com](mailto:"shashankkumbhare8@gmail.com")

- [**Joshua Alexander Osborne**]({{site.companyurl}}/people/#joshua-alexander-osborne){:target="_blank"} (Contributions: ParaMonte Python interface)  
    - physicist / Computational Data Scientist,  
    - currently a UTA Physics member,  
    - contact: [joshuaalexanderosborne@gmail.com](mailto:"joshuaalexanderosborne@gmail.com")

## How to acknowledge the use of the ParaMonte library in your work?  
  
{% include git/ACKNOWLEDGMENT.md %}
  

{% include askme.html %}
{% include links.html %}


{% comment %}
In the meantime, if you use ParaMonte or any parts of it for your educational, research, or business work, we kindly ask you to cite the following paper:  
{% include callout.html type="success" content="Amir Shahmoradi (2013). **A Multivariate Fit Luminosity Function and World Model for Long Gamma-Ray Bursts**. The Astrophysical Journal (ApJ) 766:111-133 ([**PDF link**](https://www.cdslab.org/pubs/2013_Shahmoradi_I.pdf))" %}  

The ParaMonte publications are currently under review. You can find a draft detailing the implementation of the ParaDRAM algorithm here:

{% include callout.html type="success" content="Amir Shahmoradi, Fatemeh Bagheri, Joshua Alexander Osborne (2020). **Fast fully-reproducible streamlined serial/parallel Monte Carlo/MCMC simulations and visualizations via `ParaMonte::Python` library.**. Journal of Open Source Software (JOSS), to be submitted, [**PDF link**](https://www.cdslab.org/pubs/2020_Shahmoradi_III.pdf)." %}  

{% include callout.html type="success" content="Amir Shahmoradi, Fatemeh Bagheri (2020). **ParaMonte: A high-performance serial/parallel Monte Carlo simulation library for C, C++, Fortran**. Journal of Open Source Software (JOSS), submitted, [**PDF link**](https://www.cdslab.org/pubs/2020_Shahmoradi_II.pdf)." %}  

{% include callout.html type="success" content="Amir Shahmoradi, Fatemeh Bagheri (2020). **ParaDRAM: A Cross-Language Toolbox for Parallel High-Performance Delayed-Rejection Adaptive Metropolis Markov Chain Monte Carlo Simulations**. Journal of Computer Methods in Applied Mechanics and Engineering (CMAME), submitted, [**PDF link**](https://www.cdslab.org/pubs/2020_Shahmoradi_I.pdf)." %}  

{% endcomment %}
