void main() {
  // 16진수 형태
  var num1 = 0x0F;
  // print 15
  print("$num1");

  // 지수 형태
  var num2 = 1.1e2;
  // print 110.0
  print("$num2");

  // String -> int
  var num3 = int.parse('1');
  // print 1
  print("$num3");

  // String -> double
  var num4 = double.parse('1.1');
  // print 1.1
  print("$num4");
}
