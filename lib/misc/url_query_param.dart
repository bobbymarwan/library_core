
class URLQueryParams {
  final Map<String, String> _values = {};

  // Appends a parameter to the query with receiverd key.
  void append(String key, dynamic value) {
    if (value != null && value.toString().isNotEmpty) {
      _values[key] = Uri.encodeQueryComponent(value.toString());
    }
  }

  // Removes a parameter from query by key.
  void remove(String key) {
    _values.remove(key);
  }

  // Convert to query string like the next example:
  // * param1=value1&param2=value2
  @override
  String toString() {
    String response = '';
    int index = 0;
    _values.forEach((key, value) {
      response += "${index == 0 ? '?': ''}$key=$value&";
      index++;
    });
    return response.substring(
        0, response.isEmpty ? 0 : response.length - 1);
  }

  Map<String, String>? toMap(){
    Map<String, String> decodedMap = {};
    _values.forEach((key, value) {
      decodedMap[key] = decode(removePlusSign(value));
    });
    return decodedMap;
  }

  String decode(String encodedString) {
    return Uri.decodeComponent(encodedString);
  }

  String removePlusSign(String inputString) {
    return inputString.replaceAll("+", " ");
  }
}