import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotifitionAPI {
  static final _notif = FlutterLocalNotificationsPlugin();
  static final onNotif = BehaviorSubject<NotificationResponse?>();
  static Future _notifDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails("channelId", "channelName",
            channelDescription: 'channelDescription',
            icon: 'logo_only',
            importance: Importance.max));
  }

  static Future init({bool initSch = false}) async {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final settings =
        InitializationSettings(android: initializationSettingsAndroid);
    await _notif.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) async {
        onNotif.add(details);
      },
    );
  }

  static Future showNatifition(
          {int id = 0,
          String? title,
          String? body,
          String? showedText}) async =>
      _notif.show(id, title, body, await _notifDetails(), payload: showedText);
}
