##### 데이터 타입
class(0)        # 파이썬 type 느낌. 0이 데이터 타입인지 알 수 있음.


## Numeric(수), Integer(정수형)
class(1)
class(1L)       # numeric을 정수형 integer로 바꾸려면 대문자L을 뒤에 붙여주기.

class(1.1L)     # 얘는 애초에 integer가 될 수 없으므로 안됨.


## Logical(논리형)
class(TRUE)     
class(T)
class(True)     # true, false는 반드시 대문자로 적어야 함.


## Character(문자형)
class('1')


## Complex(복소수형). 실세계에서 별로 없음. 그냥 이런 것도 있구나~




## 특별한 데이터 객체 Inf(infinity)
1/0
1/Inf


## 특별한 데이터 객체 NA(결측값), NaN(결측값으로 처리됨. 수치값으로 표현 안되는 것.)               NA 와 NULL의 차이: NA는 값이 있어야 하는데 없는 것. NULL은 그냥 비워둔 것. 비어있는 것.
