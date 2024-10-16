import 'package:get/get.dart';
import 'package:linkear/modules/profile/controllers/edit_profile_picture_controller.dart';

class EditProfilePictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(EditProfilePictureController.new);
  }
}
