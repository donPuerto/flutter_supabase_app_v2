import 'package:flutter/material.dart';

class RememberMeForgotPasswordWidget extends StatelessWidget {
  final Widget leftWidget;
  final Widget rightWidget;

  const RememberMeForgotPasswordWidget({
    Key? key,
    required this.leftWidget,
    required this.rightWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leftWidget,
        const Spacer(),
        rightWidget,
      ],
    );
  }
}
