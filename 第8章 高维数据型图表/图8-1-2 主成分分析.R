#主成分分析图
library(ggplot2)
library(factoextra)
library(FactoMineR)
df <- iris[c(1, 2, 3, 4)]
iris.pca<- PCA(df, graph = FALSE)
fviz_pca_ind(iris.pca,
             geom.ind = "point",
             pointsize =3,pointshape = 21,fill.ind = iris$Species
             palette = c("red", "yellow", "blue"),
             addEllipses = TRUE
             legend.title = "Groups",
             title="")+
  theme_grey() +
  theme(
  text=element_text(size=12,face="plain",color="black"),
  legend.background = element_blank(),
  legend.position=c(0.88,0.15)
)

set.seed(1)
num_rows_sample <- 5000

train        <- read.csv("Tsne_Data.csv")
train_sample <- train[sample(1:nrow(train), size = num_rows_sample),]
features     <- train_sample[,c(-1, -95)]
features.pca<- PCA(features, graph = FALSE)

fviz_pca_ind(features.pca,
             geom.ind = "point",
             pointsize =3,pointshape = 21,fill.ind = train_sample$target,
             addEllipses = TRUE,
             legend.title = "Groups",
             title="")
