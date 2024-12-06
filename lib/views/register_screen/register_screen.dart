import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:srs_fyp_2024/theme/button_style.dart';
import 'package:srs_fyp_2024/theme/color.dart';
import 'package:srs_fyp_2024/theme/fonts_style.dart';
import 'package:srs_fyp_2024/views/register_screen/register_screen_vm.dart';
import 'package:group_button/group_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RegisterScreenVM(),
      builder: (context, vModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Blur(
                    blur: 2,
                    blurColor: AppColors.primaryColor,
                    child: SizedBox(
                      width: 1.sw,
                      child: Image.asset(
                        vModel.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: 0.4.sw,
                    // height: 0.43.sw,
                    decoration: BoxDecoration(
                      color: AppColors.textColor2,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset:
                              const Offset(3, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 0.02.sw, vertical: 0.02.sh),
                      child: SingleChildScrollView(
                        // physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: SizedBox(
                                width: 0.1.sw,
                                child: Image.asset(
                                  vModel.logo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Fill out the filling fields to register.',
                                style: Style.regular14ptb.copyWith(
                                  color: AppColors.textColor1,
                                  fontSize: 4.sp,
                                ),
                              ),
                            ),
                            30.verticalSpace,
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Role: ',
                                    style: Style.regular16ptb.copyWith(
                                        fontSize: 6.sp,
                                        color: AppColors.textColor1),
                                  ),
                                  GroupButton(
                                    isRadio: true,
                                    onSelected: (string, index, isSelected) {
                                      debugPrint(
                                          '$index button is selected: $string');
                                      vModel.setRole(string);
                                    },
                                    buttons: const [
                                      'Teacher',
                                      'Student',
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            20.verticalSpace,
                            vModel.role == 'Student'
                                ? Center(
                                    child: Form(
                                      key: vModel.formKey,
                                      child: Column(
                                        children: [
                                          //Name
                                          SizedBox(
                                            width: 0.4.sw,
                                            height: 0.1.sh,
                                            child: TextFormField(
                                              controller: vModel.nameController,
                                              maxLines: 1,
                                              keyboardType: TextInputType.text,
                                              style:
                                                  Style.regular14ptb.copyWith(
                                                fontSize: 5.sp,
                                                color: AppColors.textColor1,
                                              ),
                                              decoration: InputDecoration(
                                                filled: true,
                                                hintText: 'Name',
                                                prefixIcon:
                                                    const Icon(Icons.person),
                                                hintStyle: Style.regular14ptb
                                                    .copyWith(
                                                        color: AppColors
                                                            .textColor1,
                                                        fontSize: 5.sp),
                                                fillColor:
                                                    AppColors.secondaryColor,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color: AppColors
                                                        .secondaryColor,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Enter Name';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                          //class
                                          SizedBox(
                                            width: 0.4.sw,
                                            height: 0.1.sh,
                                            child: TextFormField(
                                              controller:
                                                  vModel.classController,
                                              maxLines: 1,
                                              keyboardType:
                                                  TextInputType.number,
                                              style:
                                                  Style.regular14ptb.copyWith(
                                                fontSize: 5.sp,
                                                color: AppColors.textColor1,
                                              ),
                                              decoration: InputDecoration(
                                                filled: true,
                                                hintText: 'Class No',
                                                prefixIcon:
                                                    const Icon(Icons.room),
                                                hintStyle: Style.regular14ptb
                                                    .copyWith(
                                                        color: AppColors
                                                            .textColor1,
                                                        fontSize: 5.sp),
                                                fillColor:
                                                    AppColors.secondaryColor,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color: AppColors
                                                        .secondaryColor,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Enter class eg. 1-10';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                          //Roll Number
                                          SizedBox(
                                            width: 0.4.sw,
                                            height: 0.1.sh,
                                            child: TextFormField(
                                              controller:
                                                  vModel.rollNumberController,
                                              maxLines: 1,
                                              keyboardType: TextInputType.text,
                                              style:
                                                  Style.regular14ptb.copyWith(
                                                fontSize: 5.sp,
                                                color: AppColors.textColor1,
                                              ),
                                              decoration: InputDecoration(
                                                filled: true,
                                                hintText: 'Roll Number',
                                                prefixIcon:
                                                    const Icon(Icons.numbers),
                                                hintStyle: Style.regular14ptb
                                                    .copyWith(
                                                        color: AppColors
                                                            .textColor1,
                                                        fontSize: 5.sp),
                                                fillColor:
                                                    AppColors.secondaryColor,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color: AppColors
                                                        .secondaryColor,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Enter Roll Number';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),

                                          //email
                                          SizedBox(
                                            width: 0.4.sw,
                                            height: 0.1.sh,
                                            child: TextFormField(
                                              controller:
                                                  vModel.emailController,
                                              maxLines: 1,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              style:
                                                  Style.regular14ptb.copyWith(
                                                fontSize: 5.sp,
                                                color: AppColors.textColor1,
                                              ),
                                              decoration: InputDecoration(
                                                filled: true,
                                                hintText: 'Email',
                                                prefixIcon:
                                                    const Icon(Icons.email),
                                                hintStyle: Style.regular14ptb
                                                    .copyWith(
                                                        color: AppColors
                                                            .textColor1,
                                                        fontSize: 5.sp),
                                                fillColor:
                                                    AppColors.secondaryColor,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color: AppColors
                                                        .secondaryColor,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                bool emailValid = RegExp(
                                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                    .hasMatch(value!);

                                                if (value.isEmpty ||
                                                    !emailValid) {
                                                  return 'Enter correct email';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                          // 20.verticalSpace,
                                          SizedBox(
                                            width: 0.4.sw,
                                            height: 0.1.sh,
                                            child: TextFormField(
                                              controller:
                                                  vModel.passwordController,
                                              maxLines: 1,
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              style:
                                                  Style.regular14ptb.copyWith(
                                                fontSize: 5.sp,
                                                color: AppColors.textColor1,
                                              ),
                                              obscureText: vModel.obscureText,
                                              decoration: InputDecoration(
                                                filled: true,
                                                hintText: 'Password',
                                                suffixIcon: InkWell(
                                                  onTap: () => vModel
                                                      .toggleObscureText(),
                                                  child: Icon(
                                                    vModel.obscureText
                                                        ? Icons.visibility_off
                                                        : Icons.visibility,
                                                  ),
                                                ),
                                                prefixIcon:
                                                    const Icon(Icons.password),
                                                hintStyle: Style.regular14ptb
                                                    .copyWith(
                                                        color: AppColors
                                                            .textColor1,
                                                        fontSize: 5.sp),
                                                fillColor:
                                                    AppColors.secondaryColor,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color: AppColors
                                                        .secondaryColor,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: const BorderSide(
                                                    color:
                                                        AppColors.primaryColor,
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'Enter password';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : vModel.role == 'Teacher'
                                    ? Center(
                                        child: Form(
                                          key: vModel.formKey,
                                          child: Column(
                                            children: [
                                              //Name
                                              SizedBox(
                                                width: 0.4.sw,
                                                height: 0.1.sh,
                                                child: TextFormField(
                                                  controller:
                                                      vModel.nameController,
                                                  maxLines: 1,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  style: Style.regular14ptb
                                                      .copyWith(
                                                    fontSize: 5.sp,
                                                    color: AppColors.textColor1,
                                                  ),
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    hintText: 'Name',
                                                    prefixIcon: const Icon(
                                                        Icons.person),
                                                    hintStyle: Style
                                                        .regular14ptb
                                                        .copyWith(
                                                            color: AppColors
                                                                .textColor1,
                                                            fontSize: 5.sp),
                                                    fillColor: AppColors
                                                        .secondaryColor,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .secondaryColor,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .primaryColor,
                                                        width: 1,
                                                      ),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Enter Name';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                              //class
                                              SizedBox(
                                                width: 0.4.sw,
                                                height: 0.1.sh,
                                                child: TextFormField(
                                                  controller: vModel
                                                      .designationController,
                                                  maxLines: 1,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  style: Style.regular14ptb
                                                      .copyWith(
                                                    fontSize: 5.sp,
                                                    color: AppColors.textColor1,
                                                  ),
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    hintText: 'Designation',
                                                    prefixIcon:
                                                        const Icon(Icons.room),
                                                    hintStyle: Style
                                                        .regular14ptb
                                                        .copyWith(
                                                            color: AppColors
                                                                .textColor1,
                                                            fontSize: 5.sp),
                                                    fillColor: AppColors
                                                        .secondaryColor,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .secondaryColor,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .primaryColor,
                                                        width: 1,
                                                      ),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Enter Designation';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                              //Roll Number
                                              SizedBox(
                                                width: 0.4.sw,
                                                height: 0.1.sh,
                                                child: TextFormField(
                                                  controller:
                                                      vModel.resNoController,
                                                  maxLines: 1,
                                                  keyboardType:
                                                      TextInputType.text,
                                                  style: Style.regular14ptb
                                                      .copyWith(
                                                    fontSize: 5.sp,
                                                    color: AppColors.textColor1,
                                                  ),
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    hintText:
                                                        'Registration Number',
                                                    prefixIcon: const Icon(
                                                        Icons.numbers),
                                                    hintStyle: Style
                                                        .regular14ptb
                                                        .copyWith(
                                                            color: AppColors
                                                                .textColor1,
                                                            fontSize: 5.sp),
                                                    fillColor: AppColors
                                                        .secondaryColor,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .secondaryColor,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .primaryColor,
                                                        width: 1,
                                                      ),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Enter Registration Number';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),

                                              //email
                                              SizedBox(
                                                width: 0.4.sw,
                                                height: 0.1.sh,
                                                child: TextFormField(
                                                  controller:
                                                      vModel.emailController,
                                                  maxLines: 1,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  style: Style.regular14ptb
                                                      .copyWith(
                                                    fontSize: 5.sp,
                                                    color: AppColors.textColor1,
                                                  ),
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    hintText: 'Email',
                                                    prefixIcon:
                                                        const Icon(Icons.email),
                                                    hintStyle: Style
                                                        .regular14ptb
                                                        .copyWith(
                                                            color: AppColors
                                                                .textColor1,
                                                            fontSize: 5.sp),
                                                    fillColor: AppColors
                                                        .secondaryColor,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .secondaryColor,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .primaryColor,
                                                        width: 1,
                                                      ),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    bool emailValid = RegExp(
                                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                        .hasMatch(value!);

                                                    if (value.isEmpty ||
                                                        !emailValid) {
                                                      return 'Enter correct email';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                              // 20.verticalSpace,
                                              SizedBox(
                                                width: 0.4.sw,
                                                height: 0.1.sh,
                                                child: TextFormField(
                                                  controller:
                                                      vModel.passwordController,
                                                  maxLines: 1,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  style: Style.regular14ptb
                                                      .copyWith(
                                                    fontSize: 5.sp,
                                                    color: AppColors.textColor1,
                                                  ),
                                                  obscureText:
                                                      vModel.obscureText,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    hintText: 'Password',
                                                    suffixIcon: InkWell(
                                                      onTap: () => vModel
                                                          .toggleObscureText(),
                                                      child: Icon(
                                                        vModel.obscureText
                                                            ? Icons
                                                                .visibility_off
                                                            : Icons.visibility,
                                                      ),
                                                    ),
                                                    prefixIcon: const Icon(
                                                        Icons.password),
                                                    hintStyle: Style
                                                        .regular14ptb
                                                        .copyWith(
                                                            color: AppColors
                                                                .textColor1,
                                                            fontSize: 5.sp),
                                                    fillColor: AppColors
                                                        .secondaryColor,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .secondaryColor,
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide:
                                                          const BorderSide(
                                                        color: AppColors
                                                            .primaryColor,
                                                        width: 1,
                                                      ),
                                                    ),
                                                  ),
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return 'Enter password';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(
                                        // height: 0.5.sh,
                                        ),
                            if (vModel.role != '')
                              Row(
                                children: [
                                  Text(
                                    'Upload Image:',
                                    style: Style.regular14ptb.copyWith(
                                        fontSize: 5.sp,
                                        color: AppColors.textColor1),
                                  ),
                                  const Spacer(),
                                  vModel.isImage == false
                                      ? ElevatedButton(
                                          style: CustomButtonStyle.b3style,
                                          onPressed: () {
                                            vModel.uploadApiImage();
                                          },
                                          child: Text(
                                            'Upload',
                                            style: Style.regular14ptb
                                                .copyWith(fontSize: 4.sp),
                                          ),
                                        )
                                      : ElevatedButton(
                                          style: CustomButtonStyle.b3style,
                                          onPressed: () {
                                            vModel.uploadApiImage();
                                          },
                                          child: Text(
                                            'Change',
                                            style: Style.regular14ptb
                                                .copyWith(fontSize: 4.sp),
                                          ),
                                        ),
                                ],
                              ),
                            if (vModel.isImage) 10.verticalSpace,
                            if (vModel.isImage)
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                    width: 200.h,
                                    height: 200.h,
                                    child: Image.network(
                                      vModel.isImageUploaded,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            if (vModel.role != '') 20.verticalSpace,
                            if (vModel.role != '')
                              Center(
                                // margin: EdgeInsets.only(
                                //   left: 0.3.sw,
                                // ),
                                // alignment: AlignmentGeometryTween(),
                                child: ElevatedButton(
                                  style: CustomButtonStyle.b3style,
                                  onPressed: () {
                                    if (vModel.formKey.currentState!
                                            .validate() &&
                                        vModel.isImage == true) {
                                      vModel.registerUser();
                                    } else {
                                      vModel.snackBarService.showSnackbar(
                                          message: 'Fill out the fields',
                                          duration: const Duration(seconds: 1));
                                    }
                                  },
                                  child: vModel.isBusy
                                      ? const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: CircularProgressIndicator(
                                            color: AppColors.textColor2,
                                          ),
                                        )
                                      : Text(
                                          'Register',
                                          style: Style.regular14ptb
                                              .copyWith(fontSize: 4.sp),
                                        ),
                                ),
                              ),
                            if (vModel.role != '') 10.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
