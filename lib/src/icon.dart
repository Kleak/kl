class Icon {
  final String type;
  final String data;
  final String viewBox;
  final String defaultWidth;
  final String defaultHeight;

  const Icon(this.data, {this.type: 'data:image/svg+xml;,', this.viewBox, this.defaultHeight, this.defaultWidth});

  String toImage() => "$type$data";
}
