class Icon {
  final String type;
  final String data;

  const Icon(this.data, {this.type: 'data:image/svg+xml;,'});

  String toImage() => "$type$data";
}
