##### Dplyr 

## 데이터 전처리를 쉽게 해주는 R 패키지
install.packages('dplyr')
library(dplyr)


## 파이프 연산자 제공 (%>%)
a <- c(10,22)
a %>% mean              # 왼쪽 변수를 오른쪽 함수에 사용. mean(a)와 동일. 체인 연산자.           
# 기본 R코드- 함수 중첩. round(mean(a), 1) 한다면, 파이프는 a %>% mean %>% round(1)로 가능.      가독성 훌륭. 단축키 : ctrl + shift + m


## rename 함수 (컬럼명 변경)                                                                      rename(데이터, 변경 후 컬럼명1 = 기존 컬럼명1, 변경 후 컬럼명2 = 기존 컬럼명2...) 
data <- Orange
data <- rename(data, Treeidx= Tree)
head(data)


## arrange 함수 (컬럼 정렬)                                                                       arrange(데이터, 컬럼명)                      내림차순 하려면-> arrange(데이터, desc(컬럼명))
arrange(data, circumference) %>% tail()
arrange(data, age, circumference) %>% tail()     # 앞 컬럼 하고 뒤 컬럼~


## distinct 함수 (중복값 제거)                                                                    distinct(데이터, 컬럼명)
distinct(data,age)








## 예제 데이터 생성
id <- as.character(c(2021001:2021010))
math <- c(100,54,36,76,54,94,15,6,34,64)
english <- c(95,23,11,89,50,53,70,13,60,90)
science <- c(99,56,43,90,34,77,43,3,85,72)
exam <- data.frame(id, math, english, science)
exam


## 예제 데이터 생성 2
id <- as.character(rep(c(2021001:2021010), times= 2))
mid_math <- c(100,54,36,76,54,94,15,6,34,64)
final_math <- c(90,80,23,67,44,71,10,45,87,55)
math <- c(mid_math, final_math)

mid_english <- c(95,23,11,89,50,53,70,13,60,90)
final_english <- c(90,32,4,74,90,23,83,52,43,70)
english <- c(mid_english, final_english)

mid_science <- c(99,56,43,90,34,77,43,3,85,72)
final_science <- c(100,79,25,65,63,75,73,66,50,83)
science <- c(mid_science, final_science)

examT <- rep(c('중간','기말'), times= c(10,10))             # 10번, 10번씩 따로 반복.
exam2 <- data.frame(id, math, english, science, examT)
exam2








##### Dplyr 주요함수

## select : 원하는 컬럼만 추출                                                                    select(데이터, 컬럼명1, 컬럼명2)
select(exam, science, english)              # 기본 R 함수: exam[, c('science','english')]...ㅎ


## filter : 조건에 충족되는 행만 추출                                                             filter(데이터, 조건식). 조건식에서 &, | 연산자 이용 가능.
filter(exam, science>= 70 & math <= 50)     # 기본 R 함수: 조건에 맞는 인덱스 추출-> 대입~..ㅎ


## mutate : 새로운 컬럼 생성                                                                      mutate(데이터, 생성할 컬럼명1= 수식, ...)
mutate(exam, average= (math+science+english)/3 )

#평균이 70점 이상이면 '합격', 아니면 '불합격' 값을 가지는 pass 컬럼을 추가하시오.
mutate(exam, pass= ifelse((math+science+english)/3>=70, '합격', '불합격'))



## group_by : 특정 컬럼의 값이 같은 데이터들을 집단으로 묶어줌.                                   group_by(데이터, 컬럼명)
group_by(exam2, id)          # group_by 만으로는 외관상 달라지는 것 X. group관련 형식이 추가됨~


## summarize : 그룹 단위로 동일기능 수행 후, 새로운 데이터 프레임에 수행 결과 통합                summarize(그룹된 데이터, 컬럼명1= 계산식1, ...)
group_exam <- group_by(exam2, id)
summarize(group_exam, math_avg= mean(math), english_avg= mean(english))

# exam2에서 'examT' 단위로 그룹을 묶고, 중간/기말 고사의 평균 수학점수를 구하시오.
group_exam <- group_by(exam2, examT)
summarize(group_exam, math_avg= mean(math))
