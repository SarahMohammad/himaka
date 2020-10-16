import 'package:get_it/get_it.dart';
import 'package:himaka/ViewModels/auth_view_model.dart';
import 'package:himaka/ViewModels/filter_view_model.dart';
import 'package:himaka/ViewModels/home_view_model.dart';
import 'package:himaka/ViewModels/search_view_model.dart';
import 'package:himaka/ViewModels/wish_list_view_model.dart';
import 'package:himaka/utils/AppLanguage.dart';

import 'api.dart';
import 'authentication_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerFactory(() => Api());
  locator.registerLazySingleton(() => AppLanguage());
  locator.registerFactory(() => AuthViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => WishListViewModel());

  locator.registerFactory(() => SearchViewModel());
  locator.registerFactory(() => FilterViewModel());
}
