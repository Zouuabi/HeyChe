import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:social_media_app/core/network_info.dart';
import 'package:social_media_app/data/data_source/remote_data_source/cloud_firestore.dart';
import 'package:social_media_app/data/data_source/remote_data_source/cloud_storage.dart';
import 'package:social_media_app/data/data_source/remote_data_source/firebase_auth.dart';
import 'package:social_media_app/data/repository/repository_impl.dart';
import 'package:social_media_app/domain/repositories/repository.dart';
import 'package:social_media_app/domain/use_cases/login_use_cases.dart';
import 'package:social_media_app/presentation/login/cubit/login_cubit.dart';

final instance = GetIt.instance;

Future<void> initCoreModue() async {
  instance.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(internetConnectionChecker: InternetConnectionChecker()));

  instance.registerLazySingleton<FirebaseAuthentication>(
      () => FirebaseAuthentication());
  instance.registerLazySingleton<CloudStorage>(() => CloudStorage());
  instance.registerLazySingleton<CloudFirestore>(() => CloudFirestore());

  instance.registerLazySingleton<Repository>(() => RepositoryImpl(
        instance(),
        instance(),
        instance(),
        instance(),
      ));
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginCubit>(() => LoginCubit(instance()));
  }
}
