import 'package:srs_fyp_2024/views/admin/admin_home_screen/admin_home_screen.dart';
import 'package:srs_fyp_2024/views/admin/feedback/feedback.dart';
import 'package:srs_fyp_2024/views/admin/view_fee_challan/fees_challan.dart';
import 'package:srs_fyp_2024/views/student/account_book_screen/account_book.dart';
import 'package:srs_fyp_2024/views/student/feedback_screen/feedback_screen.dart';
import 'package:srs_fyp_2024/views/student/grades_screen/grades_screen.dart';
import 'package:srs_fyp_2024/views/teacher/check_assignment/check_assignment.dart';
import 'package:srs_fyp_2024/views/teacher/check_salary_screen.dart/check_salary_screen.dart';
import 'package:srs_fyp_2024/views/teacher/teacher_home_screen/teacher_home_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:srs_fyp_2024/services/student_user.dart';
import 'package:srs_fyp_2024/views/login_screen/login_screen.dart';
import 'package:srs_fyp_2024/views/register_screen/register_screen.dart';
import 'package:srs_fyp_2024/views/splash_screen/splash_screen.dart';
import 'package:srs_fyp_2024/views/student/student_home/student_home.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: StudentHomeScreen),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: RegisterScreen),
    MaterialRoute(page: AccountBookScreen),
    MaterialRoute(page: GradesBookScreen),
    MaterialRoute(page: FeedbackScreen),
    MaterialRoute(page: TeacherHomeScreen),
    MaterialRoute(page: CheckSalaryScreen),
    MaterialRoute(page: AdminHomeScreen),
    MaterialRoute(page: AFeedbackScreen),
    MaterialRoute(page: FeesChallanView),
    MaterialRoute(page: CheckAssignmentView)
  ],
  dependencies: [
    Singleton(classType: NavigationService),
    Singleton(classType: SnackbarService),
    Singleton(classType: DialogService),
    Singleton(classType: BottomSheetService),
    LazySingleton(classType: StudentUser),
  ],
)
class App {}
