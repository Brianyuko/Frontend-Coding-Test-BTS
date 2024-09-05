import 'package:frontend_bts/blocs/auth/auth_bloc.dart';
import 'package:frontend_bts/blocs/checklist/checklist_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  locator.registerFactory(() => AuthBloc(client: locator()));
  locator.registerFactory(() => ChecklistBloc(client: locator()));

  locator.registerLazySingleton(() => http.Client());
}
