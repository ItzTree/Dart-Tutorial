heavyLoadFunction1() {
  print("[heavyLoadFunction1(): started.");
  var sum = 0;
  for (var tmp = 0; tmp < 100000000; tmp++) {
    sum += tmp;
  }
  print("[heavyLoadFunction1(): completed.");
  return sum;
}

heavyLoadFunction2() {
  print("[heavyLoadFunction2(): started.");
  var sum = 0;
  for (var tmp = 0; tmp < 1000000; tmp++) {
    sum += tmp;
  }
  print("[heavyLoadFunction2(): completed.");
  return sum;
}

Future takeTime() async {
  print("[takeTime(): started.");
  var status1 = await heavyLoadFunction1();
  var status2 = await heavyLoadFunction2();
  print("[takeTime(): completed and result is $status1 $status2.");
  return status1 + status2;
}

Future main() async {
  print("[main(): started.");
  var status = await takeTime();
  print("[main(): result is $status.");
}
