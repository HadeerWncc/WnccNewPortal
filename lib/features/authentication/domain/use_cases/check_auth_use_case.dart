import 'package:wncc_portal/core/utils/shared_preferences.dart';

class CheckAuthUseCase {
  Future<bool> call() async {
    final token = await getToken();
    return token != null;
  }
}
