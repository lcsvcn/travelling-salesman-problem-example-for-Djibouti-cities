using JuMP
using PlotRecipes
using Gurobi
using Graphs

    citiesDict = Dict{Int,Any}()
    citiesDict[1]  = (11003.611100, 42102.500000)
    citiesDict[2]  = (11108.611100, 42373.888900)
    citiesDict[3]  = (11133.333300, 42885.833300)
    citiesDict[4]  = (11155.833300, 42712.500000)
    citiesDict[5]  = (11183.333300, 42933.333300)
    citiesDict[6]  = (11297.500000, 42853.333300)
    citiesDict[7]  = (11310.277800, 42929.444400)
    citiesDict[8]  = (11416.666700, 42983.333300)
    citiesDict[9]  = (11423.888900, 43000.277800)
    citiesDict[10] = (11438.333300, 42057.222200)
    citiesDict[11] = (11461.111100, 43252.777800)
    citiesDict[12] = (11485.555600, 43187.222200)
    citiesDict[13] = (11503.055600, 42855.277800)
    citiesDict[14] = (11511.388900, 42106.388900)
    citiesDict[15] = (11522.222200, 42841.944400)
    citiesDict[16] = (11569.444400, 43136.666700)
    citiesDict[17] = (11583.333300, 43150.000000)
    citiesDict[18] = (11595.000000, 43148.055600)
    citiesDict[19] = (11600.000000, 43150.000000)
    citiesDict[20] = (11690.555600, 42686.666700)
    citiesDict[21] = (11715.833300, 41836.111100)
    citiesDict[22] = (11751.111100, 42814.444400)
    citiesDict[23] = (11770.277800, 42651.944400)
    citiesDict[24] = (11785.277800, 42884.444400)
    citiesDict[25] = (11822.777800, 42673.611100)
    citiesDict[26] = (11846.944400, 42660.555600)
    citiesDict[27] = (11963.055600, 43290.555600)
    citiesDict[28] = (11973.055600, 43026.111100)
    citiesDict[29] = (12058.333300, 42195.555600)
    citiesDict[30] = (12149.444400, 42477.500000)
    citiesDict[31] = (12286.944400, 43355.555600)
    citiesDict[32] = (12300.000000, 42433.333300)
    citiesDict[33] = (12355.833300, 43156.388900)
    citiesDict[34] = (12363.333300, 43189.166700)
    citiesDict[35] = (12372.777800, 42711.388900)
    citiesDict[36] = (12386.666700, 43334.722200)
    citiesDict[37] = (12421.666700, 42895.555600)
    citiesDict[38] = (12645.000000, 42973.333300)

nCities= length(citiesDict)     

<<<<<<< HEAD
    
=======
#for i in sort(collect(keys(citiesDict)))

#posição de cada ponto a ser visitado

    citiesDict = Dict{Int,Any}()
    citiesDict[1]  = (11003.611100, 42102.500000)
    citiesDict[2]  = (11108.611100, 42373.888900)
    citiesDict[3]  = (11133.333300, 42885.833300)
    citiesDict[4]  = (11155.833300, 42712.500000)
    citiesDict[5]  = (11183.333300, 42933.333300)
    citiesDict[6]  = (11297.500000, 42853.333300)
    citiesDict[7]  = (11310.277800, 42929.444400)
    citiesDict[8]  = (11416.666700, 42983.333300)
    citiesDict[9]  = (11423.888900, 43000.277800)
    citiesDict[10] = (11438.333300, 42057.222200)
    citiesDict[11] = (11461.111100, 43252.777800)
    citiesDict[12] = (11485.555600, 43187.222200)
    citiesDict[13] = (11503.055600, 42855.277800)
    citiesDict[14] = (11511.388900, 42106.388900)
    citiesDict[15] = (11522.222200, 42841.944400)
    citiesDict[16] = (11569.444400, 43136.666700)
    citiesDict[17] = (11583.333300, 43150.000000)
    citiesDict[18] = (11595.000000, 43148.055600)
    citiesDict[19] = (11600.000000, 43150.000000)
    citiesDict[20] = (11690.555600, 42686.666700)
    citiesDict[21] = (11715.833300, 41836.111100)
    citiesDict[22] = (11751.111100, 42814.444400)
    citiesDict[23] = (11770.277800, 42651.944400)
    citiesDict[24] = (11785.277800, 42884.444400)
    citiesDict[25] = (11822.777800, 42673.611100)
    citiesDict[26] = (11846.944400, 42660.555600)
    citiesDict[27] = (11963.055600, 43290.555600)
    citiesDict[28] = (11973.055600, 43026.111100)
    citiesDict[29] = (12058.333300, 42195.555600)
    citiesDict[30] = (12149.444400, 42477.500000)
    citiesDict[31] = (12286.944400, 43355.555600)
    citiesDict[32] = (12300.000000, 42433.333300)
    citiesDict[33] = (12355.833300, 43156.388900)
    citiesDict[34] = (12363.333300, 43189.166700)
    citiesDict[35] = (12372.777800, 42711.388900)
    citiesDict[36] = (12386.666700, 43334.722200)
    citiesDict[37] = (12421.666700, 42895.555600)
    citiesDict[38] = (12645.000000, 42973.333300)
