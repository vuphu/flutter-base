import 'package:core/modules/users/models/user.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatefulWidget {
  UserWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final User data;

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
          title: Text(widget.data.login),
          subtitle: Text(widget.data.id.toString()),
          leading: Image.network(widget.data.avatarUrl),
        ),
        onTap: () {},
      ),
    );
  }
}
