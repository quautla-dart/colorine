part of colorine;

class LabColor extends Color {
  final num l;
  final num a;
  final num b;

  const LabColor(this.l, this.a, this.b);

  RgbColor toRgbColor() => this.toXyzColor().toRgbColor();
  XyzColor toXyzColor() {
    Map<String, num> xyz = {'x': a / 500 + (l + 16) / 116, 'y': (l + 16) / 116, 'z': (l + 16) / 116 - b / 200};

    xyz.forEach((key, value) {
      num cube = pow(value, 3);
      if (cube > 0.008856) {
        xyz[key] = cube;
      } else {
        xyz[key] = (value - 16 / 116) / 7.787;
      }
      xyz[key] *= XyzColor.referenceWhite.toMap()[key];
    });

    return XyzColor(xyz['x'], xyz['y'], xyz['z']);
  }
  LabColor toLabColor() => this;

  String toString() => "l: $l, a: $a, b: $b";
  Map<String, num> toMap() => {'l': l, 'a': a, 'b': b};
}