>>>>>>> ca8153056e724986d41868805d6a473ba1054517


#matriz que armazena distâncias entre pontos
c = zeros(nCities,nCities)

posX, posY = [],[]

for i in sort(collect(keys(citiesDict)))
    posI = citiesDict[i]
    for j in sort(collect(keys(citiesDict)))
        posJ = citiesDict[j]
<<<<<<< HEAD
        #calcula distância euclidiana
=======
>>>>>>> ca8153056e724986d41868805d6a473ba1054517
        c[i,j] = ((posI[1]-posJ[1])^2 + 
              (posI[2]-posJ[2])^2)^0.5
    end
    append!(posX, posI[1])
<<<<<<< HEAD
    println(append!(posX, posI[1]))
=======
>>>>>>> ca8153056e724986d41868805d6a473ba1054517
    append!(posY, posI[2])
end

model = Model(solver=GurobiSolver(TimeLimit=20, Threads=1,
          Heuristics=0.0, OutputFlag=0))

@variable(model, x[i=1:nCities, j=1:nCities;i!=j],Bin)

@objective(model, Min, sum(c[i,j] * x[i,j]
    for i in 1:nCities, j in 1:nCities if i!=j))

for i in 1:nCities
    @constraint(model, sum(x[i,j] for j in 1: nCities if i != j) == 1)
end

for j in 1:nCities
    @constraint(model, sum(x[i,j] for i in 1: nCities if i != j) == 1)
end

<<<<<<< HEAD
function lazyConstraintsCallback(cb)
    g = simple_graph(nCities, is_directed=false)

    for i in 1:nCities, j in 1:nCities
        if i!=j
            if getvalue(x[i,j]) > 0.01
                add_edge!(g,i,j) #constroi arestas
            end
        end
    end

    cc = connected_components(g) #encontra componentes conectados

    if length(cc) > 1
    # Caso só haja uma componente conexa não há subciclo e
    # não se adiciona nenhuma restrição
    minTour = sort(cc, by=length)[1]
    subtourLhs = AffExpr()
    # Encontrando arestas do subciclo
    for i in minTour
        for j in minTour
            if i != j && getvalue(x[i, j]) > 0.01
                subtourLhs += x[i, j]
            end
        end
    end
    # Adicionando a restrição
        @lazyconstraint(cb,subtourLhs<=length(minTour)-1)
    end
end # Function

    addlazycallback(model, lazyConstraintsCallback)
    solve(model)
    edgeOrigin = []
    edgeDest = []
    for i in keys(citiesDict)
        for j in keys(citiesDict)
            if i != j && getvalue(x[i, j]) > 0.01
=======
status = solve(model)

if status == :Optimal
    edgeOrigin = []
    edgeDest = []

    for i in keys(citiesDict)
        for j in keys(citiesDict)
            if i != j && getvalue(x[i,j]) > 0.99
>>>>>>> ca8153056e724986d41868805d6a473ba1054517
                append!(edgeOrigin, i)
                append!(edgeDest, j)
            end
        end
    end
<<<<<<< HEAD
    graphplot(edgeOrigin, edgeDest, names=1:nCities,
    x=posX, y=posY, fontsize=10, m=:white, l=:black)

=======

    display(
        graphplot(
              edgeOrigin, edgeDest, names=1:nCities,
              x=posX, y=posY, fontsize=12,
              m=:white, l=:black
               )
        )
else
    println("optimal solution not found")
end
>>>>>>> ca8153056e724986d41868805d6a473ba1054517
