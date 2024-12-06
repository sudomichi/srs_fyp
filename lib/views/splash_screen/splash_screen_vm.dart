import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:srs_fyp_2024/app/app.router.dart';

class SplashVM extends BaseViewModel {
  String logo = 'assets/logo/Logo.png';
  String gif = 'assets/logo/Logo_animation.gif';
  final navigationService = NavigationService();

  bool isLogin = false;
  String role = '';

  checkIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool('isLogin') ?? isLogin;
    role = prefs.getString('role') ?? role;
    notifyListeners();
  }

  fetchData() async {
    await checkIsLogin();
  }

  initialize() async {
    await fetchData();
    await Future.delayed(const Duration(seconds: 5));
    navigateToView();
  }

  navigateToView() {
    // navigationService.navigateToStudentHomeScreen();
    if (isLogin) {
      if (role == "Student") {
        navigationService.navigateToStudentHomeScreen();
        print('Student');
      } else if (role == 'Teacher') {
        // print('Not Now');
        navigationService.navigateToTeacherHomeScreen();
      } else if (role == 'Admin') {
        navigationService.navigateToAdminHomeScreen();
      }
    } else {
      navigationService.navigateToLoginScreen();
    }
  }
}
