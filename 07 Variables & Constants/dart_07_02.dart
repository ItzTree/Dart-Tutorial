void main() {
  var myInt = 1;
  var myDouble = 1.0;
  var myString = "Dr.Sungwon";
  // 저장되는 변수의 타입을 지정하지 않고 싶으면 var 이용
  // var을 이용하여 변수를 선언하면 자동으로 타입 배정됨

  myInt = 2.0;
  // int형 변수에 실수 대입 불가
  myDouble = 4;
  // double형 변수에 정수 대입 가능
  myString = 1;
  // 문자열 변수에 실수 및 정수 대입 불가

  print("$myInt $myDouble $myString");
}
