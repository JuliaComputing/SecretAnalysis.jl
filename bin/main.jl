using SecretAnalysis, JSON, Printf, Distributed

n = parse(Int64, replace(get(ENV, "n", "10_000_000_000"), '_'=>""))

println("#### Estimating π with $n throws ####")

t = @timed @show estimate_pi(n)

out = Dict(:pi => t[1], :time => @sprintf("%.1fs", t[2]), :workers => nworkers())
# ENV["OUTPUTS"] = JSON.json(out)
ENV["RESULTS"] = JSON.json(out)
