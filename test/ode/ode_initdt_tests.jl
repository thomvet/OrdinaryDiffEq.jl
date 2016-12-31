using OrdinaryDiffEq,DiffEqProblemLibrary, DiffEqDevTools

prob = prob_ode_linear
println("Solve and Plot")
sol =solve(prob,Rosenbrock32())
dt₀ = sol.t[2]

prob = prob_ode_2Dlinear

## Solve and plot
println("Solve and Plot")
tab = constructBogakiShampine3()
sol =solve(prob,ExplicitRK(),tableau=tab)
dt₀ = sol.t[2]

@test  1e-7 < dt₀ < .1
@test_throws ErrorException sol = solve(prob,Euler())
#dt₀ = sol.t[2]

tab = constructDormandPrince8_64bit()
sol3 =solve(prob,ExplicitRK(),tableau=tab)
dt₀ = sol3.t[2]

@test 1e-7 < dt₀ < .3
