import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.network(
              'https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif'),
          centerTitle: true,
        ),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelText: "Pesquise os gifs:",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder()),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: searchForGiphys("the office"),
                builder: (context, snapshot) {
                  // aqui irei trtabalhar a tabela e o loading
                  return Container();
                }),
          )
        ]));
  }
}

// Montar esquema
// Giphy Api

Future searchForGiphys(String search) async {
  var token = "Nfz17W8gGYKn0EPV8TRjEFXnOplwIYc4";
  var endpoint = Uri.parse(
      "https://api.giphy.com/v1/gifs/search?api_key=$token&q=$search");
  var client = http.Client();

  try {
    var response = await client.get(endpoint);

    print("foi");
    print(response);
  } catch (e) {
    print("Ocorreu um erro");
  }
}
