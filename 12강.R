##### 그래프 그리기

## plot()                                                                                        plot(x,y, type='', main=NULL, xlab='', ylab='', xlim=c(), ylim=c()...)                        type : 그래프 타입. (p: 점, l: 선, b(o): 점&선)            main : 그래프 제목                 lab : 축 이름            lim : 축의 값 범위
x= 1
y= 2
plot(x,y)
plot(x,y,ylim = c(0.6,2.0))

x= c(1,2,3,4,5,6)
y= c(2,4,5.8,7,7.5,8)
plot(x,y, pch= 19)              # 점의 모양. 숫자(1~25)마다 지정되어있음, 문자('*','%','#' 등)
plot(x,y, type= 'l')
plot(x,y, type= 'b')

library(datasets)
data <- EuStockMarkets            # 4개의 컬럼이 있음. 그걸 다 합쳐서 x축으로~!
plot(1:length(data), data, type='l', main='1991-1998 Europe~', xlab = 'day', ylab = 'price')




## 다중 그래프 그리기
## plot을 먼저 그리고, lines를 통해 추가 그래프를 그림.
plot(x, type= 'o', xlim= c(1,6), ylim= c(1,8), pch= 15, col= 'skyblue')     # col은 선 색 지정~
lines(y, type= 'b', pch= 19, col= 'black')


library(datasets)
data <- as.numeric(AirPassengers)
y1949= data[1:12]
y1950= data[13:24]
plot(y1949, type= 'o', xlab= 'Month', ylab= 'passengers', ylim= c(90,180), pch= 19, col= 'red')
lines(y1950, type= 'o', pch= 19, col= 'blue')




## 범례 그리기
## legend(위치 값, legend= 라벨 값, fill= 색상 값)
plot(y1949, type= 'o', xlab= 'Month', ylab= 'passengers', ylim= c(90,180), pch= 19, col= 'red')
lines(y1950, type= 'o', pch= 19, col= 'blue')
legend('topright', legend = c('y1949', 'y1950'), fill = c('red', 'blue'))




## 파이 차트                                                                                     pie(데이터, label= 라벨, init.angle= 0, radius= 1)                                            label : 요소별 이름 등록           init.angle : 기준선 각도         radius : 원의 크기 조절
data= c(40,23,34)
ABC <- c('A','B','C')
pie(data, label= ABC)

# 범주형 데이터를 파이차트로 시각화
reserch <- c('좋다', '싫다', '보통이다', '좋다', '좋다', '보통이다', '싫다', '좋다', '싫다')
re_table <- table(reserch)
pie(re_table)                       # table 객체 삽입시, label이 자동으로 붙음.




## 히스토그램                                                                                     hist(데이터, breaks= NULL, freq= T).        수치형 데이터를 범주화하여 표현하는 데 적합       break : 범주 개수                           freq : 결과 출력 값 기준. (T는 횟수, F는 비율)
data <- c(2,1,4,5.8,6,7,12,13,14,4,2,6,7,6,5,4,7,7.5,8,6,4,7,6,5,9,1,3,2,15,20,17)
hist(data)
hist(data, breaks = 10)                        # 10개의 범주로 쪼갬.
hist(data, breaks = 10, freq = F)              # y축이 비율로 표현됨.




## 상자그림                                                                                       boxplot(데이터, boxwex= NULL)              수치형 데이터의 분포를 시각화 하는 데 적합         boxwex : 상자의 넓이
boxplot(data)
boxplot(data, boxwex= 0.5)

# 다중 상자그림
data <- airquality
boxplot(data)








##### 실습

## 2021년 9월 국내 항공사의 '김해-제주' 비행기 실적의 항공사별 화물 실적 비율을 파이차트로.
# 엑셀 로딩 패키지 다운로드
installed.packages('readxl')
library(readxl)


#데이터 로딩
data <- read_excel('airport.xlsx', col_names = FALSE, range= 'R80C3:R85C12')
head(data)


# 데이터에서 필요한 값 추출
airportname <- data$...1                # 컬럼명이 ...1인 데이터 추출하여 벡터에 담기.
freight <- as.numeric(data$...10)       # <chr> character 형으로 왔기 때문에 형변환.
freight


# 항공사명 실적 비율 계산, 라벨 벡터 만들기
freight_percent <- round(freight/sum(freight) *100, digits = 1)                # 소수점 1째~
freight_percent
label_data <- paste(airportname, '(', freight_percent, '%)', sep= '')
label_data


# 파이차트 출력
pie(freight, labels = label_data)




## 서울시 코로나19 백신 예방접종 현황에서 당일 1차 접종자와 2차 접종자 데이터, 접종률 데이터~
data2 <- read.csv('covid19.csv', header = F, skip= 1, nrows = 30)    # 첫 행 스킵~ 30줄줄 로딩
dim(data2)
data2 <- data2[30:1,]                  # 데이터 위아래 뒤집기(9월 1일부터 나오게끔)
head(data2)

# 데이터에서 필요한 값 추출
first_vaccine <- data2$V3
second_vaccine <- data2$V6

first_rate <- data2$V5
second_rate <- data2$V8

# 다중 그래프 출력
plot(first_vaccine, type = 'o', xlab = 'day', ylab = 'count', main = 'covid 일일 백신 접종수',
     pch= 19)
lines(second_vaccine, type = 'o', col= 'red', pch= 19)
legend('topright', legend = c('first_vaccine', 'second_vaccine'), fill= c('black', 'red'))

plot(first_rate, type = 'o', xlab = 'day', ylab = 'rate(%)', ylim= c(20,80), col= 'skyblue',
     main = 'covid 총 백신 접종률', pch= 19)
lines(second_rate, type = 'o', col= 'purple', pch= 19)
legend('bottomright', legend = c('first_rate', 'second_rate'), fill= c('skyblue', 'purple'))




## TravelMode.csv 에서 wait, vcost, gcost, income 컬럼에 대한 다중 박스그래프. travel 히스토~
data3 <- read.csv('TravelMode.csv')
head(data3)
dim(data3)

# 데이터에서 필요한 값 추출
choice <- data3$choice
real_index <- which(choice == 'yes')
real_data <- data3[real_index, ]
head(real_data)
best_data <- real_data[, c(-1,-2,-4)]               # x, individual, choice 컬럼 삭제
head(best_data)

# 박스그래프 출력
boxplot_data <- best_data[, c(-1, -4, -7)]          # 그래프 그릴 컬럼만 남겨두고 삭제
boxplot(boxplot_data)

# 히스토그램 출력
hist(best_data$travel)
