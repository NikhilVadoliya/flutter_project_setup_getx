import 'package:bronco_trucking/enum/font_type.dart';
import 'package:bronco_trucking/ui/common/asset_images.dart';
import 'package:bronco_trucking/ui/common/widgets/app_theme.dart';
import 'package:bronco_trucking/ui/common/widgets/brouco_text_form_field.dart';
import 'package:bronco_trucking/ui/common/widgets/rounder_button.dart';
import 'package:flutter/material.dart';
import 'package:bronco_trucking/ui/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:bronco_trucking/di/app_core.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Image.asset(
              PNGPath.appLogo,
              height: 110.h,
            ),
            const Spacer(),
            Form(
              key: controller.loginFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BroncoTextFormField(
                        leftIcon: Icons.mail,
                        hintText: StringConstants.hintEmail,
                        validator: controller.usernameValidator,
                        controller: controller.userEmailController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BroncoTextFormField(
                        obscureText: true,
                        leftIcon: Icons.lock,
                        hintText: StringConstants.hintPassword,
                        controller: controller.passwordController,
                        validator: controller.passwordValidator,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Obx(() => _Iam(
                            controller: controller,
                            groupValue: controller.iamGroupValue.value,
                          )),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: RounderButton(
                text: StringConstants.btnSignIn,
                onPress: () => controller.btnSignInPress(),
              ),
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}

class _Iam extends StatelessWidget {
  final int groupValue;
  final LoginController controller;

  const _Iam({
    required this.groupValue,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _RadioItem(
          value: 1,
          loginController: controller,
          groupValue: groupValue,
          text: StringConstants.admin,
        ),
        const SizedBox(
          height: 20,
        ),
        _RadioItem(
          value: 2,
          loginController: controller,
          groupValue: groupValue,
          text: StringConstants.customer,
        ),
        const SizedBox(
          height: 20,
        ),
        _RadioItem(
          value: 3,
          loginController: controller,
          groupValue: groupValue,
          text: StringConstants.drive,
        )
      ],
    );
  }
}

class _RadioItem extends StatelessWidget {
  final LoginController loginController;
  final int groupValue;
  final String text;
  final int value;

  const _RadioItem({
    required this.loginController,
    required this.groupValue,
    required this.value,
    Key? key,
    this.text = 'Text',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20,
          width: 40,
          child: Radio(
            value: value,
            groupValue: groupValue,
            activeColor: AppTheme.of(context).primaryColor,
            onChanged: (_) {
              loginController.onRadioTap(value);
            },
          ),
        ),
        GestureDetector(
          onTap: () => loginController.onRadioTap(value),
          child: Text(
            '${StringConstants.labelIam} $text',
            style: const TextStyle(
                color: Colors.black,
                letterSpacing: 1,
                fontFamily: FontFamily.OpenSans,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
