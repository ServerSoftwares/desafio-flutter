extension StringExtension on String {
  String capitalize() =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';

  String formatAsDouble(int precision) {
    final value = double.parse(this);
    return value.toStringAsFixed(precision);
  }
}
