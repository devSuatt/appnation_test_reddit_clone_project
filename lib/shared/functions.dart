class Functions {
  
  String changeAmpersandChar(String text) {
    return text.replaceAll('&amp;', '&');
  }

  String removeUrlSubStrings(String text) {
    String newString = text.replaceAll(RegExp(r"(http|ftp|https)://([\w_-]+(?:(?:\.[\w_-]+)+))([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?"), "");
    newString = newString.replaceAll("[", "").replaceAll("]", "").replaceAll("()", "");
    return newString;
  }

}