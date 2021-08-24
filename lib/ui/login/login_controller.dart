import 'package:flutter/cupertino.dart';
import 'package:bronco_trucking/di/api/api_interface.dart';
import 'package:bronco_trucking/di/app_core.dart';
import 'package:bronco_trucking/ui/common/routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController userEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxInt iamGroupValue = 1.obs;

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  void onRadioTap(int type) => iamGroupValue.value = type;

  @override
  void onInit() {
    super.onInit();
    printInfo(info: 'LoginController,onInit ');
  }

  @override
  void onClose() {
    super.onClose();
    userEmailController.dispose();
    passwordController.dispose();
    printInfo(info: 'LoginController,onClose');
  }

  String? usernameValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return StringConstants.errorEmptyField;
    } else if (!GetUtils.isEmail(value!)) {
      return StringConstants.errorInvalidEmailField;
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return StringConstants.errorEmptyField;
    } else if (value!.length < 6) {
      return StringConstants.errorPasswordLengthField;
    } else {
      return null;
    }
  }

  Future<void> btnSignInPress() async {
    if (loginFormKey.currentState!.validate()) {
      AppComponentBase.instance.showProgressDialog();
      final Response response =
          await AppComponentBase.instance.apiProvider.getPosts();
      if (response.isOk) {
        Get.snackbar(response.statusText ?? '', '');
        // Get.offAndToNamed(RouteName.dashboard);
      } else {
        Get.snackbar(response.statusText ?? '', '');
      }
      AppComponentBase.instance.hideProgressDialog();
    }
  }
}
