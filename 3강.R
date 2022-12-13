str(airquality)      # DT의 컬럼, 값들의 정보를 보여줌.

head(airquality)
tail(airquality)

boxplot(airquality$Ozone, airquality$Wind, airquality$Temp)

x <- 1               # 변수를 지정하는 방법인듯..? 이렇게 지정하면 오른쪽 environment에 저장.




head(airquality)     # 파이썬과 동일. tail도 있음. 다만 6개로 보여줌. 
print((67+72+74+62+56+66)/6)
