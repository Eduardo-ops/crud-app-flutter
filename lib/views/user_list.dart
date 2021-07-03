import 'package:cadastro_usuario/components/user_details.dart';
import 'package:cadastro_usuario/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserProvider users = Provider.of(context);

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
        itemCount: users.count,
        itemBuilder: (ct, i) => UserDetails(users.all.elementAt(i)),
      ),
    );
  }
}
