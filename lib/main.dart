import 'package:cadastro_usuario/provider/users.dart';
import 'package:cadastro_usuario/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ct) => UserProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Cadastro de Usuários',
        home: UserList(),
      ),
    );
  }
}
