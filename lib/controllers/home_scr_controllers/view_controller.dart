import 'package:get/get.dart';

class ViewController extends GetxController {
  // Observable to track the view mode
  var isGridView = true.obs;

  // Method to toggle between grid and list view
  void toggleViewMode() {
    isGridView.value = !isGridView.value;
  }
}
