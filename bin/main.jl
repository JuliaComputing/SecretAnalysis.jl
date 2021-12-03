using SecretAnalysis, JSON, Printf, Distributed, JSON3

n = parse(Int64, replace(get(ENV, "n", "10_000_000_000"), '_'=>""))

println("#### Estimating π with $n throws ####")

t = @timed @show estimate_pi(n)

out_1 = Dict(:pi => t[1], :time => @sprintf("%.1fs", t[2]), :workers => nworkers(), :tag => "RESULTS")
out_2 = Dict(:pi => t[1], :time => @sprintf("%.1fs", t[2]), :workers => nworkers(), :tag => "RESULTS_FILE")

# ENV["OUTPUTS"] = JSON.json(out)
# ENV["RESULTS"] = JSON.json(out)


ENV["RESULTS"] = JSON3.write(out_1)

open("results.json", "w") do io
    JSON3.pretty(io, JSON3.write(out_2))
end

ENV["RESULTS_FILE"] = "results.json"