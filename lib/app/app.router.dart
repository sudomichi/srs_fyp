// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/material.dart';
import 'package:srs_fyp_2024/views/admin/admin_home_screen/admin_home_screen.dart'
    as _i11;
import 'package:srs_fyp_2024/views/admin/feedback/feedback.dart' as _i12;
import 'package:srs_fyp_2024/views/admin/view_fee_challan/fees_challan.dart'
    as _i13;
import 'package:srs_fyp_2024/views/login_screen/login_screen.dart' as _i4;
import 'package:srs_fyp_2024/views/register_screen/register_screen.dart' as _i5;
import 'package:srs_fyp_2024/views/splash_screen/splash_screen.dart' as _i2;
import 'package:srs_fyp_2024/views/student/account_book_screen/account_book.dart'
    as _i6;
import 'package:srs_fyp_2024/views/student/feedback_screen/feedback_screen.dart'
    as _i8;
import 'package:srs_fyp_2024/views/student/grades_screen/grades_screen.dart'
    as _i7;
import 'package:srs_fyp_2024/views/student/student_home/student_home.dart'
    as _i3;
import 'package:srs_fyp_2024/views/teacher/check_assignment/check_assignment.dart'
    as _i14;
import 'package:srs_fyp_2024/views/teacher/check_salary_screen.dart/check_salary_screen.dart'
    as _i10;
import 'package:srs_fyp_2024/views/teacher/teacher_home_screen/teacher_home_screen.dart'
    as _i9;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i16;

class Routes {
  static const splashScreen = '/';

  static const studentHomeScreen = '/student-home-screen';

  static const loginScreen = '/login-screen';

  static const registerScreen = '/register-screen';

  static const accountBookScreen = '/account-book-screen';

  static const gradesBookScreen = '/grades-book-screen';

  static const feedbackScreen = '/feedback-screen';

  static const teacherHomeScreen = '/teacher-home-screen';

  static const checkSalaryScreen = '/check-salary-screen';

  static const adminHomeScreen = '/admin-home-screen';

  static const aFeedbackScreen = '/a-feedback-screen';

  static const feesChallanView = '/fees-challan-view';

  static const checkAssignmentView = '/check-assignment-view';

  static const all = <String>{
    splashScreen,
    studentHomeScreen,
    loginScreen,
    registerScreen,
    accountBookScreen,
    gradesBookScreen,
    feedbackScreen,
    teacherHomeScreen,
    checkSalaryScreen,
    adminHomeScreen,
    aFeedbackScreen,
    feesChallanView,
    checkAssignmentView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreen,
      page: _i2.SplashScreen,
    ),
    _i1.RouteDef(
      Routes.studentHomeScreen,
      page: _i3.StudentHomeScreen,
    ),
    _i1.RouteDef(
      Routes.loginScreen,
      page: _i4.LoginScreen,
    ),
    _i1.RouteDef(
      Routes.registerScreen,
      page: _i5.RegisterScreen,
    ),
    _i1.RouteDef(
      Routes.accountBookScreen,
      page: _i6.AccountBookScreen,
    ),
    _i1.RouteDef(
      Routes.gradesBookScreen,
      page: _i7.GradesBookScreen,
    ),
    _i1.RouteDef(
      Routes.feedbackScreen,
      page: _i8.FeedbackScreen,
    ),
    _i1.RouteDef(
      Routes.teacherHomeScreen,
      page: _i9.TeacherHomeScreen,
    ),
    _i1.RouteDef(
      Routes.checkSalaryScreen,
      page: _i10.CheckSalaryScreen,
    ),
    _i1.RouteDef(
      Routes.adminHomeScreen,
      page: _i11.AdminHomeScreen,
    ),
    _i1.RouteDef(
      Routes.aFeedbackScreen,
      page: _i12.AFeedbackScreen,
    ),
    _i1.RouteDef(
      Routes.feesChallanView,
      page: _i13.FeesChallanView,
    ),
    _i1.RouteDef(
      Routes.checkAssignmentView,
      page: _i14.CheckAssignmentView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreen(),
        settings: data,
      );
    },
    _i3.StudentHomeScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StudentHomeScreen(),
        settings: data,
      );
    },
    _i4.LoginScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.LoginScreen(),
        settings: data,
      );
    },
    _i5.RegisterScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.RegisterScreen(),
        settings: data,
      );
    },
    _i6.AccountBookScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.AccountBookScreen(),
        settings: data,
      );
    },
    _i7.GradesBookScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.GradesBookScreen(),
        settings: data,
      );
    },
    _i8.FeedbackScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.FeedbackScreen(),
        settings: data,
      );
    },
    _i9.TeacherHomeScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.TeacherHomeScreen(),
        settings: data,
      );
    },
    _i10.CheckSalaryScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i10.CheckSalaryScreen(),
        settings: data,
      );
    },
    _i11.AdminHomeScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.AdminHomeScreen(),
        settings: data,
      );
    },
    _i12.AFeedbackScreen: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.AFeedbackScreen(),
        settings: data,
      );
    },
    _i13.FeesChallanView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.FeesChallanView(),
        settings: data,
      );
    },
    _i14.CheckAssignmentView: (data) {
      return _i15.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.CheckAssignmentView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i16.NavigationService {
  Future<dynamic> navigateToSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStudentHomeScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.studentHomeScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountBookScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountBookScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGradesBookScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.gradesBookScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFeedbackScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.feedbackScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTeacherHomeScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.teacherHomeScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCheckSalaryScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.checkSalaryScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminHomeScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminHomeScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAFeedbackScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.aFeedbackScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToFeesChallanView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.feesChallanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCheckAssignmentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.checkAssignmentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStudentHomeScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.studentHomeScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountBookScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountBookScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGradesBookScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.gradesBookScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFeedbackScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.feedbackScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTeacherHomeScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.teacherHomeScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCheckSalaryScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.checkSalaryScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAdminHomeScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.adminHomeScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAFeedbackScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.aFeedbackScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithFeesChallanView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.feesChallanView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCheckAssignmentView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.checkAssignmentView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
