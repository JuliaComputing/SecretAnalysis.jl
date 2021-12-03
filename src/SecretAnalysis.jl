module SecretAnalysis

using Distributed

@doc raw"""
    estimate_pi(n)

Estimate $\pi$ by throwing `n` darts at a square dartboard. The number of darts
that landed within a circle (which is an easy computation) is an estimate of
its area $A_○$. Similarly, the total number of darts thrown is an estimate of
the area of the square $A_□$. We know how these areas relate to the radius
of the inscribed circle:

```math
\begin{aligned}
A_○ &= \pi r^2 \\
A_□ &= 4 r^2
\end{aligned}
```

If we use a unit circle, $r = 1$.  Then the number of darts that landed inside
the circle $n_○$ should be a proportional estimate of $\pi$ and the total $n_□$
should be a proportional estimate of $4$.  A simple re-arrangement yields:

```math
\begin{aligned}
n_○ &\propto \pi \\
n_□ &\propto 4 \\
\pi &\approx 4 \frac{n_○}{n_□}
\end{aligned}
```

In short, this ends up looking like:

![Full dartboard image](assets/darts-full.svg)

However, this is a little cumbersome. It requires generating uniform
random numbers in the interval $(-1, 1)$, but Julia's `rand()` by default gives
you something in $[0, 1)$. Thanks to the symmetry here, the above analysis is
just as true for the upper-right quadrant alone, so we can just generate and
inspect the positive numbers alone!

![Quarter dartboard image](assets/darts-quarter.svg)
"""
function estimate_pi(n)
    n > 0 || throw(ArgumentError("number of iterations must be >0, got $n"))
    inside = @distributed (+) for i = 1:n
        x, y = rand(), rand()
        Int(x^2 + y^2 <= 1)
    end
    return 4 * inside / n
end

export estimate_pi

end # module
