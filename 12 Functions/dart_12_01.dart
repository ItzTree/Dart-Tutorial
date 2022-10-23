calcSum(var num1, var num2) {
  var sum = num1 + num2;
  print("[calcSum()] $num1 + $num2 is $sum");
  return sum;
}

void main() {
  print("[main()] start");
  var resNum = calcSum(5, 5);
  print("[main()] result is $resNum");
}
