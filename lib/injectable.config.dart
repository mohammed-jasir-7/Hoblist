// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:geeks/controllers/authentication/authentication_bloc.dart'
    as _i5;
import 'package:geeks/controllers/hoblist%20bloc/hoblist_bloc.dart' as _i8;
import 'package:geeks/services/auth_services.dart' as _i3;
import 'package:geeks/services/hoblist_api_service.dart' as _i6;
import 'package:geeks/services/repo/db_repo.dart' as _i4;
import 'package:geeks/services/repo/hoblist_repo.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AuthService>(() => _i4.DbRepository());
    gh.factory<_i5.AuthenticationBloc>(
        () => _i5.AuthenticationBloc(gh<_i3.AuthService>()));
    gh.lazySingleton<_i6.HobslistServices>(() => _i7.HobListRepo());
    gh.factory<_i8.HoblistBloc>(
        () => _i8.HoblistBloc(gh<_i6.HobslistServices>()));
    return this;
  }
}
