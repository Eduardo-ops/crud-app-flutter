import 'package:cadastro_usuario/models/user.dart';
import 'package:cadastro_usuario/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final validator = _form.currentState.validate();
              if (validator) {
                _form.currentState.save();
                Provider.of<UserProvider>(context, listen: false).createUser(
                  User(
                    id: _formData['id'],
                    name: _formData['name'],
                    email: _formData['email'],
                    photo: _formData['photo'],
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'),
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL da foto'),
                onSaved: (value) => _formData['photo'] = value,
              )
            ],
          ),
        ),
      ),
    );
  }
}
