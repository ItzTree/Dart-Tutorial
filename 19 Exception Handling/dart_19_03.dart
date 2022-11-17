funcDivide(var para1, var para2) {
  try {
    if(para2 == null) {
      throw IntegerDivisionByZeroException;
    } else {
      return para1 ~/ para2;
    }
  } catch (e) {
    print('>> funcDivide:IntegerDivisionByZeroException');
    rethrow;
  } finally {
    print(':: completed...');
  }
}

funcGetIndexedValue(var paraList, var paraIndex) {
  try {
    return(paraList[paraIndex]);
  } catch (e) {
    print('>> funcGetIndexedValue: $e');
    rethrow;
  } finally {
    print(':: completed...');
  }
}

funcPrintValue(var para1, var para2) {
  print("#$para1 $para2");
}

void main() {
  var myResult;
  var myList = [1 ,2, 3];

  try {
    print('#1');
    myResult = funcDivide(1, 1); 
  } on IntegerDivisionByZeroException {
    print('>> main:IntegerDivisionByZeroException');
    myResult = null;
  } catch (e) {
    print('Exception: $e');
    myResult = null;
  }

  funcPrintValue(1, myResult);

  try {
    print('#2');
    myResult = funcDivide(1, 0); 
  } on IntegerDivisionByZeroException {
    print('>> main:IntegerDivisionByZeroException');
    myResult = null;
  } catch (e) {
    print('Exception: $e');
    myResult = null;
  }

  funcPrintValue(2, myResult);
    
  try {  
    print('#3');  
    myResult = funcGetIndexedValue(myList, 0); 
  } catch (e) {
    print('>> main: $e');
    myResult = null;
  }

  funcPrintValue(3, myResult);

  try {    
    print('#4');
    myResult = funcGetIndexedValue(myList, 4); 
  } catch (e) {
    print('>> main: $e');
    myResult = null;
  }

  funcPrintValue(4, myResult);
}
