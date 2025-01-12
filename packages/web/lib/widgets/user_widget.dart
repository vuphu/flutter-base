import 'package:core/modules/users/user_module.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatefulWidget {
  UserWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserResponse user;

  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        child: ListTile(
          title: Text(widget.user.login),
          subtitle: Text(widget.user.id.toString()),
          leading: Image.network(widget.user.avatarUrl),
        ),
        onTap: () {},
      ),
    );
  }
}
