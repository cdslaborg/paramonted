### Working with the natural logarithm of the objective function  

In general, since probabilities are often tiny numbers, we'd want to always work with their natural logarithms in the world of computers to avoid unwanted overflow or underflow of numbers, which can crash our simulations. To highlight the importance of taking the natural logarithms of all input objective functions to the ParaMonte routines, we always name them like `getLogFunc()`.  

{% include important.html content="
All ParaMonte routines assume that the user-provided objective functions return the natural logarithms of the actual values of the objective functions.
" %}
