import 'package:flutter/material.dart';
import 'package:zkassa_sco/components/drag_scroll_behavior.dart';
import 'package:zkassa_sco/pages/start_page.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    //titleBarStyle: TitleBarStyle.hidden,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    //await windowManager.setFullScreen(true);
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(brightness: Brightness.dark, seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const StartPage(),
      scrollBehavior: DragScrollBehavior(),
    );
  }
}
