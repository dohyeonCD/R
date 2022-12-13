##### R 연산자

## 산술 연산자
32^7               #제곱
10%%3              # 나머지
10%/%3             # 몫
346434%%3343
346434%/%3343


## 비교 연산자 (논리형으로 리턴됨)
vec <- 101100010111010110 != 11001011000101011         # 같지 않다.
print(vec)


## 논리 연산자
a<- c(T,T) & c(F,T)              # 각 원소를 비교. T와 F 비교-> FALSE, T와 T 비교-> TRUE  (AND)
b<- c(T,T) && c(F,T)             # 첫번째 원소만 비교. T와 F 비교-> FALSE  (AND)
c<- c(T,T) | c(F,T)              # 각 원소를 비교. T와 F 비교-> T 있으니 TRUE  (OR)
d<- c(T,T) || c(F,T)             # 첫번째 원소만 비교. T와 F 비교-> 첫 벡터에 T있음~ TRUE  (OR)
e<- !TRUE                        # (NOT)

list<- list(a,b,c,d,e)
print(list)








##### 산술 함수

## min, max, sum, mean(평균), median(중간값)


## prod : 입력 벡터를 다 곱함.
prod(c(1,2,3,4,5))


## factorial : 1부터 입력 값까지의 팩토리얼 값 출력
factorial(4)
factorial(c(1,2,-3,4))        # 정수값에 대해서만~ 음수는 NaN


## abs : 입력 값을 절대값으로 출력
abs(c(1,-2,3,-4,5))


## range : 입력 벡터의 최소값, 최대값 출력
range(c(5,2,-4,10,7))


## var : 입력 벡터의 평균에 대한 분산값 출력. (분산은 편차 제곱의 평균)
var(c(1,2,3,4,5))


## sd : 입력 벡터의 평균에 대한 표준편차값 출력
sd(c(1,2,3,4,5))








##### 문자열 함수
## paste : 값들을 하나의 문자열로 결합
paste('안녕', '하세', '요')
paste('안녕', '하세', '요', sep='')
paste('안녕', '하세', '요', sep='~..')
paste(c(1,2,3))                            # 벡터 값들을 개별로 인식
paste(c(1,2,3), c('번','번','번'), sep='') 


## rep : rep(data,n) data를 n번 반복하는 벡터 생성
rep(1, 5)
rep('ㅎ',5)


## paste & rep 활용
vec <- c(1,2,3)
len <- length(vec)            # vec의 길이 리턴.
paste(vec, rep('번',len))








##### 실습
airline <- c("아시아나항공", "에어부산", "에어프레미아", "에어서울", "제주항공", "진에어", "대한항공", "티웨이항공")
flight <- c(1575, 481, 124, 354, 1197, 793, 1670, 859)
passenger <- c(249792, 90985, 29238, 71213, 203335, 133253, 250895, 146497)
freight <- c(3097.9, 516.7, 111.1, 273.1, 847.1, 763.2, 5406.1, 597.6)


airport <- data.frame('항공사 명'=airline, '운항(편)'=flight, '탑승객(수)'=passenger, '화물(톤)'=freight)

airport


## 운항/ 탑승객/ 화물 별 '총 실적' 및 '평균 실적'
total <- c(sum(flight), sum(passenger), sum(freight))
average <- total/length(flight)                                 # 컬럼에 있는 값 몇개인지~
print(total)
print(average)


# 운항이 평균 실적보다 높은 항공사들을 출력하시오.
high <- c(flight >= mean(flight))
print(high)
result <- airline[high]                                     # []는 TRUE인 인덱스만 가져오겠다~
print(result)








##### 조건문
## if ,else if, else
score <- scan()                            # scan()은 input() 같은 거. 콘솔 창에 입력!
if(score>= 90) {
  grade <- 'A'
  } else if(score>= 70) {
  grade <- 'B'
  } else if(score>= 50) {
  grade <- 'C'
  } else {
  grade <- 'F'
  }
print(paste('당신의 학점은:',grade, '입니다'))



## ifelse (삼항연산자. 벡터 연산 가능)                                                           ifelse(조건식, '참'인 경우 실행문, '거짓'인 경우 실행문)
score <- c(30,90,75,60)
ifelse(score >=70, print('합격'), print('불합격'))



## switch (입력값과 비교값이 같다면 해당하는 실행문 실행. 비교값은 문자열만 가능)                switch(입력값, 비교값1=실행문1, 비교값2=실행문2..., 기본 실행문)
x <- 'love'
y <- 'dive'
switch(x, 'ive'=print('아이브'), 'love'=print('럽'), '5'=print('숫자'), NULL)
switch(y, 'ive'=print('아이브'), 'love'=print('럽'), '5'=print('숫자'), NULL)



## which (조건에 해당하는 입력 벡터 내부 값의 인덱스(위치) 출력. 조건에 따른 실행 기능은 X)
result <- which(score >= 60)
score[result]








##### 실습
temp <- scan()
if(temp >= 30) {
  print('더움')
} else if(temp >= 20) {
  print('보통')
} else if(temp >= 10) {
  print('선선')
} else if(temp > 0) {
  print('추움')
} else {
  print('매우 추움')
}




data <- '조금'
if(data == '매우 많이') {
  result <- 100
} else if(data == '많이') {
  result <- 70
} else if(data == '보통') {
  result <- 50
} else if(data == '조금') {
  result <- 30
} else {
  result <- 0
}
print(result)


food <- '보통'
result <- switch(food, '매우 많이'= 100, '많이'= 70, '보통'= 50, '조금'= 30, 0)
print(result)




flight
ifelse(flight >= 1000, '우수', '보통')


result <- which(flight > mean(flight))
airline[result]                                           # []는 특정 인덱스 추출도 가능~
