// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core/modules/users/datasources/user_api.dart' as _i739;
import 'package:core/modules/users/services/user_service.dart' as _i890;
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
    gh.singleton<_i739.UserAPI>(() => _i739.UserAPIImpl());
    gh.singleton<_i890.UserService>(
        () => _i890.UserServiceImpl(gh<_i739.UserAPI>()));
    return this;
  }
}
