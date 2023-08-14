import 'dart:convert';

import 'package:food_recipes/data/const/api_const.dart';
import 'package:food_recipes/data/models/food_country.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri urlParse = Uri.parse("${ApiConst.baseUrl}/list.php?a=list");
  var response = await http.get(urlParse);
  List listData = jsonDecode(response.body)['meals'];

  print(listData);
}
