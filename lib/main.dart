import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sambadev/Pages/rooms.dart';
import 'package:sambadev/models/manager.dart';
import 'package:sambadev/widget_tree.dart';
import 'firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

Future<void> showNotification(RemoteMessage message) async {
  const NotificationDetails notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'channel_id',
      'Channel name',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
    ),
  );
  await FlutterLocalNotificationsPlugin().show(
    0,
    message.notification!.title,
    message.notification!.body,
    notificationDetails,
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging message = FirebaseMessaging.instance;
  Manager manager = Manager();
  await message.getToken().then((value) => manager.token = value);

  NotificationSettings settings = await message.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      sound: true);

  if (kDebugMode) {
    print('Permission granted: ${settings.authorizationStatus}');
  }
  BehaviorSubject<RemoteMessage> tokenStream = BehaviorSubject<RemoteMessage>();
  FirebaseMessaging.onMessage.listen((event) {
    if (kDebugMode) {
      print("onMessage: ${event.data}");
    }
    tokenStream.add(event);
    tokenStream.sink.add(event);
    showNotification(event);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: 'Ibn Rochd',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF387DBF)),
        useMaterial3: true,
      ),
      home: const Rooms(),
    );
  }
}
