import 'package:cadastro_usuario/models/user.dart';
import 'package:cadastro_usuario/provider/users.dart';
import 'package:cadastro_usuario/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.edit),
                color: Colors.orange,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    arguments: user,
                  );
                }),
            IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ct) => AlertDialog(
                      title: Text('Excluir usuário'),
                      content: Text('certeza de exclusão???'),
                      actions: <Widget>[
                        FlatButton(
                            child: Text('Não'),
                            onPressed: () => {
                                  Navigator.of(context).pop(false),
                                }),
                        FlatButton(
                          child: Text('Sim'),
                          onPressed: () => {
                            Navigator.of(context).pop(true),
                          },
                        )
                      ],
                    ),
                  ).then((confirmed) {
                    if (confirmed) {
                      Provider.of<UserProvider>(context, listen: false)
                          .removeUser(user);
                    }
                  });
                })
          ],
        ),
      ),
    );
  }
}
