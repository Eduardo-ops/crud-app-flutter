import 'package:cadastro_usuario/data/dummy_users.dart';
import 'package:cadastro_usuario/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final Map<String, User> _itens = {...DUMMY_USERS};

  // FIND ALL
  List<User> get all {
    return [..._itens.values];
  }

  // GET
  int get count {
    return _itens.length;
  }
}
