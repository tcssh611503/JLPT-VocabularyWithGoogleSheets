import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../model/dataType.dart';

/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class GetDataController {
  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycbzp0ObTN6GlXXU1RVm1jwqEwWq37d1n-j9ICXGeJ6Y1NP8Cb2g/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which loads data from endpoint URL and returns List.
  Future<List<DataList>> getDataListFu() async {
    return await http.get(URL).then((response) {
      var jsonback = convert.jsonDecode(response.body) as List;
      return jsonback.map((json) => DataList.fromJson(json)).toList();
    });
  }
}
