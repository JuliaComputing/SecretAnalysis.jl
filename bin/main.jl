using SecretAnalysis

n = parse(Int, replace(get(ENV, "n", "10_000_000_000"), '_'=>""))

println("#### Estimating π with $n throws ####")

@time @show pi(n)
