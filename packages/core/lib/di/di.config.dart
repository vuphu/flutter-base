// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core/modules/github/datasources/datasources.dart' as _i651;
import 'package:core/modules/github/datasources/github_api.dart' as _i317;
import 'package:core/modules/github/services/github_service.dart' as _i164;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i317.GithubAPI>(() => _i317.GithubAPIImpl());
    gh.singleton<_i164.GithubService>(() => _i164.GithubServiceImpl(gh<_i651.GithubAPI>()));
    return this;
  }
}
