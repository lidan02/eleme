import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const defaultHost = "http://192.168.1.118:7002";

Future<String> get(url)  async {
  var response = await http.get(defaultHost+url);
  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  return response.body;
}


Future<String> post(url, {body})  async {
  var response = await http.post(defaultHost+url, body: body);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  return response.body;
}