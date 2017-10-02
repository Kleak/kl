library kl.edge_insets;

class KlEdgeInsets {
  final num top;
  final num right;
  final num bottom;
  final num left;

  const KlEdgeInsets.all(num value)
      : top = value,
        right = value,
        bottom = value,
        left = value;

  const KlEdgeInsets.fromTRBL(this.top, this.right, this.bottom, this.left);

  const KlEdgeInsets.symmetric({num vertical: 0, num horizontal: 0})
      : top = vertical,
        bottom = vertical,
        right = horizontal,
        left = horizontal;

  const KlEdgeInsets.only(
      {this.top: 0, this.right: 0, this.bottom: 0, this.left: 0});

  String toStyle() => '${top}px ${right}px ${bottom}px ${left}px';
}
