import 'package:cadastro_usuario/data/dummy_users.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const users = {...DUMMY_USERS};

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Usuários',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (ct, i) => Text(users.values.elementAt(i).name)));
  }
}
