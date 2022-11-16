### Conditional Expression (삼중 연산자)
```dart
condition ? expr1 : expr2
```
condition이 참이면 expr1을, 거짓이면 expr2를 실행한다. <br><br>

### Bitwise Operators (비트 연산자)
N << M 은 N을 M만큼 왼쪽으로 비트 이동  
N >> M 은 N을 M만큼 오른쪽으로 비트 이동  
OR : N | M 은 각 비트에서 둘 중 하나라도 1이면 1, 둘 다 0이면 0  
AND : N & M 은 각 비트에서 둘 다 1이면 1, 둘 중 하나라도 0이면 0 <br><br>

### NaN & Infinity Constant
a = 0 / 0 으로 선언하면 의미가 없어 a의 값이 NaN이 된다.  
a = 1 / 0 으로 선언하면 무한대에 가까워 지기 때문에 a의 값이 Infinity가 된다.  
이를 검사하는 프로퍼티로는 isNaN, isInfinite, isFinite가 있다. <br><br>

### Unicode Presentation
유니코드를 표현하기 위해서는 문자열 앞에 \\u 를 추가해줘야 한다.  
경우에 따라서 \\u{1f600} 처럼 { }를 사용해야 한다. <br><br>

### Cascade Operator
클래스의 메소드를 수행할 때, 연쇄적으로 메소드를 실행할 수 있다.  
A.method1().method2() 는 A 객체의 멤버 메소드인 method1을 먼저 실행시키고, 
이 결과값이 정수라고 하면 정수의 멤버 메소드인 method2를 실행하라는 것을 의미한다. 
<br><br>
그런데 A의 method1을 실행하고 이어서 A의 method2를 실행하고 싶을 때가 있을 것이다.  
그럴때는 .. 문법을 이용할 수 있다.
```dart
myList
  ..add("Go")
  ..addAll(["C++", "Dart", "Python"]);
```
<br>

### forEach Function
forEach()는 List, Set 등과 같이 여러 데이터를 저장하는 자료형의 메소드이다. 
```dart
void printGood(dynamic item) {
  print(item + " Good");
}

void main() {
  List myList = ["A", "B", "C"];
  myList.forEach(printGood);
  
  myList.forEach((item) {
    print(item + " Nice");
  });
}
```
매개변수로 함수 이름을 줄 수도, annonymous 함수를 줄 수도 있다. <br><br>

### Nested Function
함수 안에서 함수를 만들 수 있다.  
아래는 간단한 예제이다.  
```dart
double circleArea(double radius) {
  double square(double r) {
    return r * r;
  }
  return 3.14 * square(radius);
}
```
<br>

### Default Return Value (null)
return 값이 없는 함수라면 Dart 언어는 자동으로 return null; 을 추가한다. <br><br>

### Operator Precedence
연산자 우선순위가 있다. <br><br>

### Assignment Operators
a = a + 1 을 간단하게 a += 1 로 줄여 쓸 수 있다.  
a ??= 1 은 a가 null 인 경우에 1을 저장하는 것을 의미힌다. <br><br>

### Not Operators
bool 자료형 a가 true라면 !a는 false가 된다.  
비트 차원에서 not 연산을 하려면 '~'를 사용하면 된다. <br><br>
