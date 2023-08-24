import 'package:flutter/material.dart';
import 'package:riverpood_practic/model/user.dart';
import 'package:riverpood_practic/services/user_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

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
              title: Text(user.fullName),
              subtitle: Text(user.location.city),
              //tileColor: color,
            );
          }),
    );
  }

  void fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
