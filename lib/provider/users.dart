import 'dart:convert';

import 'package:cadastro_usuario/data/dummy_users.dart';
import 'package:cadastro_usuario/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  static const _dateUrl =
      "https://crud-app-flutter-24aa1-default-rtdb.firebaseio.com/";

  final Map<String, User> _itens = {...DUMMY_USERS};

  // ----------------------------- VERSÃO PARA FIREBASE ---------------------------

  // CREATE
  Future<void> createUser(User user) async {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _itens.containsKey(user.id)) {
      updateUser(user);
    } else {
      final response = await http.post(
        Uri.parse(
          "$_dateUrl/users.json",
        ),
        body: json.encode(
            {'name': user.name, 'email': user.email, 'photo': user.photo}),
      );

      final id = json.decode(response.body)['name'];
      _itens.putIfAbsent(
          id,
          () => User(
              id: id, name: user.name, email: user.email, photo: user.photo));
      notifyListeners();
    }
  }

  // UPDATE
  Future<void> updateUser(User user) async {
    final response = await http.patch(
        Uri.parse("$_dateUrl/users/${user.id}.json"),
        body: json.encode(
            {'name': user.name, 'email': user.email, 'photo': user.photo}));
    _itens.update(user.id,
        (_) => User(name: user.name, email: user.email, photo: user.photo));

    notifyListeners();
  }

  // READ
  List<User> get all {
    return [..._itens.values];
  }

  User byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  int get count {
    return _itens.length;
  }

  // DELETE
  Future<void> removeUser(User user) async {
    if (user != null && user.id != null) {
      final response = await http.delete(
        Uri.parse("$_dateUrl/users/${user.id}.json"),
      );
      _itens.remove(user.id);
    }
    notifyListeners();
  }

  // ----------------------------- VERSÃO PARA MAP ---------------------------

/*
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

  User byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  // DELETE
  void removeUser(User user) {
    if (user != null && user.id != null) {
      _itens.remove(user.id);
    }
    notifyListeners();
  } 
  */
}
