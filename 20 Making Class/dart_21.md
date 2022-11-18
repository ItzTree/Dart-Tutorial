클래스는 아래 코드를 기준으로 진행하도록 하겠다.
```dart
import 'dart:math';

class Point {
  var x;
  var y;

  Point([var numX = 0, var numY = 0]) {
    this.x = numX;
    this.y = numY;
  }

  Point.fromPoint(Point origin) {
    this.x = origin.x;
    this.y = origin.y;
  }

  num distanceTo(Point other) {
    var dx = this.x - other.y;
    var dy = this.y - other.y;
    return sqrt(dx * dx + dy * dy);
  }

  String get stringify => "(${this.x},${this.y})";

  set increaseX(num value) => this.x += value;
  set increaseY(num value) => this.y += value;
}

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

  @override
  String get stringify =>
      "${super.stringify} with (${this.red},${this.green},${this.red})";

  @override
  ColorPoint operator +(ColorPoint p) =>
      ColorPoint(255, 255, 255, this.x + p.x, this.y + p.y);
}

```
위 코드를 class_point.dart 라는 파일로 저장하고 import 하여 사용하면 보다 깔끔한 화면을 볼 수 있다.  
<br>

### Mixins for Multiple Inheritance (with Syntax)
Dart는 subclass의 super class를 하나로 제한하는데, 여러 class를 subclass로 두고 싶을 때가 있을 것이다.  
이를 위해 mixins 기능과 with 문법을 사용할 수 있다. <br><br>

class를 생성하는 것과 같이 class 대신 mixin으로 선언하면 된다.
```dart
mixin ActivationFlag {
  bool flag = true;

  bool get flagActivated => this.flag;
  set flagActivated(bool givenFlag) => (this.flag = givenFlag);
}
```
<br>

with 문법은 다음과 같이 사용할 수 있다.
```dart
class ColorPointDrawer extends ColorPoint with ActivationFlag { ... }
```
<br>

ActivationFlag가 ColorPointDrawer에만 독점적으로 사용되게 하려면 on 을 사용하면 된다.
```dart
mixin ActivationFlag on ColorPointDrawer { ... }
```
<br>

### Implicit Interfaces (implements Syntax)
```dart
class Person {
  var _name;
  String id() => '${_name}';

  Person(this._name);
}

class Student implements Person {
  var _name;
  String id() => '${_name}:${_studentNumber}';

  var _studentNumber;
  Student(this._name, this._studentNumber);
}

class Professor implements Person {
  var _name;
  String id() => '${_name}:${_professorNumber}';

  var _professorNumber;
  Professor(this._name, this._professorNumber);
}

String getID(Person person) => person.id();

void main() {
  print(getID(Person("Person")));
  print(getID(Student("Student", "#01")));
  print(getID(Professor("Professor", "#0A")));
}
```
Implements를 사용하는 경우는 클래스의 멤버변수, 함수, 생성자 등의 구현이 필수적이다.  
Implements를 하고자 하는 클래스의 모든 변수와 함수를 구현해주어야 한다.  
기존의 변수 이름, 함수 이름 등은 같아야 하고 내용은 달랴져도 된다. <br><br>

### Abstract Methods and Classes
위의 implements를 이용한 코드를 보면 Person이라는 클래스의 객체가 제공했던 String id() 함수가 
Student와 Professor에서도 사용되어 존재할 필요가 있지만, Person에서는 사용할 일이 있을 지 의아해 질 수 있다.  
Person 클래스의 존재 이유는 String id() 함수라는 틀이지, 내용은 중요하지 않다. 그래서 멤버 변수인 \_name도
선언할 필요가 없고, 이로 인해 id() 함수의 구체적인 기능이 정해질 필요도 없다.  
그래서 실제 데이터와 기능이 없는 클래스로 abstract 클래스를 선언할 수 있다.  
이 abstract 클래스는 implements가 아니라 extends하는 방식으로도 사용할 수 있다. 
```dart
abstract class Person {
  String id();
}

class Student implements Person {
  var _name;
  String id() => '${_name}:${_studentNumber}';

  var _studentNumber;
  Student(this._name, this._studentNumber);
}

class Professor extends Person {
  var _name;
  String id() => '${_name}:${_professorNumber}';

  var _professorNumber;
  Professor(this._name, this._professorNumber);
}
```
<br>

### Extension Methods
extension-on 구문으로 기존의 클래스에 메소드를 추가하는 것이 가능하다
```dart
extension NumberParsing_v1 on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }      
}
```
매개변수는 따로 지정해주지 않았지만 this를 통해 자체적으로 문장이 실행된다. <br><br>

### Class Variables and Methods (Static Syntax)
static 문법은 클래스의 멤버 변수 혹은 멤버 메소드를 선언하는 맨 앞에 사용할 수 있다.
```dart
class Point {
  static int a = 0;
  static String get func() => "";
}
```
static으로 정의된 변수는 객체에 저장되는 것이 아니라 클래스에 귀속되고, 
static 메소드도 클래스에 귀속된 정보들 만으로 객체와 상관없이 동작한다.  
반면, 객체에 귀속된 this로 접근하는 정보들은 사용할 수 없다. <br><br>

```dart
class Point {
  var x;
  var y;
  static int hash = 0;

  Point([var numX = 0, var numY = 0]) {
    this.x = numX;
    this.y = numY;
    hash++;
  }

  String get stringify => "(${this.x},${this.y}) with hash:$hash";

  static String get static_stringify => "hash:$hash";
}

void main() {
  var p1 = Point();
  print(p1.stringify);

  var p2 = Point();
  print(p2.stringify);

  var p3 = Point();
  print(p3.stringify);

  print(Point.static_stringify);
}
```
클래스의 멤버 변수로 static int hash = 0 이 선언되었다.
이 때, static은 클래스에 귀속된 변수로서 컨파일 시점에 0으로 초기화가 된다.  
p3까지 Point() 클래스로 선언해주면 static은 클래스에 귀속되었기 때문에 
p1, p2, p3의 hash 값은 모두 3이 된다.
