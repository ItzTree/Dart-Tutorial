Dart에서 제공하는 int, double, String, List 등 다양한 클래스를 사용해왔다.  
이제는 클래스를 직접 만들어서 사용해 볼 때이다. <br><br>

### 기본 구조
```dart
class Point {
  var x;
  var y;
}
```
이 클래스 안의 변수를 instance variable 또는 member variable 이라고 한다. <br><br>

```dart
var point1 = Point();
point1.y = 2;
```
함수를 호출하듯이 클래스에 () 괄호를 붙여 변수로 지정한다.  
클래스의 멤버 변수에 접근하기 위해 . 를 사용하며, point1.x 에 아무 값도 지정하지 않았기 때문에
출력한다면 null이 출력될 것이다.  
point1.y = 2 처럼 멤버 변수에 값을 직접 대입할 수 있다. <br><br>

```dart
Point point2;
```
그런데 다음과 같이 선언할 수도 있다.  
point1과 다른 점은, point1은 Point 객체가 point1에 전달이 되어 멤버 변수인 x와 y가 null값을 가지고 있고,
point2는 앞으로 Point 클래스를 다룰 것이지만 대입된 값이 없이 때문에 point2 자체가 null값을 가진다. <br><br>

### Constructor
. 연산자를 이용하여 일일이 값을 설정해주는 것이 아니라 인스턴스를 선언함과 동시에 값을 지정해주는 방법으로
Constructor를 사용할 수 있다. <br><br>

```dart
class Point {
  var x;
  var y;

  Point(var numX, var numY) {
    this.x = numX;
    this.y = numY;
  }
}
```
클래스 안에 클래스 이름과 같은 메소드를 선언하여 인스턴스를 선언할 때 멤버 변수의 값도 설정하게끔 해주었다.  
this. 를 이용하여 메소드에서 멤버 변수에 접근할 수 있다. 그런데, this.를 생략해도 잘 동작하긴 한다. <br><br>

그런데 이제 인스턴스를 선언할 때 Point() 로 값을 지정해주지 않은 채로 변수를 만들 수 없다.  
값을 지정해주지 않았을 경우, default 값으로 초기화하도록 하는 방법이 따로 있다.  
```dart
Point([var numX = 0, var numY = 0]) {
  this.x = numX;
  this.y = numY;
}
```
<br><br>
Constuctor는 여러 개 존재할 수 있지만 클래스의 이름과 동일한 constructor는 복수로 존재할 수 없다.  
클래스의 이름에 추가적인 식별자를 더해 constructor를 선언할 수 있다.
```dart
class Point {
  var x;
  var y;

  Point([var numX = 0, var numY = 0]) {
    this.x = numX;
    this.y = numY;
  }

  Point.fromPoint(Point origin) {
    this.x = origin.x;
    this.y = origin.y + 2;
  }
}

void main() {
  var point1 = Point(3);
  // point1.x = 3, point1.y = 0
  var point2 = Point.fromPoint(point1);
  // point2.x = 3, point.y = 2
}
```
<br><br>

### runtimeType Property
변수에 .runtimeType 을 붙여 해당 변수의 자료형을 알 수 있다. <br><br>

### Instance Variables and Methods
```dart
num distanceTo(Point other) {
  var dx = this.x - other.x;
  var dy = this.y - other.y;
  return (dx * dx + dy * dy);
}
```
<br><br>

### Getters and Setters
Getter와 Setter는 메소드의 일종으로, 객체의 property를 읽거나 쓰기 위해 사용한다.  
객체의 멤버 데이터를 직접 읽고 쓰기 보다는 간접적으로 Getter와 Setter를 통해 접근한다.  
또, 클래스 안에서 **\_을 붙여 변수를 선언하게 되면 private 변수**가 되어 외부 파일에서 접근이 불가한데,
getter와 setter를 이용해주면 외부에서 접근할 수 있다. <br><br>

#### Getter
```dart
String get stringify => "(${this.x}, ${this.y})";
```
객체의 x, y 좌표를 "(x, y)" 문자열의 형태로 리턴한다.  
형태는 anonymous 함수와 유사하지만 매개변수를 표현하는 () 괄호가 없다는 점이 다르다.
#### Setter
```dart
set increaseX(num value) => this.x += value;

main() { point1.increaseX = 2; }
```
선언은 anonymous 함수와 유사한 형태로 하지만, 사용은 대입 형식으로 한다.  
매개변수로는 단 한 개만 들어온다. <br><br>

### Subclassing
Subclassing은 특정 Class에 추가로 데이터와 기능을 넣어서 확장하는 개념이다.  
기반이 되는 Bass Class에 추가적인 기능을 넣어 확장(extends)하여 새로운 클래스인 Subclass를 만든다.  
Java에서는 Inheritance(상속)라고 하기도 한다. <br><br>

```dart
class ColorPoint extends Point { ... }
```
extends를 통해 Point의 모든 데이터와 메소드가 ColorPoint에 포함된다. <br><br>

```dart
class ColorPoint extends Point {
  var red;
  var green;
  var blue;

  ColorPoint([int r = 0, int g = 0, int b = 0, int x = 0, int y = 0])
      : super(x, y) {
    this.red = r;
    this.green = g;
    this.blue = b;
  }
}
```
Constructor를 이용하여 subclass의 색상 3가지와 super class의 좌표 2가지를 지정할 수 있도록 했다.  
그리고 : super(x, y)로 super class의 constructor를 호출했고, 이는 Point(x, y)와 같다. <br><br>

```dart
String get stringify => "${super.stringify} with (${this.red}, ${this.green}, ${this.red})";
```
다음과 같이 super를 이용할 수도 있다. <br><br>

### Overriding Members
Override는 subclass에서 super class의 메소드, getter, setter을 같은 이름, 같은 타입으로 함수를 만드는 것을 의미한다.   
subclass에서 함수가 override 하고 있음을 명시하기 위해 @override를 해당 함수 윗 줄에 작성한다.  
Dart에서는 +, - 등과 같은 표준 연산자도 Overriding 할 수 있다.
```dart
ColorPoint operator +(ColorPoint p) => ColorPoint(255, 255, 255, this.x + p.x, this.y + p.y);

main() { var cPoint3 = cPoint1 + cPoint2; }
```
