// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:core/datasources/remote/apis/github_user.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../action/load_github_user.dart';
import '../blocs/render/render_bloc.dart';
import '../repositories/repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<RenderBloc>(() => RenderBloc());
  gh.lazySingleton<LoadGithubUserAction>(
      () => LoadGithubUserActionImpl(get<Repository>()));

  // Eager singletons must be registered in the right order
  gh.singleton<GithubUserAPI>(GithubUserAPIImpl());
  gh.singleton<Repository>(RepositoryImpl(get<GithubUserAPI>()));
  return get;
}
