void main() {
  Object myInt = 1;
  Object myDouble = 1.0;
  dynamic myString = "Dr.Sungwon";
  dynamic temp;

  temp = myInt;
  myInt = myDouble;
  myDouble = myString;
  myString = temp;

  print("$myInt $myDouble $myString");
}
