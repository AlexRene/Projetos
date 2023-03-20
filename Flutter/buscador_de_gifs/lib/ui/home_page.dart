import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//Url para a requisição dos  melhores gifs da API
var url =
    "https://api.giphy.com/v1/gifs/trending?api_key=GolGA09g7qi1yyfx6GBkwFuPJ3xMsQQ4&limit=20&rating=g";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _search;
  final int _offset = 0;

  Future<Map> _getGifs() async {
    http.Response response;

    //Requisição dos melhores gifs do momento se for null
    if (_search != null) {
      //Fazendo uma requisição para a API retornar os gifs
      response = await http.get(Uri.parse(url));
    } else {
      //Retornando url para a busca dos gifs no aplicativo
      response = await http.get(Uri.parse(
          "https://api.giphy.com/v1/gifs/search?api_key=GolGA09g7qi1yyfx6GBkwFuPJ3xMsQQ4&q=$_search&limit=20&offset=$_offset&rating=g&lang=en"));

      //Retorna um json com os dados
      return json.decode(response.body);
    }

    @override
    void initState() {
      super.initState();

      _getGifs().then((map) {
        print(map);
      });
    }

    throw '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            'https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Pesquise Aqui!",
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getGifs(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5.0,
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      return Container();
                    } else {
                      return _createGifTable(context, snapshot);
                    }
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _createGifTable(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: snapshot.data["data"].length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Image.network(
              snapshot.data["data"][index]["images"]["fixed_height"]["url"],
              height: 300.0,
              fit: BoxFit.cover,
            ), //Caminho para o gif
          );
        });
  }
}
