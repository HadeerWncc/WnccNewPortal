import 'package:go_router/go_router.dart';
import 'package:wncc_portal/features/authentication/data/models/validate_code_model.dart';
import 'package:wncc_portal/features/complains/presentation/views/pages/complain_page.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/pages/delivery_page.dart';
import 'package:wncc_portal/features/priority/delivery/presentation/views/widgets/dispatch_delivery.dart/details_page.dart';
import 'package:wncc_portal/features/priority/pickup/presentation/views/pages/pickup_priority_page.dart';
import 'package:wncc_portal/features/requests/presentation/views/pages/requests_page.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/add_request_page.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/edit_request_form.dart';
import 'package:wncc_portal/features/requests/presentation/views/widgets/edit_request_page.dart';
import 'package:wncc_portal/features/sales_quota/presentation/views/pages/sales_quota_page.dart';
import 'package:wncc_portal/features/user/presentation/views/pages/change_password_page.dart';
import 'package:wncc_portal/features/authentication/presentation/views/pages/forget_password_page.dart';
import 'package:wncc_portal/features/authentication/presentation/views/pages/login_page.dart';
import 'package:wncc_portal/features/authentication/presentation/views/pages/reset_password.dart';
import 'package:wncc_portal/features/authentication/presentation/views/pages/validation_code_page.dart';
import 'package:wncc_portal/features/home/presentation/views/pages/home_view.dart';
import 'package:wncc_portal/features/splash_view/presentation/views/pages/splash_view.dart';
import 'package:wncc_portal/features/user/presentation/views/pages/change_personal_info_page.dart';
import 'package:wncc_portal/features/user/presentation/views/pages/profile/profile_page.dart';
import 'package:wncc_portal/features/user/presentation/views/pages/select_startup_routing_page.dart';
import 'package:wncc_portal/features/user/presentation/views/pages/thanks_page.dart';
import 'package:wncc_portal/features/user/presentation/views/pages/welcome_page.dart';

abstract class AppRouter {
  static const loginPath = '/Login';
  static const homePath = '/home';
  static const forgetPasswordPath = '/forgetPassword';
  static const validationCodePagePath = '/validationCodePage';
  static const resetPasswordPath = '/resetPasswordPage';
  static const changePasswordPath = '/changePasswordPage';
  static const welcomePage = '/welcomePage';
  static const changePersonalInfoFirstLogin = '/changePersonalInfoFirstLogin';
  static const selectStartupRouting = '/selectStartupRouting';
  static const thanksPagePath = '/thanksPagePath';
  static const salesQuotaPath = '/salesQuotaPath';
  static const deliveryPath = '/deliveryPath';
  static const pickupPath = '/pickupPath';
  static const detailsPage = '/detailsPagePath';
  static const profile = '/profile';
  static const requests = '/requests';
  static const complains = '/complains';
  static const addRequestPage = '/addRequestPage';
  static const editRequestPage = '/editRequestPage';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: loginPath,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: forgetPasswordPath,
        builder: (context, state) => const ForgetPasswordPage(),
      ),
      GoRoute(
        path: validationCodePagePath,
        builder: (context, state) => ValidationCodePage(
          email: state.extra as String,
        ),
      ),
      GoRoute(
        path: resetPasswordPath,
        builder: (context, state) => ResetPassword(
          validateCodeModel: state.extra as ValidateCodeModel,
        ),
      ),
      GoRoute(
        path: homePath,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: changePasswordPath,
        builder: (context, state) => const ChangePasswordPage(),
      ),
      GoRoute(
        path: welcomePage,
        builder: (context, state) => const WelcomePage(),
      ),
      GoRoute(
        path: changePersonalInfoFirstLogin,
        builder: (context, state) => const ChangePersonalInfoPage(),
      ),
      GoRoute(
        path: selectStartupRouting,
        builder: (context, state) => const SelectStartupRoutingPage(),
      ),
      GoRoute(
        path: thanksPagePath,
        builder: (context, state) => const ThanksPage(),
      ),
      GoRoute(
        path: salesQuotaPath,
        builder: (context, state) => const SalesQuotaPage(),
      ),
      GoRoute(
        path: deliveryPath,
        builder: (context, state) => const DeliveryPage(),
      ),
      GoRoute(
        path: pickupPath,
        builder: (context, state) => const PickupPriorityPage(),
      ),
      GoRoute(
        path: detailsPage,
        builder: (context, state) => const DetailsPage(),
      ),
      GoRoute(
        path: profile,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: requests,
        builder: (context, state) => const RequestsPage(),
      ),
      GoRoute(
        path: complains,
        builder: (context, state) => const ComplainPage(),
      ),
      GoRoute(
        path: addRequestPage,
        builder: (context, state) => const AddRequestPage(),
      ),
      GoRoute(
        path: editRequestPage,
        builder: (context, state) => const EditRequestPage(),
      ),
    ],
  );
}
