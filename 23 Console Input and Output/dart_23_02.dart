// #0 Includes console I/O functionality into this program
import 'dart:io';

void main() {
  // #1 Local variable for user input
  var myNum = 0;

  // #2 Print usage for user
  stdout.write('Enter number between 1 to 9> ');

  // #3 Check input wether integer or not
  try {
    // #3.1 Convert string to integer
    var x = stdin.readLineSync();
    x = (x != null) ? x : "0";
    myNum = int.parse(x);
  } catch (e) {
    // #3.2 Print error message and exit the program
    stdout.writeln("error> enter integer number between 1 to 9.");
    return;
  }

  // #4 Check input wether in right range
  if ((myNum >= 1) && (myNum <= 9)) {
    // #4.1 Calculates result
    for (var tmp = 1; tmp <= 9; tmp++) {
      stdout.writeln("$myNum x $tmp = ${myNum * tmp}");
    }
  } else {
    // #4.2 Print error message
    stdout.writeln("error> enter integer number between 1 to 9.");
  }
}
