import 'package:bronco_trucking/di/api/api_interface.dart';
import 'package:bronco_trucking/models/api_states.dart';
import 'package:bronco_trucking/models/post.dart';
import 'package:get/get.dart';
import 'package:bronco_trucking/di/locator.dart';

class DashboardController extends SuperController<List<Post>> {
  List<Post> postList = [];
  Rx<APIStatus> apiStatus = APIStatus.init().obs;

  @override
  void onInit() {
    super.onInit();
    _getPostListAPI();
    printInfo(info: 'DashboardController, onInit');
  }

  @override
  void onReady() {
    printInfo(info: 'DashboardController, onReady');
    print('The build method is done. '
        'Your controller is ready to call dialogs and snackbars');
    super.onReady();
  }

  @override
  void onClose() {
    printInfo(info: 'DashboardController, onClose');

    print('onClose called');
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    print('the window size did change');
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    print('platform change ThemeMode');
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print('the route $route will be open');
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    print('the current route will be closed');
    return super.didPopRoute();
  }

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }

  Future<void> _getPostListAPI() async {
    Response response = await getIt.get<APIProvider>().getPosts();
    if (response.isOk) {
      postList = response.body as List<Post>;
      apiStatus.value = APIStatus();
    } else {
      apiStatus.value = APIStatus(isOk: false);
    }
  }
}
