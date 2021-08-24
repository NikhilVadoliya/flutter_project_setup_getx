import 'package:get/get.dart';

class GlobalController extends GetxController {
  //for global
  RxString lastUpdate = '-'.obs;

  @override
  void onInit() {
    super.onInit();
    lastUpdate.value = '1';
  }
}
