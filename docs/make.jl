using Documenter, SecretAnalysis

makedocs(;
    modules=[SecretAnalysis],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://gitlab-test.eastus2.cloudapp.azure.com/mbauman/SecretAnalysis.jl/blob/{commit}{path}#L{line}",
    sitename="SecretAnalysis.jl",
    authors="Matt Bauman",
    assets=String[],
)
