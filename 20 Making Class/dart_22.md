### ?. Operator
```dart
p?.y = 4;
```
클래스 p가 null이 아니라면 p.y에 4라는 값을 저장한다는 것을 의미한다.  
이를 통해 Point p; 로만 선언되어 null 상태인 클래스에 실수로 접근하는 에러를 줄여 준다. <br><br>

### Initialization List
Constructor의 표현을 좀 더 쉽게하는 방법으로, 기존에는 다음과 같은 코드로 constructor를 구성했었다.
```dart
Point([var numX = 0, var numY = 0]) {
  this.x = numX;
  this.y = numY;
}
```
<br>
그런데 이런 경우 굳이 메소드의 본문을 채우지 않고도 constructor를 선언할 수 있다.
```dart
Point([var numX = 0, var numY = 0])
    : this.x = numX,
      this.y = numY {}
```
<br>
이렇게 멤버 변수에 바로 대응이 되는 파라미터만 입력받는다면, 더 간단하게 나타낼 수 있다.
```dart
Point([this.x = 0, this.y = 0]) {}
```
<br>

### Factory Constructor
```dart
class Logger {
  final String name;
  bool mute = false;

  static final Map _cache = {};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }

  static get cacheLength => _cache.length;
}
```
Factory constructor는 constructor가 매번 새로운 객체를 만드는 것과는 다르게, 
새로운 인스턴스를 생성하고 싶지 않을 때 사용하는 생성자이다. <br><br>

우선 \_cache를 보면, static 변수로 클래스에서 만들어지는 객체와 상관없이 존재한다. 
이로서, Logger 클래스는 매번 인스턴스가 만들어지지 않게 하고, 
만들어진 객체를 static으로 처리하여 관리한다. <br><br>

factory constructor 내 putIfAbsent 구문을 보면, 
\_cache가 비어 있을때에만, constructor로 받은 이름과 객체를 \_cache에 저장한다.  
즉, 한 번만 객체가 만들어지는 것을 유추할 수 있다. <br><br>

### Enumerated Types
```dart
enum Color { red, green, blue }
```
단어를 사용해 순서를 나타내거나 제한된 갓을 가지는 문제를 좀 더 용이하게 개발하도록 하는 문법이다.  
