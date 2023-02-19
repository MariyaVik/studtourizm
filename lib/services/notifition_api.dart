import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotifitionAPI {
  static final _notif = FlutterLocalNotificationsPlugin();
  static final onNotif = BehaviorSubject<NotificationResponse?>();
  static Future _notifDetails() async {
    const largeIconPath = 'assets/images/univ.png';
    const bigPicturePath = 'assets/images/nature.png';
    const styleInformation = BigPictureStyleInformation(
        FilePathAndroidBitmap(bigPicturePath),
        largeIcon: FilePathAndroidBitmap(largeIconPath));
    return NotificationDetails(
        android: AndroidNotificationDetails("channelId", "channelName",
            channelDescription: 'channelDescription',
            icon: 'logo_only',
            importance: Importance.max,
            styleInformation: styleInformation));
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

  static Future showNatifition({
    int id = 0,
    String? title,
    String? body,
    String? showedText,
  }) async =>
      _notif.show(id, title, body, await _notifDetails(), payload: showedText);

  static Future showScheduleNatifition({
    int id = 0,
    String? title,
    String? body,
    String? showedText,
    required DateTime scheduleDate,
  }) async {
    tz.initializeTimeZones();
    _notif.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduleDate, tz.local),
      await _notifDetails(),
      payload: showedText,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
