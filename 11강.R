##### 데이터

## 키보드 입력식
## scan() : 일반적으로 수치형만 O. scan(what= character()) what 입력하면 해당 형식 값 입력 O


## 로컬파일
# .txt : 데이터들을 다양한 구분자로 분리하여 저장. 구분자가 여러개거나 없을 수도 O
# .csv : 구분자가 , 인 데이터 파일
# .xlsx : 엑셀 파일
# 웹 관련 확장자 (xml, json, html 등)




##### 데이터 가져오기

## read.table  (txt)                                                                             read.table(파일명, header= TRUE, sep= '', col.names= c(), na.string= '')                      header : 데이터 첫 행에 컬럼명이 있다면 T, 없다면 F,               sep : 구분자 지정 가능.    col.names : 컬럼명 임의 설정가능.             na.string : 결측치가 어떤 문자로 되어있는지~

dir ()                                # student.txt. 파일 잘 들어가있는지 확인.
data <- read.table('student.txt', header = TRUE, sep = ';')            # ; 써야 컬럼이 구분됨.

class(data)
dim(data)                   # 데이터 크기 확인
print(data)

# 결측치 O
data2 <- read.table('student2.txt', header = TRUE, sep=' ', na.string = '-')
print(data2)



## read.csv                                                                                       read.csv(파일명, header= TRUE, col.names= c(), na.string= '')        # sep는 ,가 고정이라~
data3 <- read.csv('student3.csv', header = F, col.names = c('학번', '이름', '학년', '성적'))
print(data3)



## read_excel                                                                                    read_excel(파일명, sheet= NULL, range= NULL, col_names= TRUE, col_types= NULL, na='')         sheet : 여러개인 경우 이름 지정, 지정하지 않을 경우 1번 sheet.        range : 불러올 범위     col_names : header와 동일.        col_types : col.names와 동일.       na : na.string과 동일

install.packages('readxl')
library(readxl)                          # 패키지 설치해야 함. (최초 1회만 하면 됨)

# grade시트 가져오기
g_data <- read_excel('student4.xlsx')     # 비어있는 값이어서 결측치인 거 앎.
print(g_data)

# exam시트 가져오기
e_data <- read_excel('student4.xlsx', sheet= 'Exam', na='NULL')
print(e_data)

# homework시트 가져오기
# 특정 행 다 가져오기 (cell_rows 함수)
h_data <- read_excel('student4.xlsx', sheet = 'Homework', range= cell_rows(3:8))
print(h_data)

# 특정 행,열 범위만 가져오기 (row-column 지정 방식)
hh_data <- read_excel('student4.xlsx', sheet= 'Homework', range= 'R3C1:R8C4') 
                                                                  #3행 1열~ 8행 4열
print(hh_data)



## 인터넷 파일                                                                                   데이터 주소(url)를 기존 파일 로딩함수 매개변수에 삽입.
## read.table, read.csv 하고 ('url~') 하면 됨. 




##### 데이터 내보내기
## write.table(데이터 프레임 변수, 파일명, row.name=TRUE, quote=TRUE, sep='')                    row.name : 행 번호를 지정하는 컬럼을 새로 만들지~                                             quote : 문자 형식 데이터에 '' 붙일지~


## write.csv(데이터 프레임 변수, 파일명, row.name=TRUE, quote=TRUE)


## write_xlsx(데이터 프레임 변수, path= 저장할 파일 명)
install.packages('writexl')
library(writexl)








##### 데이터 확인
## 데이터셋 선정 (datasets 패키지 내장 데이터셋)
library(datasets)
data <- Orange
print(data)


## str(data) : class, 크기, 미리보기 값 제공. factor는 범주형 데이터임을 의미하는 문자열 벡터
str(data)


## names(data) : 데이터의 컬럼 이름 출력
names(data)


## View(data) : Rstudio 뷰어 창에서 데이터 확인 가능. V 대문자!
View(data)




##### 데이터 조작

## 데이터 특정 행, 열 추출
data[c(1,2), ]              # 데이터의 1,2행 과 모든 열 추출
data[, c(1,2)]              # 데이터의 모든 행과 1,2열 추출
data[c(1,2), c(1,2)]        # 데이터의 1행 1열~ 2행 2열 추출

## 데이터 특정 행, 열 제거 (-)
data[c(-1,-2), ]            # 데이터의 1,2행 제거
data[, c(-1,-2)]            # 데이터의 1,2열 제거
data[c(-1,-2), c(-1,-2)]    # 데이터의 1행~2행, 1열~2열 제거




##### 데이터 분석

## data$age --> $ 표시를 하면 data 데이터에서 age 컬럼의 벡터만 추출.
## mean(평균), var(분산), sd(표준편차)
names(data)
age_vec <- data$age
mean(age_vec)
var(age_vec)
sd(age_vec)


## table : 벡터 내에서 데이터 값이 각각 몇 회 등장하였는지 체크
tree_vec <- data$Tree
table(tree_vec)


## median, range(최대,최소)
median(age_vec)
range(age_vec)


## quantile(사분위 수)
quantile(age_vec)


 





##### 실습
data <- read.csv('TravelMode.csv', header = TRUE)             # header 기본이 T여서 안해도 됨.
head(data)
dim(data)


## 실제 여행에 사용한 데이터로만 구성된 데이터셋 생성 (choice가 yes.)
choice <- data$choice
index <- which(choice == 'yes')
real_data <- data[index, ]              # yes로만 이루어진 행의 인덱스~ 로만 이루어진 데이터.

head(real_data)


## 필요없어진 컬럼 제거
best_data <- real_data[, c(-1,-2,-4)]
head(best_data)
str(best_data)


## mode, size는 범주형 데이터의 성격. table로 분석하기
table(best_data$mode)
table(best_data$size)                   # 1인 가정~


## 여행시, 교통수단으로 버스를 사용한 비율 구하기
mode_data <- table(best_data$mode)
mode_name <- names(mode_data)               # 교통수단 벡터화
mode_numeric <- as.numeric(mode_data)       # mode_data 의 숫자형 데이터들을 numeric으로 변환

bus_trable <- mode_numeric[which(mode_name == 'bus')]   # 연결되어있던 데이터니 인덱스 동일~^^
bus_rate <- bus_trable/ sum(mode_numeric) *100

print(bus_rate)
