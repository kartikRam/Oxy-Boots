import 'package:flutter/material.dart';

class ShoeSearchPage extends StatelessWidget {
  final List<String> shoeTypes = [
    'Nike Air Max Shoes',
    'Nike Jordan Shoes',
    'Nike Air Force Shoes',
    'Nike Club Max Shoes',
    'Sneakers Nike Shoes',
    'Regular Shoes',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Your Shoes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: ShoeSearchDelegate(shoeTypes));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: shoeTypes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(shoeTypes[index]),
          );
        },
      ),
    );
  }
}

class ShoeSearchDelegate extends SearchDelegate<String> {
  final List<String> shoeTypes;

  ShoeSearchDelegate(this.shoeTypes);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        // close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show some result based on the selection.
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? shoeTypes
        : shoeTypes.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]),
          onTap: () {
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}