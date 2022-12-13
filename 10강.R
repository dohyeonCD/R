##### 반복문

## for                                                                                           for(변수 in 데이터){변수를 사용한 명령문}. 데이터를 한번씩 참조할 때~
data <- c(32,45,21,10,43)
max <- 0
for (i in data) {
  max <- ifelse(i> max, i, max)
}
print(max)                            # max 직접 구현



## while                                                                                         while(조건식) {조건이 참일 경우 수행할 명령문}. break를 사용해 강제로 반복 종료 가능.         데이터의 인덱스를 참조~ 어떠한 수치값을 반복문을 통해서 구해야 할 때~
value <- 5
result <- 1
i <- 1
while(i <= value) {
  result <- result * i
  i <- i+1
  print(result)                       # factorial(5) 직접 구현
}


## repeat {명령문(무한반복이 기본)}. 가장 간단한 반복문 구조. 잘 사용 X.




##### 벡터

## 참조, 할당
data <- c(32,45,21,10,43)
data[1]                          # 인덱스는 1부터 시작
data[2] <- 50                    # data 2번을 50으로 할당
data[2]

# 다중 위치 참조
logic <- c(T,T,F,F,T)
data[logic]                      # TRUE인 index 리턴
num <- c(1,2,5)
data[num]                        # 해당 index 리턴

# 음수 위치값
data[c(-3,-4)]                   # 해당 index 빼고 리턴

## 벡터에 index별 이름 설정 가능
c(singer='아이브', song='love dive', member= 5)


## 반복문 & 벡터
i <- 1
data <- c(32,45,21,10,43)
while(i < length(data)) {
  if(i%%2 == 0) {                # 짝수번째 위치 index 리턴
    print(data[i])
  }
  i <- i+1
}


# 반복문 사용하여 벡터 값 채우기
i <- 1
vec <- c()
while(i <=10) {
  vec <- c(vec, i)
  i <- i+1
}
print(vec)




##### 실습
## min 함수 직접 구현
data <- c(32,45,21,10,43)
min <- 100000000                            # 충분히 큰 값으로 초기화
for (i in data) {
  min <- ifelse(i < min, i, min)
}
print(min)



## 숫자형 벡터 데이터에서 각 값이 2의 배수라면 TRUE, 아니면 FALSE 출력
data <- c(32,45,21,10,43)
for (i in data) {
  if(i%%2 == 0) {
    print('TRUE')
  } else {
    print('FALSE')
  }
}



## 숫자형 벡터 데이터에서 홀수 자리 값의 합을 출력
data <- c(32,45,21,10,43)
sum <- 0
i <- 1                               # 데이터 인덱스 표시~
while (i <= length(data)) {
  if(i%%2 == 1) {
    sum <- sum + data[i]
  }
  i <- i+1
}
print(sum)



## 운항 횟수가 1000회 이상이면 '우수', 그 이하면 '보통' 값을 가지는 벡터를 생성.
vec <- c()
i <- 1
while(i <= length(flight)) {
  if(flight[i] >= 1000) {
    vec <- c(vec, '우수')
  } else {
    vec <- c(vec, '보통')
  }
  i <- i+1
}
print(vec)








##### 사용자 정의 함수

## 함수명 <- function(매개변수1, 매개변수2 ...) {실행문 // (return()) } 선택적 매개변수 지정 O
plus <- function(x, y=1) {
  result = x+y
return(result)
}
plus(5,10)
plus(5)               # 선택적 매개변수 생략



D_Day <- function(year,month,day) {
  today <- Sys.Date()                     # Sys.Date()는 오늘의 날짜 리턴 함수. 'yyyy-mm-dd'
  inputDayString <- paste(year, month, day, sep='-')     # 형변환을 위해 날짜 형식 문자열로~
  inputDay <- as.Date(inputDayString)     # Date 형식으로 변환
  Ddays <- difftime(today, inputDay)      # difftime은 Date간 차이에 해당하는 일수 리턴
return(as.integer(Ddays))
}
D_Day (2022,01,01)




## 특징
# 함수 내부에서 정의된 변수가 우선.
test <- function(x) {
  x <- 10
  print(x)
}
test(5)


# 함수 내부에서 선언한 변수는 함수 외부에서 사용 불가.
test <- function(x) {
  z <- 10
return(x+y)
}
test(5)
print(z)        #에러.


# 함수 내부에서 함수 선언 가능. (동일한 매개변수는 사용 불가.)
test <- function(x) {
  gogo <- function(k) {return(k^k)}              # k의 k승
  return(gogo(x))
}
test(3)


# 함수를 리턴 가능
make <- function(x) {
  power <- function(y) {return (y^x)}
  return(power)
}
a <- make(5)
a(2)                   # 2의 5승


# 별도 파일에 함수 저장(일반적으로 사용자 정의 함수 사용하는 방법.) -> source로 불러오기 가능.
source('Test.R')                       # 메모리에 함수 저장됨.
myFunction()









##### 실습
## airport.R과 main.R 파일을 source() 함수를 이용하여 사용해보기.
## 함수 스크립트와 메인 스크립트를 분리하여 사용~!