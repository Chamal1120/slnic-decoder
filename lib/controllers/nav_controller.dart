import 'package:get/get.dart';

/// A controller for managing the navigation state of the application.
///
/// This controller holds the index of the currently selected page and allows
/// updating the page index to navigate between different sections of the app.
class NavController extends GetxController {
  /// The index of the currently selected page.
  /// 
  /// It is observable, so any changes to `selectedPage` will trigger UI updates.
  var selectedPage = 0.obs;

  /// Updates the selected page to the provided index.
  ///
  /// This method updates the `selectedPage` to the given `page` index,
  /// which determines the current page being displayed.
  ///
  /// **Parameters:**
  /// - `page`: The index of the page to select.
  void changePage(int page) {
    selectedPage.value = page;
  }
}

