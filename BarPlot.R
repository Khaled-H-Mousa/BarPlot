setwd("/home/khaled/Documents/SRA_Saleh/Developmental_Stages/New_Out_0.01/GO_Term/Pathways_PPI/Bar")
library(ggplot2)
E <- read.csv(file = "GO_ontology.tsv",header = TRUE,sep = "\t")
colnames(E)
target_name <- c("genes_number","category","description")
E <- E[target_name]
E = E[!duplicated(E$description),]
E$description <- factor(E$description, levels = E$description[order(E$category)])

#(x  = description,y = genes_number,fill=category)
#x ="Function Class", y = "Number of genes"
g <- 
  ggplot() +
  geom_bar(data = E, aes(x  = genes_number,y = description,fill=category), stat = "identity", width = 0.5)+  
  theme(axis.text.x = element_text(angle = 0, vjust = 1,hjust=1,size = 15)) +   
  theme(panel.background = element_blank())+
  labs(title = "Go function Classification",size =20 , x ="Number of genes", y = "Function Class") 


h <- g + theme(plot.title = element_text(size = 10,hjust = .5))             
aspect_ratio <- 2.5
height <- 7
ggsave(h, filename = "Gene_ontology_top3.pdf",width = 4 *aspect_ratio)

#height = 10 , 

