using Plots
plot(size = (400, 400))
plot!(x ->  sqrt(1 - x^2), -1, 1, color=:black, label="")
plot!(x -> -sqrt(1 - x^2), -1, 1, color=:black, label="")
xs, ys = 1 .- rand(500).*2, 1 .- rand(500).*2
inside = abs.(xs.^2 .+ ys.^2) .<= 1
scatter!(xs[inside], ys[inside], color=:red, label="")
scatter!(xs[.!inside], ys[.!inside], color=:blue, label="")
savefig("darts-full.svg")
# And quarter image:
plot(size = (400, 400))
plot!(x ->  sqrt(1 - x^2), 0, 1, color=:black, label="")
quarter_mask = (xs .>= 0) .& (ys .>= 0)
xs, ys = xs[quarter_mask], ys[quarter_mask]
inside = abs.(xs.^2 .+ ys.^2) .<= 1
scatter!(xs[inside], ys[inside], color=:red, label="")
scatter!(xs[.!inside], ys[.!inside], color=:blue, label="")
savefig("darts-quarter.svg")
