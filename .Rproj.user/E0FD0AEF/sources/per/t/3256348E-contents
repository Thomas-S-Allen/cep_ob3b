library('ProjectTemplate')
load.project()

for (dataset in project.info$data)
{
  message(paste('Showing top 5 rows of', dataset))
  print(head(get(dataset)))
}


VvsVmI_obs <- VvsVmI(cep.df)
ggsave(file.path('graphs', 'VvsVmI_obs.pdf'))


irac1_obs <- cep.df %>%
    error_chop() %>% unclassified_chop() %>% 
    irac1()
ggsave(file.path('graphs', 'irac1_obs.pdf'))