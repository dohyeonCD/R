airline <- c("아시아나항공", "에어부산", "에어프레미아", "에어서울", "제주항공", "진에어", "대한항공", "티웨이항공")
flight <- c(1575, 481, 124, 354, 1197, 793, 1670, 859)
passenger <- c(249792, 90985, 29238, 71213, 203335, 133253, 250895, 146497)
freight <- c(3097.9, 516.7, 111.1, 273.1, 847.1, 763.2, 5406.1, 597.6)


airport <- data.frame('항공사 명'=airline, '운항(편)'=flight, '탑승객(수)'=passenger, '화물(톤)'=freight)

print(airport)


## 각 변수를 리턴하는 함수 추가.
get_airline <- function(){return(airline)}
get_flight <- function(){return(flight)}
get_passenger <- function(){return(passenger)}
get_freight <- function(){return(freight)}


get_airline()
get_flight()
get_passenger()
get_freight()




## 운항이 평균 실적보다 높은 항공사들을 벡터 형태로 출력하는 함수.
# 연산자 사용
upperAgvAirline <- function(){
  index <- flight > mean(flight)                  # c(T F F F T F T F)
  result <- airline[index]
  return(result)  
}



# 조건문 사용
upperAgvAirline1 <- function(){
  index <- which(flight > mean(flight))           # c(1,5,7)
  result <- airline[index]
return(result)  
}



# 반복문 사용
upperAgvAirline2 <- function() {
  upperAir <- c()                                                 # 함수 안에 지정해야 함.
  i <- 1
  while (i <= length(flight)) {
    if (flight[i] > mean(flight)) {
      upperAir <- c(upperAir, airline[i])
    }
    i <- i+1 
  }
  return(upperAir)
}