import 'package:common/common_lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../styles/app_size.dart';

///ignore: must_be_immutable
class PagingView extends StatelessWidget {
  final Widget child;
  final Function() onLoadNextPage;
  final Future<void> Function()? onRefresh;

  ScrollController? scrollController;

  late final _debouncer = Debouncer(milliseconds: 500);

  PagingView({
    Key? key,
    required this.child,
    required this.onLoadNextPage,
    this.onRefresh,
    this.scrollController,
  }) : super(key: key) {
    scrollController ??= ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollController != null) {
          var triggerFetchMoreSize =
              0.75 * scrollController!.position.maxScrollExtent;

          if (scrollController!.position.pixels >= triggerFetchMoreSize &&
              (scrollController!.position.userScrollDirection ==
                  ScrollDirection.reverse)) {
            _debouncer.run(() {
              onLoadNextPage();
            });
          }
        }

        return true;
      },
      child: onRefresh == null
          ? _getScrollableView()
          : RefreshIndicator(
              onRefresh: onRefresh!,
              child: _getScrollableView(),
            ),
    );
  }

  SingleChildScrollView _getScrollableView() {
    return SingleChildScrollView(
      controller: scrollController,
      child: Column(
        children: [
          child,
          SizedBox(height: AppSize.listBottomEmptySpace),
        ],
      ),
    );
  }
}
