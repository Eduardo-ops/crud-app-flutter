import 'package:cadastro_usuario/models/user.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails(this.user);

  @override
  Widget build(BuildContext context) {
    final photo = user.photo == null || user.photo.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(user.photo),
          );
    return ListTile(
      leading: photo,
    );
  }
}
