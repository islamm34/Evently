import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../model/firebase_utilits/firebase_functions.dart';
import '../../../../model/firebase_utilits/firebase_functions.dart' as FirebaseUtils;
import '../../../../model/user_dm.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_dialogs.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_styles.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/app_textfield.dart';
import '../../../../widgets/evently_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AppAssets.appLogo),
                  const SizedBox(height: 48),
                  Text(
                    "Create your account",
                    style: AppTextStyles.blue24SemiBold,
                  ),
                  const SizedBox(height: 24),
                  AppTextField(
                    hint: "Enter your name",
                    prefixIcon: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(AppAssets.icPersonSvg),
                    ),
                    controller: nameController,
                    validator: (text) {
                      if (text?.isEmpty == true) return "Please valid name";
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    hint: "Address",
                    prefixIcon: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(AppAssets.icPersonSvg),
                    ),
                    controller: addressController,
                    validator: (text) {
                      if (text?.isEmpty == true) return "Please valid address";
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    hint: "phone number",
                    prefixIcon: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(AppAssets.icPersonSvg),
                    ),
                    controller: phoneController,
                    validator: (text) {
                      if (text?.isEmpty == true || text!.length < 11)
                        return "Please valid phone number";
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    hint: "Enter your email",
                    prefixIcon: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(AppAssets.icEmailSvg),
                    ),
                    controller: emailController,
                    validator: (text) {
                      if (text?.isEmpty == true) return "Please valid email";
                      var isValid = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
                      ).hasMatch(text!);
                      if (!isValid) return "this email is in invalid form";
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    hint: "Enter your password",
                    suffixIcon: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                          fit: BoxFit.scaleDown,
                          AppAssets.icEyeClosedSvg),
                    ),
                    prefixIcon: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(AppAssets.icLockSvg),
                    ),
                    controller: passwordController,
                    validator: (text) {
                      if (text == null || text.isEmpty == true)
                        return "Please enter valid password";
                      if (text.length < 6) {
                        return "Your password is weak";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  AppTextField(
                    hint: "Confirm your password",
                    suffixIcon: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                          fit: BoxFit.scaleDown,
                          AppAssets.icEyeClosedSvg),
                    ),
                    prefixIcon: SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(AppAssets.icLockSvg),
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty == true)
                        return "Please enter valid password";
                      if (text != passwordController.text)
                        return "Password does not match";
                      return null;
                    },
                  ),
                  const SizedBox(height: 48),
                  buildRegisterButton(),
                  const SizedBox(height: 48),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, AppRoutes.login);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?  ",
                          style: AppTextStyles.grey14Regular,
                        ),
                        Text(
                          "Login",
                          style: AppTextStyles.blue14SemiBold.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    "Or",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.blue14SemiBold,
                  ),
                  const SizedBox(height: 32),
                  buildGoogleSignInButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  EventlyButton buildRegisterButton() => EventlyButton(
    text: "Register",
    onPress: () async {
      if (!formKey.currentState!.validate()) return;
      showLoading(context);


      await FirebaseUtils.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        address: addressController.text,
        phoneNumber: phoneController.text,
        onSuccess: (user) {
          UserDM.currentUser = user;
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, '/home');
        },
        onError: (message) {
          Navigator.pop(context);
          showMessage(context, message, title: "Error", posText: "ok");
        },
      );
    },
  );

  EventlyButton buildGoogleSignInButton() {
    return EventlyButton(
      text: "Sign up with Google",
      onPress: () async {
        //Todo: Implement google sign in
      },
      backgroundColor: AppColors.white,
      textStyle: AppTextStyles.blue18Medium,
      icon: SizedBox(
        width: 24,
        height: 24,
        child: SvgPicture.asset(AppAssets.icons8google),
      ),
    );
  }
}