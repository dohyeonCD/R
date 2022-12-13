##### R 자료구조

## 벡터(Vector): 1차원, 단일형(데이터 타입이 동일한 값들의 모음), 가장 기본적인 데이터 자료구조     c()로 생성. vector('데이터타입', lenth = 벡터 크기)로 틀 형성
c(1,2,3)


class(c(1,2,3))                  # 벡터의 데이터 타입은?. 입력하는 모든 값은 벡터.(크기가 1인)
class(c('a','b','c'))
class(c(T,T,F))


# 벡터에 서로 다른 데이터 타입을 넣는다면?   -> 자동으로 형변환이 일어남. 하나로 통일시킴.       자동 형변환 우선 순위: Character > Numeric > Logical (True는 1, False는 0)
c(1.7,'a')
c(2,F)                           
c('a',T)




## 행렬(Matrix): 2차원, 단일형.  행과 열로 구성.                                                   matrix(vector, nrow_행 크기, ncol_열 크기)로 생성.                                             vector값 사용함(vector값으로 열을 먼저 채움. byrow=T 지정하면 행 먼저 채움.)
matrix(nrow = 2, ncol = 3)


class(matrix(nrow = 2, ncol = 3))     # 행렬의 데이터타입은 matrix로 따로 갖고 있음.                                                    matrix는 dim 크기가 2인 array




## 배열(Array): N차원, 단일형. dim 속성 크기가 2이상인 자료구조.                                   array()로 생성. vector값 사용함.




## 리스트(List): 1차원, 다중형. 현실에서 흔하게 존재하는 데이터 구조.                              list()로 생성.
list(c(1,2,3),2,T)
list(list(1,T,'a'),1)
list(matrix(nrow = 2, ncol = 3),'a',5)




## 데이터프레임: 2차원, 다중형. 행과 열로 구성(각 행은 서로 다른 형식~ list 취급, 열은 vector~)     data.frame(vector1, vector2 ...)로 생성. vector는 열값으로 삽입됨.                             변수 따로 지정해서 vector 대신 변수 이름으로 사용 가능(컬럼 이름으로 들어감)








##### 실습 (변수에 공백 X, '' 따옴표 쓰지 말기.)

## 열값으로 들어갈 벡터 생성-> 변수 지정
나이 <- c(30, 33, 35, 30, 68, 33)                                                   
직업 <- c("무직", "서비스", "관리직", "관리직", "은퇴", "관리직")                
결혼 <- c("결혼", "결혼", "미혼", "결혼", "사별", "결혼")                  
은행잔고 <- c(1787, 4789, 1350, 1476, 4189, 3935)                               
상담매체 <- c("휴대폰", "휴대폰", "휴대폰", "Unknown", "유선전화", "휴대폰")
대출신청_유무 <- c(F, F, F, F, T, T)                                                       

## 데이터프레임 생성
df_bank <- data.frame(나이, 직업, 결혼, 은행잔고, 상담매체, 대출신청_유무)
print(df_bank)


## 각 컬럼 별 데이터 타입은?                            str(df_bank) 한꺼번에 확인할 수도 있음.
class(나이)
class(직업)
class(결혼)
class(은행잔고)
class(상담매체)
class(대출신청_유무)


## 각 컬럼 별 데이터가 범주형인지 수치형인지 설명.                                                수치, 범주, 범주, 수치, 범주, 범주


## 직접 데이터프레임 생성하기
age <- c(30, 33, 35, 30, 68, 33)
job <- c('무직', '서비스', '관리직', '관리직', '은퇴', '관리직')
marital <- c('결혼', '결혼', '미혼', '결혼', '사별', '결혼')
balance <- c(1787, 4789, 1350, 1476, 4189, 3935)
campaign <- c('휴대폰', '휴대폰', '휴대폰', 'Unknown', '유선전화', '휴대폰')
y <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE)

df_result <- data.frame(age, job, marital, balance, campaign, y)
print(df_result)
