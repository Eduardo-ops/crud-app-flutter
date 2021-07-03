import 'package:cadastro_usuario/components/user_details.dart';
import 'package:cadastro_usuario/provider/users.dart';
import 'package:cadastro_usuario/routes/app_routes.dart';
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
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
                /* users.createUser(
                    User(name: 'teste', email: 'teste@hotmail.com', photo: '')); */
                /* users.updateUser(
                    User(id: '1', name: 'teste', email: 'teste@', photo: '')); */
                /* users.removeUser(users.byIndex(0)); */
              })
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ct, i) => UserDetails(users.all.elementAt(i)),
      ),
    );
  }
}
