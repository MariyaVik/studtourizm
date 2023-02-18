import 'package:flutter/material.dart';
import 'package:studtourizm/services/notifition_api.dart';

import '../../theme/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo_only.png', height: 44, width: 54),
            Text('студтуризм.рф',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 11)),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/exit.png',
                  height: 24, color: mainColor)),
        ],
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => NotifitionAPI.showNatifition(
                title: 'Студтуризм.рф',
                body: 'Ваша заявка одобрена университетом!',
                showedText: 'Вот тебе 5 баллов'),
            child: Text('Отправить уведомление')),
      ),
    );
  }
}
