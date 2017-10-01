library kl.exception;

class KlException implements Exception {
  final String message;

  const KlException([this.message]);
}

class KlTypeValueException extends KlException {
  final value;
  final String target;
  final List<Type> availableTypes;

  KlTypeValueException(this.value, this.target, this.availableTypes)
      : super("Value of type ${value
          .runtimeType} for '$target' is not supported, please use a value of type: ${availableTypes
          .join(", ")}");
}
