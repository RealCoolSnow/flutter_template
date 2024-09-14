import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_template/app/core/base/controller/base_controller.dart';

abstract class BasePagingController<T> extends BaseController {
  final PagingController<int, T> _pagingController =
      PagingController(firstPageKey: 0);

  void fetchPage(int pageKey);

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
