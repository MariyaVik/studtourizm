import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import 'common/close_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(children: [
              Container(
                  color: mainColor,
                  child: const Center(child: Text('Onboarding'))),
              Container(
                  color: greyLight,
                  child: const Center(child: Text('Onboarding'))),
              Container(
                  color: backColor,
                  child: const Center(child: Text('Onboarding'))),
              Container(
                  color: greyDark,
                  child: const Center(child: Text('Onboarding'))),
            ]),
            CloseButtonMy(
              routeName: 'home',
              xColor: greyDark,
              backColor: Colors.white.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }
}
