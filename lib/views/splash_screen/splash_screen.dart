import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
// import 'package:srs_fyp_2024/theme/button_style.dart';
import 'package:srs_fyp_2024/theme/color.dart';
// import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/splash_screen/splash_screen_vm.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplashVM(),
      onViewModelReady: (viewModel) => viewModel.initialize(),
      builder: (context, vModel, child) {
        return Scaffold(
          backgroundColor: AppColors.drawerColor,
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Image.asset(
                      vModel.gif,
                      fit: BoxFit.contain,
                    ),
                  ),
                  // ElevatedButton(
                  //   style: CustomButtonStyle.b1style,
                  //   onPressed: () {
                  //     vModel.navigateToView();
                  //   },
                  //   child: Text(
                  //     'Get Started',
                  //     style: Style.semiBold14ptb.copyWith(fontSize: 10.sp),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
