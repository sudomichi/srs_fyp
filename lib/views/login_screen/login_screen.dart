import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:srs_fyp_2024/theme/button_style.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/login_screen/login_screen_vm.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => LoginScreenVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SizedBox(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 0.05.sw, right: 0.05.sw),
                    width: 0.4.sw,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                            child: Image.asset(
                              vModel.logo,
                              width: 0.1.sw,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.1,
                                  blurRadius: 40,
                                  offset: const Offset(
                                      0, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Text(
                              'Student Portal',
                              style: Style.medium20ptb.copyWith(
                                  color: AppColors.textColor1, fontSize: 8.sp),
                            ),
                          ),
                        ),
                        5.verticalSpace,
                        Center(
                          child: Text(
                            'Enter your Registration No and Password',
                            style: Style.regular14ptb.copyWith(
                                color: AppColors.textColor1, fontSize: 4.sp),
                          ),
                        ),
                        30.verticalSpace,
                        Center(
                          child: Form(
                            key: vModel.formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 0.4.sw,
                                  height: 0.1.sh,
                                  child: TextFormField(
                                    controller: vModel.emailController,
                                    maxLines: 1,
                                    keyboardType: TextInputType.emailAddress,
                                    style: Style.regular14ptb.copyWith(
                                      fontSize: 5.sp,
                                      color: AppColors.textColor1,
                                    ),
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintText: 'Email',
                                      prefixIcon: const Icon(Icons.email),
                                      hintStyle: Style.regular14ptb.copyWith(
                                          color: AppColors.textColor1,
                                          fontSize: 5.sp),
                                      fillColor: AppColors.secondaryColor,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      // bool emailValid = RegExp(
                                      //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      //     .hasMatch(value!);

                                      // if (value.isEmpty || !emailValid) {
                                      //   return 'Enter correct email';
                                      // } else if (value == 'admin') {
                                      //   return null;
                                      // } else {
                                      //   return null;
                                      // }
                                      return null;
                                    },
                                  ),
                                ),
                                20.verticalSpace,
                                SizedBox(
                                  width: 0.4.sw,
                                  height: 0.1.sh,
                                  child: TextFormField(
                                    controller: vModel.passwordController,
                                    maxLines: 1,
                                    keyboardType: TextInputType.emailAddress,
                                    style: Style.regular14ptb.copyWith(
                                      fontSize: 5.sp,
                                      color: AppColors.textColor1,
                                    ),
                                    obscureText: vModel.obscureText,
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintText: 'Password',
                                      suffixIcon: InkWell(
                                        onTap: () => vModel.toggleObscureText(),
                                        child: Icon(
                                          vModel.obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                      ),
                                      prefixIcon: const Icon(Icons.password),
                                      hintStyle: Style.regular14ptb.copyWith(
                                          color: AppColors.textColor1,
                                          fontSize: 5.sp),
                                      fillColor: AppColors.secondaryColor,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: AppColors.primaryColor,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter correct password';
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        5.verticalSpace,
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Text(
                        //     'Forgot Password',
                        //     style: Style.regular16ptb.copyWith(
                        //         color: AppColors.buttonColor, fontSize: 5.sp),
                        //   ),
                        // ),
                        // 5.verticalSpace,
                        Container(
                          margin: EdgeInsets.only(
                            left: 0.3.sw,
                          ),
                          // alignment: AlignmentGeometryTween(),
                          child: ElevatedButton(
                            style: CustomButtonStyle.b3style,
                            onPressed: () {
                              vModel.checkSignIn();
                            },
                            child: vModel.isBusy
                                ? const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: CircularProgressIndicator(
                                      color: AppColors.textColor2,
                                    ),
                                  )
                                : Text(
                                    'Login',
                                    style: Style.regular14ptb
                                        .copyWith(fontSize: 4.sp),
                                  ),
                          ),
                        ),
                        20.verticalSpace,
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              vModel.navigateToRegister();
                            },
                            child: Text(
                              'I don\'t have an account',
                              style: Style.regular16ptb.copyWith(
                                  fontSize: 5.sp, color: AppColors.buttonColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Image on Right
                  // Container(
                  //   width: 0.5.sw,
                  //   child: Image.network(
                  //     'https://images.unsplash.com/photo-1517486808906-6ca8b3f04846?q=80&w=1498&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  SizedBox(
                    width: 0.5.sw,
                    child: Image.asset(
                      vModel.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
