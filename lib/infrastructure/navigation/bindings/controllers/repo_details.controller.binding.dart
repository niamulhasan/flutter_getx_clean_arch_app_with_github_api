import 'package:get/get.dart';

import '../../../../presentation/repo_details/controllers/repo_details.controller.dart';

class RepoDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RepoDetailsController>(
      () => RepoDetailsController(),
    );
  }
}
