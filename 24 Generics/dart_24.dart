class Point<T> {
  T x;
  T y;
  Point(T xCord, T yCord)
      : x = xCord,
        y = yCord {}
}

void main() {
  Point<int> iPoint = Point<int>(10, 10);
  Point<double> dPoint = Point<double>(10.0, 10.0);
  Point<String> sPoint = Point<String>("ten", "ten");

  print("${iPoint.x}, ${iPoint.y}");
  print("${dPoint.x}, ${dPoint.y}");
  print("${sPoint.x}, ${sPoint.y}");
}
