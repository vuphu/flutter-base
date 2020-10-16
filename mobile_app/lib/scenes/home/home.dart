import 'package:core/blocs/loads/base/bloc.dart';
import 'package:core/blocs/loads/base/state.dart';
import 'package:core/blocs/loads/extends/event.dart';
import 'package:core/blocs/loads/extends/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/widgets/github_user.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<LoadBloc>(context).add(LoadingGithubUsersEvent());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 100.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
              ),
            ),
          ];
        },
        body: RefreshIndicator(
          onRefresh: () async =>
              BlocProvider.of<LoadBloc>(context).add(LoadingGithubUsersEvent()),
          child: BlocBuilder<LoadBloc, LoadState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                );
              } else if (state is LoadGithubUserSuccessState) {
                return NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overScroll) {
                      overScroll.disallowGlow();
                      return true;
                    },
                    child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) =>
                          GithubUserWidget(githubUser: state.data[index]),
                    ));
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
