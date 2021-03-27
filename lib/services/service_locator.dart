import 'package:get_it/get_it.dart';
import 'package:sample_flutter_project/business_logic/view_models/blog_list_viewmodel.dart';
import 'package:sample_flutter_project/business_logic/view_models/blog_viewmodel.dart';
import 'package:sample_flutter_project/business_logic/view_models/user_token_viewmodel.dart';
import 'package:sample_flutter_project/services/storage/storage_service.dart';
import 'package:sample_flutter_project/services/web_api/web_api_service.dart';

final GetIt serviceLocator = GetIt.instance;

void setupService() {
  serviceLocator.registerLazySingleton<WebApi>(() => WebApi());
  serviceLocator.registerFactory<StorageService>(() => StorageService());

  serviceLocator.registerFactory<BlogViewModel>(() => BlogViewModel());
  serviceLocator.registerFactory<BlogListViewModel>(() => BlogListViewModel());
  serviceLocator
      .registerFactory<UserTokenViewModel>(() => UserTokenViewModel());
}
