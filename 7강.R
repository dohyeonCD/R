##### 변수

## 변수 선언방법 ( <- )
a <- 10
b <- NULL        # 일단 선언해두고 싶을 때.


## 변수 할당
a <- 10+20
b <- a-5
c <- c(1,2,3) + 5      # 벡터에 대한 산술 연산도 가능. (1+5, 2+5, 3+5)
d <- (10>5)
e <- b+d

a,b <- 5,10            # 한번에 여러 변수 선언은 오류남.
a <-5
b <-10                 # ,로 묶는 것도 안됨. 여러 줄에 걸쳐서 변수 할당!








##### 함수 
## 입력변수를 프로그래밍 언어로 '매개변수'라 함. Parameter, Argument라고도 부름.

## print 함수의 출력 vs 함수의 리턴 구분
a <- TRUE
b <- class(a)               # a에 대한 데이터 타입을 문자열로 리턴.
c <- print(a)               # a를 변수 값 그대로 출력.

class(b)
class(c)








##### 내장함수

## As (강제 형변환 함수)
# 데이터 우선순위에 따라 변환. 낮은-> 높은 건 다 됨. Numeric과 Logical은 자유롭게 왔다갔다 가능
vec <- c(T, F, F)
vec2 <- as.numeric(vec)               # Logical -> Numeric
vec3 <- as.logical(vec2)              # Numeric -> Logical (양수는 T, 0을 포함한 음수는 F)
vec4 <- as.character(vec3)            # Logical -> Character

# Character는 값이 숫자형/논리형 모양이면 가능. (높은-> 낮은 거 변환하는 경우.)
vec_1 <- c('hi','10','T')
vec_2 <- as.numeric(vec_1)
vec_3 <- as.logical(vec_1)


## seq
# seq(length, from, by) : from부터 by씩 증가하는 length개의 숫자로 이루어진 벡터 생성.
seq(length= 5, from= 1, by= 2)


## rnorm
# rnorm(n, mean, sd) : 평균이 mean, 분산이 sd인 정규분포를 따르는 n개의 숫자로 이루어진 벡터~
rnorm(n= 3, mean= 2, sd= 1)


## runif
# runif(n, min, max) : [min:max] 범위 사이 n개의 난수로 이루어진 벡터 생성.
runif(n= 4, min= 10, max= 30)
