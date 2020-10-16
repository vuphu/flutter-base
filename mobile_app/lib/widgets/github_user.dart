import 'package:core/models/github_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GithubUserWidget extends StatefulWidget {
  GithubUserWidget({Key key, this.githubUser}) : super(key: key);

  final GithubUser githubUser;

  @override
  _GithubUserWidgetState createState() => _GithubUserWidgetState();
}

class _GithubUserWidgetState extends State<GithubUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: InkWell(
          child: ListTile(
            title: Text(widget.githubUser.login),
            subtitle: Text(widget.githubUser.id.toString()),
            leading: Image.network(widget.githubUser.avatarUrl),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
