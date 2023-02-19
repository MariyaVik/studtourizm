import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:studtourizm/services/notifition_api.dart';
import 'package:studtourizm/ui/navigation.dart';

import '../../theme/theme.dart';
import '../app.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    NotifitionAPI.init();
    listenNotification();
  }

  void listenNotification() =>
      NotifitionAPI.onNotif.stream.listen(onClickNotif);
  void onClickNotif(NotificationResponse? details) {
    mainNavigatorKey.currentState!.pushNamed(AppNavRouteName.notif);
  }

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
              onPressed: () {
                Navigator.of(context).pushNamed(AppNavRouteName.notif);
              },
              icon: Icon(Icons.notifications, size: 24, color: mainColor)),
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/exit.png',
                  height: 24, color: mainColor)),
        ],
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // NotifitionAPI.showNatifition(
              //     title: 'Студтуризм.рф',
              //     body: 'Ваша заявка одобрена университетом!',
              //     showedText: 'Вот тебе 5 баллов');
              NotifitionAPI.showScheduleNatifition(
                  title: 'Студтуризм.рф',
                  body: 'Ваша заявка одобрена университетом!',
                  showedText: 'Вот тебе 5 баллов',
                  scheduleDate: DateTime.now().add(Duration(seconds: 5)));
              final SnackBar snackBar =
                  SnackBar(content: Text('Заявка подана'));
              ScaffoldMessenger.of(context)..showSnackBar(snackBar);
            },
            child: Text('Отправить уведомление')),
      ),
    );
  }
}
