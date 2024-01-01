import 'package:flutter/material.dart';
import 'ffi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.from(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
      ),
      // If you use night mode on your device by default, try changing the settings
      // here as well and see how it changes after reloads. You can press "b" in the
      // console to force a specific brightness mode.
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
          brightness: Brightness.dark,
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("You're running on"),
            // To render the results of a Future, a FutureBuilder is used which
            // turns a Future into an AsyncSnapshot, which can be used to
            // determine if an error was encountered, data is ready or otherwise.
            FutureBuilder(
              // While we usually pass a Future<T> to this parameter in order to extract T,
              // in this case we are just using the FutureBuilder
              // to wait for bridge initialization to complete.
              future: initialized,
              builder: (context, snap) {
                final style = Theme.of(context).textTheme.headlineMedium;
                if (snap.error != null) {
                  // An error has been encountered, so give an appropriate response and
                  // pass the error details to an unobstructive tooltip.
                  debugPrint(snap.error.toString());
                  return Tooltip(
                    message: snap.error.toString(),
                    child: Text('Unknown OS', style: style),
                  );
                }

                if (snap.connectionState != ConnectionState.done) {
                  return const CircularProgressIndicator();
                }

                final releaseText = rustReleaseMode() ? 'Release' : 'Debug';

                // Another feature introduced in Dart 3 is switch expressions,
                // allowing exhaustive matching over enums or sealed classes
                // similar to Rust's match expressions. Note that all possible values
                // of Platform are present here; should additional values be added,
                // this expression would not compile.
                final text = switch (platform()) {
                  Platform.android => 'Android',
                  Platform.ios => 'iOS',
                  Platform.macApple => 'MacOS with Apple Silicon',
                  Platform.macIntel => 'MacOS',
                  Platform.windows => 'Windows',
                  Platform.unix => 'Unix',
                  Platform.wasm => 'the Web',
                  Platform.unknown => 'Unknown OS',
                };
                return Text('$text ($releaseText)', style: style);
              },
            )
          ],
        ),
      ),
    );
  }
}
