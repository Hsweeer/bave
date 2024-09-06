import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LanguageController extends GetxController {
  var isDropdownVisible = false.obs;

  void toggleDropdown() {
    isDropdownVisible.value = !isDropdownVisible.value;
  }
}