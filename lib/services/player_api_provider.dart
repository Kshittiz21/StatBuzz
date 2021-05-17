import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:statbuzz/models/api_models.dart';

class PlayerApiProvider {

  String baseUrl = "https://www.easports.com/fifa/ultimate-team/api/fut/item?";
  final successCode = 200;
  Future<List<Players>> fetchPlayersByCountry(String countryId) async {
    final Uri url = Uri.parse("${baseUrl}countryId=$countryId");
    //final Uri url = Uri.parse(baseUrl + "countryId=" + countryId);
    final response = await http.get(url);

    final responseString = jsonDecode(response.body);

    if (response.statusCode == successCode) {
      return ApiResult.fromJson(responseString).items;
    } else {
      throw Exception('Falied to load players');
    }
  }
}
