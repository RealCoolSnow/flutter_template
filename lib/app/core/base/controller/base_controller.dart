import 'package:get/get.dart';

import '/app/core/model/page_state.dart';

abstract class BaseController extends GetxController {
  
  //Reload the page
  final _refreshController = false.obs;

  bool refreshPage(bool refresh) => _refreshController(refresh);

  //Controls page state
  final _pageSateController = PageState.DEFAULT.obs;

  PageState get pageState => _pageSateController.value;

  PageState updatePageState(PageState state) => _pageSateController(state);

  PageState resetPageState() => _pageSateController(PageState.DEFAULT);

  void showLoading() => updatePageState(PageState.LOADING);

  void hideLoading() => resetPageState();

  final _messageController = ''.obs;

  String get message => _messageController.value;

  String showMessage(String msg) => _messageController(msg);

  final _errorMessageController = ''.obs;

  String get errorMessage => _errorMessageController.value;

  void showErrorMessage(String msg) {
    _errorMessageController(msg);
  }

  final _successMessageController = ''.obs;

  String get successMessage => _messageController.value;

  void showSuccessMessage(String msg) => _successMessageController(msg);

  @override
  void onClose() {
    _messageController.close();
    _refreshController.close();
    _pageSateController.close();
    super.onClose();
  }
}
