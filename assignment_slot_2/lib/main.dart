import 'package:flutter/material.dart';

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
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
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
    double deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    double containerMargin = 5;
    const String appTitle = 'Flutter layout demo';

    return MaterialApp(
        title: appTitle,
        home: Scaffold(
            body: Container(
              child: Column(
                children: [
                  Row(children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(containerMargin),
                          height: deviceHeight / 3 - containerMargin * 2,
                          width: deviceWidth / 2 - containerMargin * 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(containerMargin),
                          height: deviceHeight / 3 - containerMargin * 2,
                          width: deviceWidth / 2 - containerMargin * 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.orange,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(containerMargin),
                          height: deviceHeight / 6 - containerMargin * 2,
                          width: deviceWidth / 2 - containerMargin * 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(containerMargin),
                                  height: deviceHeight / 3 -
                                      containerMargin * 2,
                                  width: deviceWidth / 4 - containerMargin * 2,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(containerMargin),
                                  height: deviceHeight / 6 -
                                      containerMargin * 2,
                                  width: deviceWidth / 4 - containerMargin * 2,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(containerMargin),
                                  height: deviceHeight / 6 -
                                      containerMargin * 2,
                                  width: deviceWidth / 4 - containerMargin * 2,
                                  decoration: BoxDecoration(
                                    color: Colors.brown,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(containerMargin),
                                  height: deviceHeight / 3 -
                                      containerMargin * 2,
                                  width: deviceWidth / 4 - containerMargin * 2,
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(containerMargin),
                            height: deviceHeight / 6 - containerMargin * 2,
                            width: deviceWidth / 4 * 3 - containerMargin * 2,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(containerMargin),
                            height: deviceHeight / 6 - containerMargin * 2,
                            width: deviceWidth / 4 - containerMargin * 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.purple,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(containerMargin),
                            height: deviceHeight / 6 - containerMargin * 2,
                            width: deviceWidth - containerMargin * 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue,
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )));
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );
  }
}
