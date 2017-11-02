using JuMP
using PlotRecipes
using Gurobi


#for i in sort(collect(keys(citiesDict)))

#posição de cada ponto a ser visitado
citiesDict = Dict{Int,Any}()
citiesDict[1] = (523,418)
citiesDict[2] = (527,566)
citiesDict[3] = (435,603)
citiesDict[4] = (386,660)
citiesDict[5] = (346,692)
citiesDict[6] = (431,730)
citiesDict[7] = (419,818)
citiesDict[8] = (347,520)
citiesDict[9] = (332,330)
citiesDict[10] = (165,374)
citiesDict[11] = (196,198)
citiesDict[12] = (187,108)
citiesDict[13] = (210,63)

nCities= length(citiesDict)     

#matriz que armazena distâncias entre pontos
c = zeros(nCities,nCities)

posX, posY = [],[]

for i in sort(collect(keys(citiesDict)))
	posI = citiesDict[i]
	for j in sort(collect(keys(citiesDict)))
		posJ = citiesDict[j]
		c[i,j] = ((posI[1]-posJ[1])^2 + 
			  (posI[2]-posJ[2])^2)^0.5
	end
	append!(posX, posI[1])
	append!(posY, posI[2])
end

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

