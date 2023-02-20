import 'package:core/modules/users/models/github_user.dart';
import 'package:flutter/material.dart';

class GithubUserWidget extends StatefulWidget {
  GithubUserWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final GithubUser data;

  @override
  _GithubUserWidgetState createState() => _GithubUserWidgetState();
}

class _GithubUserWidgetState extends State<GithubUserWidget> {
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
