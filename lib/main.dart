import 'package:flutter/material.dart';
import 'package:flutter_isolate/services/local_notification_services.dart';
import 'package:flutter_isolate/ui/download_example.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    LocalNotificationService.localNotificationService.init(navigatorKey);
    return MaterialApp(
      title: 'Flutter Isolate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FileDownloadExample(),
    );
  }
}
