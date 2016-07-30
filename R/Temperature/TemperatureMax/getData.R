library(data.table)
library(readr)
library(plyr)
library(dplyr)
library(tidyr)
library(DT)
library(ggplot2)
library(ggthemes)
library(viridis)   

# Read data from website
col.names <- c('ENTIDAD', 'ANYO', 'ENERO', 'FEBRERO', 'MARZO', 'ABRIL', 'MAYO', 'JUNIO',
               'JULIO', 'AGOSTO', 'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE', 'DICIEMBRE', 'UNIDAD')

temperature <- fread('http://201.116.60.46/DatosAbiertos/Temperatura_promedio.csv',
                     col.names = col.names,
                     encoding = "Latin-1")

# Data Wrangling
temperature <- temperature %>% select(-UNIDAD) %>%        # Delete 'UNIDAD' column
  gather(key = MES, value = TEMPERATURA, -ENTIDAD, -ANYO) # Gather the dataset

months <- c('ENERO', 'FEBRERO', 'MARZO', 'ABRIL', 'MAYO', 'JUNIO',
            'JULIO', 'AGOSTO', 'SEPTIEMBRE', 'OCTUBRE', 'NOVIEMBRE', 'DICIEMBRE')
temperature$MES <- factor(temperature$MES, levels = months)

states <- c('Aguascalientes',
            'Baja California',
            'Baja California Sur',
            'Campeche',
            'Chiapas',
            'Chihuahua',
            'Coahuila',
            'Colima',
            'Ciudad de Mexico',
            'Durango',
            'Guanajuato',
            'Guerrero',
            'Hidalgo',
            'Jalisco',
            'Michoacan',
            'Morelos',
            'Estado de Mexico',
            'Nayarit',
            'Nuevo Leon',
            'Oaxaca',
            'Puebla',
            'Queretaro',
            'Quintana Roo',
            'San Luis Potosi',
            'Sinaloa',
            'Sonora',
            'Tabasco',
            'Tamaulipas',
            'Tlaxcala',
            'Veracruz',
            'Yucatan',
            'Zacatecas')
temperature$ENTIDAD <- as.factor(mapvalues(temperature$ENTIDAD, from = unique(temperature$ENTIDAD), to = states))
datatable(head(temperature))

