import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_frontend/src/screens/about_screen.dart';
import 'package:web_frontend/src/screens/accept_users.dart';
import 'package:web_frontend/src/screens/add_matches.dart';
import 'package:web_frontend/src/screens/add_stadium.dart';
import 'package:web_frontend/src/screens/delete_users.dart';
import 'package:web_frontend/src/screens/home_screen.dart';
import 'package:web_frontend/src/screens/login_screen.dart';
import 'package:web_frontend/src/screens/main_screen.dart';
import 'package:web_frontend/src/screens/match_info_screen.dart';
import 'package:web_frontend/src/screens/prev_matches_screen.dart';
import 'package:web_frontend/src/screens/signup_screen.dart';
import 'package:web_frontend/src/screens/upcoming_matches_screen.dart';
import 'package:web_frontend/src/screens/profile_screen.dart';
import 'package:web_frontend/src/screens/tickets_screen.dart';
import 'package:web_frontend/src/screens/edit_match.dart';
import './src/models/match.dart';

void main() async {
  // await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // check cache for token
    // if token exists, check if admin or not
    // if admin, navigate to accept users screen
    // else navigate to home screen
    // else navigate to login screen
    // var prefs = SharedPreferences.getInstance()
    return MaterialApp(
      title: 'FIFA Tickets',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => HomeScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => LoginScreen(
              admin: false,
            ),
        '/home': (context) => HomeScreen(),
        '/upcoming_matches': (context) => UpcomingMatchesScreen(),
        '/previous_matches': (context) => PreviousMatchesScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/about': (context) => AboutScreen(),
        '/profile': (context) => profile(),
        '/match_info': (context) => MatchInfoScreen(id: 1),
        '/tickets': (context) => TicketsScreen(),
        '/add_match': (context) => AddMatchesScreen(),
        '/admin_login': (context) =>
            LoginScreen(admin: true), // admin login screen
        '/accept_users': (context) => AcceptUsersScreen(),
        '/edit_match': (context) => EditMatchScreen(
              match: Match(),
            ),
        '/add_stadium': (context) => AddStadiumScreen(),
        '/delete_users': (context) => DeleteUsersScreen(),
      },
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        // Mouse dragging enabled for this demo
        dragDevices: PointerDeviceKind.values.toSet(),
      ),
      debugShowCheckedModeBanner: false,

      // home: LoginScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
