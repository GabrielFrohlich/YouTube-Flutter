import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, "");
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return IconButton(icon: Icon(Icons.clear), onPressed: () {});
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print("resultado: Digitado " + query);
    List<String> lista = [];

    if (query.isNotEmpty) {
      lista = ["Minecraft", "Minecraft de Férias", "PlayStations 5", "Nilce"]
          .where((texto) => texto.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    }

    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(lista[index]),
              onTap: () {
                close(context, lista[index]);
              });
        });
  }
}
