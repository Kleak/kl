class KlColor {
  final int red;
  final int green;
  final int blue;
  final num alpha;

  const KlColor(int value)
      : red = (0xFF000000 & value) >> 24,
        green = (0x00FF0000 & value) >> 16,
        blue = (0x0000FF00 & value) >> 8,
        alpha = (0x000000FF & value) / 255;

  const KlColor.fromRGBA(this.red, this.green, this.blue, this.alpha);

  const KlColor.fromRGB(int red, int green, int blue)
      : red = red,
        green = green,
        blue = blue,
        alpha = 1;

  String toStyle() => 'rgba($red, $green, $blue, $alpha)';
}
