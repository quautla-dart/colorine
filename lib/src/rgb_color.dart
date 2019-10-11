part of colorine;

class RgbColor extends Color {
  final num r;
  final num g;
  final num b;

  const RgbColor(this.r, this.g, this.b);

  RgbColor toRgbColor() => this;
  XyzColor toXyzColor() {
    Map<String, num> rgb = {'r': r / 255, 'g': g / 255, 'b': b / 255};

    rgb.forEach((key, value) {
      if (value > 0.04045) {
        rgb[key] = pow((value + 0.055) / 1.055, 2.4);
      } else {
        rgb[key] = value / 12.92;
      }
      rgb[key] *= 100;
    });

    num x = rgb['r'] * 0.4124 + rgb['g'] * 0.3576 + rgb['b'] * 0.1805;
    num y = rgb['r'] * 0.2126 + rgb['g'] * 0.7152 + rgb['b'] * 0.0722;
    num z = rgb['r'] * 0.0193 + rgb['g'] * 0.1192 + rgb['b'] * 0.9505;

    return XyzColor(x, y, z);
  }
  LabColor toLabColor() => this.toXyzColor().toLabColor();
  
  Map<String, num> toMap() => {'r': r, 'g': g, 'b': b};
  String toString() => "r: $r, g: $g, b: $b";
}