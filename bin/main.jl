@info "include"
@show pwd()
@show readdir()
@show readdir("..")
@show @__DIR__
@show readdir(@__DIR__)
@show readdir(joinpath(@__DIR__, ".."))
include("../app.jl")
