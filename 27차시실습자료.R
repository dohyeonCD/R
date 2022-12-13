#27차시 실습자료

install.packages("gapminder")
library(gapminder)
str(gapminder)
table(gapminder$continent)
table(gapminder$country)

mean(pull(gapminder[gapminder$continent == "Africa", "gdpPercap"]))
mean(pull(gapminder[gapminder$continent == "Americas", "gdpPercap"]))
mean(pull(gapminder[gapminder$continent == "Asia", "gdpPercap"]))
mean(pull(gapminder[gapminder$continent == "Europe", "gdpPercap"]))
mean(pull(gapminder[gapminder$continent == "Oceania", "gdpPercap"]))

mean(pull(gapminder[gapminder$country == "Korea, Rep.", "gdpPercap"]))

gapminder %>% filter(continent == "Africa") %>% select(gdpPercap) %>% pull() %>% mean()
gapminder %>% filter(continent == "Americas") %>% select(gdpPercap) %>% pull() %>% mean()
gapminder %>% filter(continent == "Asia") %>% select(gdpPercap) %>% pull() %>% mean()
gapminder %>% filter(continent == "Europe") %>% select(gdpPercap) %>% pull() %>% mean()
gapminder %>% filter(continent == "Oceania") %>% select(gdpPercap) %>% pull() %>% mean()

gapminder %>% filter(country == "Korea, Rep.") %>% select(gdpPercap) %>% pull() %>% mean()


#Q1
gdp_bycontinents <- gapminder %>%
  group_by(continent) %>%
  summarize(mean_gdpPercap=mean(gdpPercap))
gdp_bycontinents %>% filter(continent=="Asia") %>% pull() %>% class()
#Q2
America <- gapminder %>% filter(continent == "Americas")
America %>% nrow()                  #300

#Q3
America %>% filter(pop >= 30000000) %>% count(country, sort=T)


#Q4
min <- gapminder %>% filter(country == "Brazil" | country == "Mexico" | country == "United States") %>% select(pop) %>% min()
max <- gapminder %>% filter(country == "Brazil" | country == "Mexico" | country == "United States") %>% select(pop) %>% max()
gapminder %>% filter(country == "Brazil") %>% select(year, pop) %>% plot(type='o', col="red", ylim=c(min,max))
gapminder %>% filter(country == "Mexico") %>% select(year, pop) %>% lines(type='o', col="blue")
gapminder %>% filter(country == "United States") %>% select(year, pop) %>% lines(type='o', col="green")
legend("topleft",legend=c("Brazil", "Mexico", "United States"), fill=c("red", "blue","green"))
