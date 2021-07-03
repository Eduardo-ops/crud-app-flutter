import 'package:cadastro_usuario/components/user_details.dart';
import 'package:cadastro_usuario/data/dummy_users.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Usuários',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (ct, i) => UserDetails(users.values.elementAt(i)),
      ),
    );
  }
}
