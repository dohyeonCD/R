##### 패키지
install.packages('maps')            # 함수로 패키지 설치.

library()                           # 패키지 설치된 거 확인.








##### 실습
age <- c(30, 33, 35, 30, 68, 33)
job <- c('무직', '서비스', '관리직', '관리직', '은퇴', '관리직')
marital <- c('결혼', '결혼', '미혼', '결혼', '사별', '결혼')
balance <- c(1787, 4789, 1350, 1476, 4189, 3935)
campaign <- c('휴대폰', '휴대폰', '휴대폰', 'Unknown', '유선전화', '휴대폰')
y <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE)

df_result <- data.frame(age, job, marital, balance, campaign, y)
print(df_result)


## 고객의 평균나이와 평균 은행 잔고를 각각 변수에 담고 출력.
age_mean <- mean(age)
balance_mean <- mean(balance)
           
print(age_mean)                        # print(age_mean, balance_mean)       같이 쓰면 오류....
print(balance_mean)


## 대출을 신청한 사람 수를 계산.
yTonum <- as.numeric(y)                # True는 1, False는 0이므로 합계를 구하면 수를 계산 O
y_count <- sum(yTonum)
print(y_count)




## 문자 데이터 수정은 stringr 패키지 함수 사용.
install.packages('stringr')           # cran 내 document 참조
library('stringr')                    # 로딩


## job 컬럼의 은퇴 값-> 무직으로 변경. marital 컬럼은 logical 값으로 관리.
print(df_result)
job_new <- str_replace(job, '은퇴', '무직')      # str_replace(string, 해당 문자, 바꿀 문자)

marital_new <- str_replace(marital, '결혼', 'T')  # 문자열은 logical로 바로 바꿀 수 없으니까..
marital_logical <- as.logical(marital_new)
marital_logical[is.na(marital_logical)] = FALSE   # NA값이 있다면, 그것을 FALSE로 바꿈.


## 새로 바꾼 컬럼들 적용~
result_new <- data.frame(age, job_new, marital_logical, balance, campaign, y)
print(result_new)
