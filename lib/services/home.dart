import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpood_practic/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RestApi Flutetr"),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            //final color = user.gender == "male" ? Colors.blue : Colors.pink;
            return ListTile(
              title: Text(user.name.first),
              subtitle: Text(user.phone),
              //tileColor: color,
            );
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: fetchUsers, child: const Icon(Icons.add)),
    );
  }

  void fetchUsers() async {
    print("fetshUsers called");
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json["results"] as List<dynamic>;
    final transformed = results.map((e) {
      final name = UserName(
        title: e["name"]["title"],
        first: e["name"]["first"],
        last: e["name"]["last"],
      );
      return User(
        cell: e["cell"],
        email: e["email"],
        phone: e["phone"],
        gender: e["gender"],
        nat: e["nat"],
        name: name,
      );
    }).toList();
    setState(() {
      users = transformed;
    });
    print("fetshUsers completed");
  }
}
