import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifitionAPI {
  static final _notif = FlutterLocalNotificationsPlugin();
  static Future _notifDetails() async {
    // var initializationSettingsAndroid =
    //     AndroidInitializationSettings('@mipmap/ic_launcher');
    return NotificationDetails(
        android: AndroidNotificationDetails("channelId", "channelName",
            channelDescription: 'channelDescription',
            icon: 'logo_only',
            importance: Importance.max));
  }

  static Future showNatifition(
          {int id = 0,
          String? title,
          String? body,
          String? showedText}) async =>
      _notif.show(id, title, body, await _notifDetails(), payload: showedText);
}
