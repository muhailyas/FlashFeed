extension StringExtension on String {
  String capitalizeFirstLetter() {
    return replaceFirst(this[0], this[0].toUpperCase());
  }
}
