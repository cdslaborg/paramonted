## The mathematical objective function  

Suppose we want to sample random vectors  

$$
\mathbf{x}=[x_1,x_2,x_3,x_4] ~~,
$$

from a 4-dimensional [Multivariate Normal (MVN) Probability Density Function (PDF)](https://en.wikipedia.org/wiki/Multivariate_normal_distribution){:target="_blank"},  

$$
\mathrm{PDF}_\mathrm{MVN} \equiv \pi ( \mathbf{x} ~|~ \mu, \Sigma) = 
(2\pi)^{-\frac{k}{2}}
\sqrt{|\Sigma|}
\exp\bigg( -\frac{1}{2} (\mathbf{x}-\mu)^\mathrm{T}\Sigma^{-1}(\mathbf{x}-\mu) \bigg) ~~,
$$

that has a mean vector,  

$$
\mu = [0,0,0,0]
$$

with a covariance matrix,  

$$
\Sigma = 
\begin{bmatrix}
1.0 & 0.5 & 0.5 & 0.5 \\
0.5 & 1.0 & 0.5 & 0.5 \\
0.5 & 0.5 & 1.0 & 0.5 \\
0.5 & 0.5 & 0.5 & 1.0 
\end{bmatrix}

$$

This will serve as our mathematical objective function. Clearly, all of the four dimensions of this MVN are correlated with each other with a Pearson's correlation coefficient of $0.5$.  

{% include example.working.with.log.md %}