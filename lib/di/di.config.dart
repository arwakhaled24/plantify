// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/api/chatbot/geminiApiManager.dart' as _i3;
import '../data/dataSourceContract/chatBotDataSource.dart' as _i4;
import '../data/dataSourceImp/chatBotDataSourceImp.dart' as _i5;
import '../data/repositoryImp/ChatBotRepositoryImp.dart' as _i7;
import '../repositoryContract/chatBotRepository.dart' as _i6;
import '../ui/tabs/ChatBotTab/chatBotViewModel.dart' as _i8;

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
    gh.singleton<_i3.GeminiApiManger>(() => _i3.GeminiApiManger());
    gh.factory<_i4.ChatBotDataSource>(
        () => _i5.ChatBotDataSourceImpl(gh<_i3.GeminiApiManger>()));
    gh.factory<_i6.ChatBotRepository>(
        () => _i7.ChatBotRepositoryImp(gh<_i4.ChatBotDataSource>()));
    gh.factory<_i8.ChatBotViewModel>(
        () => _i8.ChatBotViewModel(gh<_i6.ChatBotRepository>()));
    return this;
  }
}
