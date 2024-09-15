class AppConstant {
  AppConstant._();
  // static const baseUrl = "http://192.168.1.91:8000";
  static const baseUrl = "http://192.168.100.34:8000";
}

String getFirstandLastNameInitals(String fullName) {
  if (fullName.isEmpty) {
    return 'N/A';
  }
  if (fullName.split(' ').length == 1) {
    return fullName[0];
  }
  List<String> name = fullName.split(' ');
  return name[0][0] + name[1][0];
}
