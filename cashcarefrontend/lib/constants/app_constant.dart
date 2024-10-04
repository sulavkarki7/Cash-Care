class AppConstant {
  AppConstant._();
  // static const baseUrl = "http://192.168.1.91:8000";
  static const baseUrl = "http://192.168.100.34:8000";
}

String getFirstandLastNameInitals(String fullName) {
  if (fullName.isEmpty) {
    return "?";
  }

  List<String> nameParts = fullName.split(" ");
  String initials = nameParts[0][0];

  if (nameParts.length > 1) {
    initials += nameParts[1][0];
  }

  return initials;
}
