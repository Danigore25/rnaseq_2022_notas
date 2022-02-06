### EJERCICIO GRUPAL - REVISION

speaqeasy_data <- file.path(tempdir(), "rse_speaqeasy.RData")
download.file("https://github.com/LieberInstitute/SPEAQeasy-example/blob/master/rse_speaqeasy.RData?raw=true", speaqeasy_data, mode = "wb")
library("SummarizedExperiment")
load(speaqeasy_data, verbose = TRUE)

## 1. ¿Hay diferencias en totalAssignedGene o mitoRate entre los grupos de
## diagnosis (PrimaryDx)?

# Primero realizamos la funcion table.
table(rse_gene$PrimaryDx)

# Quitamos el diagnosis Other:
rse_gene$PrimaryDx <- droplevels(rse_gene$PrimaryDx)

# Diferencias entre grupos de diagnosis
with(colData(rse_gene), tapply(totalAssignedGene, PrimaryDx, summary))
with(colData(rse_gene), tapply(mitoRate, PrimaryDx, summary))

# Al ver las respuestas nos damos cuenta de que hay diferencias entre ambos
# grupos de diagnosis.


## 2. Grafica la expresión de SNAP25 para cada grupo de diagnosis.

# Ver donde se encuentra el gen SNAP25.
rowRanges(rse_gene[which(rowRanges(rse_gene)$Symbol == "SNAP25")])

# Correr iSEE
iSEE::iSEE(rse_gene)


## 3. Sugiere un modelo estadistico que podríamos usar en una análisis de
## expresión diferencial. Verifica que si sea un modelo full rank. ¿Cúal sería
## el o los coeficientes de interés?


