// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../datasources/remote/rest/apis/github_user_api.dart';
import '../blocs/loads/base/bloc.dart';
import '../action/load_github_user.dart';
import '../repositories/repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<LoadBloc>(() => LoadBloc());
  gh.lazySingleton<LoadGithubUserAction>(
      () => LoadGithubUserAction(get<Repository>()));

  // Eager singletons must be registered in the right order
  gh.singleton<GithubUserAPI>(GithubUserAPIImpl());
  gh.singleton<Repository>(RepositoryImpl(get<GithubUserAPI>()));
  return get;
}
