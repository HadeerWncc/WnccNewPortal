import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wncc_portal/core/utils/dio_client.dart';
import 'package:wncc_portal/core/utils/functions/setup_service_locator.dart';
import 'package:wncc_portal/core/utils/functions/simple_bloc_observer.dart';

void setupApp() {
  createDio();
  Bloc.observer = SimpleBlocObserver();
  setupLocator();
}
