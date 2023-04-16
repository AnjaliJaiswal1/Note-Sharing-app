import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_sharing_app/Services/upload_service.dart';
import 'package:provider/provider.dart';

import 'package:note_sharing_app/Hive/logged_in.dart';
import 'package:note_sharing_app/Hive/token/token.dart';
import 'package:note_sharing_app/Hive/user_profile.dart';
import 'package:note_sharing_app/Screens/Register/user_login.dart';
import 'package:note_sharing_app/Services/login_service.dart';
import 'package:note_sharing_app/constants.dart';

import 'Screens/Home/home.dart';
import 'Screens/Home/posts_screen.dart';

late Box box;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataHiveAdapter());
  Hive.registerAdapter(UserProfileDataHiveAdapter());
  Hive.registerAdapter(TokenModelAdapter());
  box = await Hive.openBox("UserInfo");
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LoginService>(create: (_) => LoginService()),
      ChangeNotifierProvider<UploadFileService>(
          create: (_) => UploadFileService()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Note Sharing App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ValueListenableBuilder<Box>(
          valueListenable: box.listenable(),
          builder: (context, userbox, _) {
            UserDataHive? temp = userbox.get(userDataKey);
            UserProfileDataHive? profile = userbox.get(userProfileKey);
            // log("profile data----$profile");
            // log("user data----$temp");
            // return UserLoginPage();
            return temp != null && profile != null
                ? Home(
                    userData: temp,
                  )
                : const UserLoginPage();
          }),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
