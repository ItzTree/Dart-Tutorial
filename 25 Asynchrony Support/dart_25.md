프로그램을 동작시키다 보면 대량의 데이터를 일고 처리하는 등 시간이 많이 소요되는 작업이 있다.  
Dart 언어의 Async 기능은 이런 시간이 많이 걸리는 작업이 완료될 때까지 기다리지 않고
바로 다음 동작을 이어 나갈 수 있도록 한다. <br><br>

#### dart_25_01.dart
```
* main end
|
| * takeTime end
| |
| | * heavyLoadFunction end
| | |
| | * heavyLoadFunction start
| |/
| * takeTime start
|/
* main start
```
main에서 takeTime을 호출할 때, 결과가 리턴될 때까지 기다리고, 
takeTime에서 heavyLoadFunction을 호출할 때에도 마찬가지로 결과가 리턴될 때까지 기다려준다. <br><br>

#### dart_25_02.dart
```
  * takeTime end
  |
* | main end
| |
| | * heavyLoadFunction end
| | |
| | * heavyLoadFunction start
| |/
| * takeTime start
|/
* main start
```
main은 takeTime을 호출했고, takeTime은 heavyLoadFunction을 호출할 때, 결과가 리턴될 때까지 기다린다고 했지만
main은 기다리지 않는다고 했으므로 heavyLoadFunction이 끝나고 main이 끝나게 된다. <br><br>

#### dart_25_03.dart
```
* main end
|
| * takeTime end
| |
| | * heavyLoadFunction2 end
| | |
| | * heavyLoadFunction2 start
| |/
| | * heavyLoadFunction1 end
| | |
| | * heavyLoadFunction1 start
| |/
| * takeTime start
|/
* main start
```
takeTime 함수 안에 await이 2개가 있으면 첫 번째 await 구문을 완료하고 두 번째 await 구문을 실행하게 되며, 
두 await이 모두 끝나고 나서야 그 값이 리턴된다. <br><br>

#### dart_25_04.dart
```
      * takeTimeB end
      |
  *   | takeTimeA end
  |   |
  |   | * heavyLoadFunction4 end
  |   | |
  |   | * heavyLoadFunction4 start
  |   |/
* |   | heavyLoadFunction2 end
| |   |
* |   | heavyLoadFunction2 start
 \|   |
  | * | main end
  | | |
  | | | * heavyLoadFunction3 end
  | | | |
  | | | * heavyLoadFunction3 start
  | | |/
  | | * takeTimeB start
  | |/
* | | heavyLoadFunction1 end
| | |
* | | heavyLoadFunction1 start
 \| |
  * | takeTimeA start
   \|
    * main start
```
main을 시작하고 takeTimeA를 실행했는데 heavyLoadFunction1과 2가 모두 마쳐지기 전에 takeTimeB도 시작하는 것을
볼 수 있다. 즉 takeTimeA와 takeTimeB가 동시에 동작하는 시간이 존재함을 볼 수 있다. <br><br>

#### dart_25_05.dart
```
* main end
|
| * takeTimeB end
| |
| | * heavyLoadFunction4 end
| | |
| | * heavyLoadFunction4 start
| |/
| | * heavyLoadFunction3 end
| | |
| | * heavyLoadFunction3 start
| |/
| * takeTimeB start
|/
| * takeTimeA end
| |
| | * heavyLoadFunction2 end
| | |
| | * heavyLoadFunction2 start
| |/
| | * heavyLoadFunction1 end
| | |
| | * heavyLoadFunction1 start
| |/
| * takeTimeA start
|/
* main start
```
main 함수에 await을 넣어줌으로써 takeTimeA가 다 끝나고 takeTimeB를 실행하도록 해주었다.
