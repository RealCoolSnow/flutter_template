import 'package:flutter/material.dart';
import '../styles/app_color.dart';
import '../styles/app_size.dart';
import '/app/core/widget/elevated_container.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedContainer(
        padding: EdgeInsets.all(AppSize.margin),
        child: const CircularProgressIndicator(
          color: AppColor.primary,
        ),
      ),
    );
  }
}
