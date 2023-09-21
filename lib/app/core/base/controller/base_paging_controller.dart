import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

abstract class BasePagingController<T> extends GetxController {
  final PagingController<int, T> _pagingController =
      PagingController(firstPageKey: 0);

  void fetchPage(int pageKey);

  void refreshPage();
  
  PagingController<int, T> getPagingController() => _pagingController;

  @override
  void onInit() {
    _pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
    super.onInit();
  }

  @override
  void onClose() {
    _pagingController.dispose();
    super.onClose();
  }
}
