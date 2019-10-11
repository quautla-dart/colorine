library colorine;

import 'dart:math';

part 'src/rgb_color.dart';
part 'src/xyz_color.dart';
part 'src/lab_color.dart';

abstract class Color {
  const Color();
  const factory Color.rgb(num r, num g, num b) = RgbColor;
  const factory Color.xyz(num x, num y, num z) = XyzColor;
  const factory Color.lab(num l, num a, num b) = LabColor;

  RgbColor toRgbColor();
  XyzColor toXyzColor();
  LabColor toLabColor();

  String toString();
  Map<String, num> toMap();
}