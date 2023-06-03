extension StringExtensions on String {
  String trimLower() => trim().toLowerCase();
  String inCaps() => '${this[0].toUpperCase()}${substring(1)}';
  String allInCaps() => toUpperCase();

  String httpsLower() {
    var regex = RegExp(r"^(https?)(.+)", caseSensitive: false);
    var matches = regex.allMatches(this);
    var data = matches.first;
    if ((data.groupCount) >= 2) {
      var text = data.group(1)!.toLowerCase() + data.group(2)!;
      return text;
    }
    return this;
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
