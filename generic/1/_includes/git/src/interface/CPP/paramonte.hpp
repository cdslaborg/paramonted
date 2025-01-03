////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////   MIT License
////
////   ParaMonte: plain powerful parallel Monte Carlo library.
////
////   Copyright (C) 2012-present, The Computational Data Science Lab
////
////   This file is part of the ParaMonte library.
////
////   Permission is hereby granted, free of charge, to any person obtaining a 
////   copy of this software and associated documentation files (the "Software"), 
////   to deal in the Software without restriction, including without limitation 
////   the rights to use, copy, modify, merge, publish, distribute, sublicense, 
////   and/or sell copies of the Software, and to permit persons to whom the 
////   Software is furnished to do so, subject to the following conditions:
////
////   The above copyright notice and this permission notice shall be 
////   included in all copies or substantial portions of the Software.
////
////   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
////   EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
////   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
////   IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
////   DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
////   OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
////   OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
////
////   ACKNOWLEDGMENT
////
////   ParaMonte is an honor-ware and its currency is acknowledgment and citations.
////   As per the ParaMonte library license agreement terms, if you use any parts of 
////   this library for any purposes, kindly acknowledge the use of ParaMonte in your 
////   work (education/research/industry/development/...) by citing the ParaMonte 
////   library as described on this page:
////
////       https://github.com/cdslaborg/paramonte/blob/3548c097f2a25dfc0613061800656d27d0e0ddbe/ACKNOWLEDGMENT.md
////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  
//  Description:
//        - The C++ header file containing the prototypes of the ParaMonte library routines to be called from C++.
//  Prototypes:
//        - runParaDRAM()
//  Author:
//        - Computational Data Science Lab, Monday 9:03 AM, May 16 2016, ICES, UT Austin
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#ifndef ParaMonte
#define ParaMonte

#include <cstdint>

extern "C"
{
    void runParaDRAM(
                    // ndim: dimension of the domain of the LogFunc
                    int32_t , 
                    // getLogFunc(ndim, Point(ndim)): procedure pointer to the LogFunc
                    double (*)  (
                                int32_t , 
                                double []
                                ), 
                    // inputFile: ParaDRAM input file, containing the path the file containing a list of
                    // all optional input variables and values
                    char [], 
                    // inputFileLen: the length of the inputFile char vector: int32_t inputFileLen = strlen(inputFile);
                    int32_t
                    );
}

#endif
