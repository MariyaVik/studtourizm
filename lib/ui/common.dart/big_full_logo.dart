import 'package:flutter/material.dart';

class BigFullLogo extends StatelessWidget {
  const BigFullLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo_only.png'),
        Text(
          'студтуризм.рф',
          style:
              Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 20),
        )
      ],
    );
  }
}
