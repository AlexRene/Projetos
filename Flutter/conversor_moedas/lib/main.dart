import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'home.dart';

const request =
    "https://api.hgbrasil.com/finance?key=58059029"; //Retorna todos os dados em uma unica requisicao

void main() async {
  runApp(MaterialApp(
    home: const Home(),
    theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.white),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(Uri.parse(request));
  return json.decode(response.body);
}
