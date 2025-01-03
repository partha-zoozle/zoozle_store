extension NullSafety<T> on T? {
  T? nullIf(bool Function(T element) onCondition) {
    if (this == null || onCondition(this!)) {
      return null;
    } else {
      return this;
    }
  }
}

double? ensureDouble(dynamic value) {
  switch (value.runtimeType) {
    case double:
      return value;
    case int:
      return value.toDouble();
    case String:
      return double.tryParse(value ?? "");
    default:
      return null;
  }
}
