// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:core/blocs/fetch_user_bloc/fetch_users_bloc.dart';
import 'package:core/domain/datasources/remote/apis/github_user.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../domain/repositories/repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String? environment,
  EnvironmentFilter? environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);

  // Eager singletons must be registered in the right order
  gh.singleton<GithubUserAPI>(GithubUserAPIImpl());
  gh.singleton<Repository>(RepositoryImpl(get<GithubUserAPI>()));
  gh.singleton<FetchUserBloc>(FetchUserBloc(get<Repository>()));
  return get;
}
