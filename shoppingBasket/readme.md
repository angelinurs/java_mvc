# JSP 액션요소
-----------------
## - include 기능
### :: JSP 안에 댜른 기능을 포함하는 것
## - forward 기능
### :: page 이동을 하는 기능
#### :: :: forward -> 1. 기존에 받아온 parameter 값을 넘어가는 page 에서 사용 가능함.
#### :: :: forward -> 2. 기존에 요청받은 request, response object 사용
#### :: :: sendRedirect -> 1. 기존에 가져왔던 parameter 값을 넘어가는 page 에서 사용 못함. 
#### :: :: sendRedirect -> 2. request, response object 다시 생성
## - useBean 기능
## - param 기능