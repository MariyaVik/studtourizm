import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class CloseButtonMy extends StatelessWidget {
  final Color backColor;
  final Color xColor;
  final String routeName;
  final double padding;
  const CloseButtonMy(
      {required this.routeName,
      this.backColor = greyLight,
      this.xColor = Colors.white,
      this.padding = 8,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 16,
        top: 64,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(routeName);
          },
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.all(padding),
              backgroundColor: backColor,
              elevation: 0),
          child: Icon(Icons.close, color: xColor),
        ));
  }
}
