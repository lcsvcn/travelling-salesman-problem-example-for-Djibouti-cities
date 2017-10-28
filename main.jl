using PlotRecipes
using Gurobi

#pyplot()

#posX, posY = [],[]

#for i in sort(collect(keys(citiesDict)))
	
model = Model(solver=GurobiSolver(TimeLimit=20, Threads=1,
	      Heuristics=0.0, OutputFlag=0))

@variable(model, x[i=1:nCities, j=1:nCities if i!=j],Bin)

@objective(model, Min, sum(c[i,j] * x[i,j]
	for i in 1:nCities, j in 1:nCities if i!=j))

for i in 1:nCities
	@constraints(model, sum(x[i,j] for j in 1: nCities if i != j) == 1)
end

for j in 1:nCities
	@constraints(model, sum(x[i,j] for i in 1: nCities if i != j) == 1)
end

status = solve(model)

if status == :Optimal
	edgeOrigin = []
	edgeDest = []

	for i in keys(citiesDict)
		for j in keys(citiesDict)
			if i != j && getvalue(x[i,j] > 0.99)
				append!(edgeOrigin, i)
				append!(edgeDest, j)
			end
		end
	end

	display(
		graphplot(
			  edgeOrigin, edgeDest, names=1:nCities,
			  x=PosX, y=posY, fontsize=12,
			  m=:white, I=:black
			   )
		)
else
	prinln("optimal solution not found")
end

