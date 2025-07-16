import 'package:core/modules/github.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({super.key, required this.user});

  final UserResponse user;

  @override
  State<UserWidget> createState() => _UserWidgetState();
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
          leading: CircleAvatar(radius: 24, backgroundImage: NetworkImage(widget.user.avatarUrl)),
        ),
        onTap: () {},
      ),
    );
  }
}
