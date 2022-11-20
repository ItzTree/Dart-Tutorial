import 'dart:io';

void main() {
  stdout.write("A");
  stdout.write("B");
  stdout.write("\n");

  stdout.writeln("A");
  stdout.writeln("B");
  stdout.write("\n");

  List myList = ["A", "B", "C"];
  stdout.writeAll(myList, ":");
  stdout.write("\n");

  for (String? myInput = ""; myInput != "exit";) {
    stdout.write('type\$ ');
    myInput = stdin.readLineSync();
    stdout.writeln('----> $myInput');
  }
}
