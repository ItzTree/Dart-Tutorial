funcDivide(var para1, var para2) {
  try {
    return para1 ~/ para2;
  } on IntegerDivisionByZeroException {
    print('IntegerDivisionByZeroException');
    return null;
  } catch (e) {
    print('Exception: $e');
    return null;
  }
}

funcGetIndexedValue(var paraList, var paraIndex) {
  try {
    return (paraList[paraIndex]);
  } catch (e) {
    print('Exception: $e');
    return null;
  }
}

funcPrintValue(var para1, var para2) {
  if (para2 != null) {
    print("#$para1 $para2");
  } else {
    print("#$para1 null");
  }
}

void main() {
  var myResult;
  var myList = [1, 2, 3];

  myResult = funcDivide(1, 1);
  funcPrintValue(1, myResult);

  myResult = funcDivide(1, 0);
  funcPrintValue(2, myResult);

  myResult = funcGetIndexedValue(myList, 0);
  funcPrintValue(3, myResult);

  myResult = funcGetIndexedValue(myList, 4);
  funcPrintValue(4, myResult);
}
