using SecretAnalysis, JSON3, Printf, Distributed

n = parse(Int64, replace(get(ENV, "n", "10_000_000_000"), '_'=>""))

println("#### Estimating π with $n throws ####")

t = @timed @show estimate_pi(n)

out = Dict(:pi => t[1], :time => @sprintf("%.1fs", t[2]), :workers => nworkers())
open("results.json", "w") do io
    JSON3.pretty(io, JSON3.write(out))
end

ENV["RESULTS"] = JSON3.write(out)
ENV["RESULTS_FILE"] = "results.json"