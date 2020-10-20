import 'package:core/action/load_github_user.dart';
import 'package:core/di/di.dart';
import 'package:core/models/github_user.dart';
import 'package:core/widgets/list_view/pagination_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/github_user.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
      builder: (context) => PaginationView<GithubUser>(
        pageFetch: _pageFetch,
        itemBuilder: (context, item, index) => GithubUserWidget(
          githubUser: item,
        ),
        onError: (error) {
          final snackBar = SnackBar(
              content: Text(error),
              duration: Duration(milliseconds: 1000),
              backgroundColor: Colors.red);
          Scaffold.of(context).showSnackBar(snackBar);
        },
        isPullToRequest: true,
      ),
    ));
  }

  Future<List<GithubUser>> _pageFetch(int currentPosition) {
    return getIt<LoadGithubUserAction>()
        .execute(query: "vuphu", offset: currentPosition);
  }
}
