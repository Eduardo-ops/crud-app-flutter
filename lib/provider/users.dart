import 'dart:math';

import 'package:cadastro_usuario/data/dummy_users.dart';
import 'package:cadastro_usuario/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  final Map<String, User> _itens = {...DUMMY_USERS};

  //CREATE
  void createUser(User user) {
    if (user == null) {
      return;
    }

    final id = Random().nextDouble().toString();
    _itens.putIfAbsent(
        id,
        () => User(
            id: id, name: user.name, email: user.email, photo: user.photo));
    notifyListeners();
  }

// UPDATE
  void updateUser(User user) {
    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _itens.containsKey(user.id)) {
      _itens.update(user.id,
          (_) => User(name: user.name, email: user.email, photo: user.photo));
    }
    notifyListeners();
  }

  // FIND ALL
  List<User> get all {
    return [..._itens.values];
  }

  // GET
  int get count {
    return _itens.length;
  }

  // DELETE
  void removeUser(User user) {
    if (user != null && user.id != null) {
      _itens.remove(user.id);
    }
    notifyListeners();
  }
}
