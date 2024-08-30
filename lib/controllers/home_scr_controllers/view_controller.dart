import 'package:get/get.dart';

class ViewController extends GetxController {
  // State variable to track the view mode
  var isGridView = true.obs;

  // Method to toggle between grid and list views
  void toggleView() {
    isGridView.value = !isGridView.value;
  }
}
