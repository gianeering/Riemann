using Riemann
using Documenter

DocMeta.setdocmeta!(Riemann, :DocTestSetup, :(using Riemann); recursive=true)

makedocs(;
    modules=[Riemann],
    authors="Gianfranco Ponza",
    repo="https://github.com/gianeering/Riemann.jl/blob/{commit}{path}#{line}",
    sitename="Riemann.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://gianeering.github.io/Riemann.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/gianeering/Riemann.jl",
    devbranch="main",
)
