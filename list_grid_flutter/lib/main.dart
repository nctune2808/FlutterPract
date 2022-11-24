import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _users = List.filled(20, "Name");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: Colors.white70,
            appBar: AppBar(
              bottom: TabBar(
                tabs: [Text("List"), Text("Grid")],
              ),
            ),
            body: _contentListView()
            // TabBarView(
            //   children: [
            //     _contentListView(),
            //     _contentGridView(),
            //   ],
            // ),
            ),
      ),
    );
  }

  Widget _contentListView() {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Flex(direction: Axis.vertical, children: [
        Container(
          alignment: Alignment.center,
          height: 1000,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) => Container(
              width: 100,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 24,
                itemBuilder: (ncontext, nindex) => Card(
                  child: ListTile(
                    title: Text(nindex.toString()),
                    onTap: () => print("$index at $nindex"),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _contentGridView() {
    return GridView.builder(
      itemCount: 4,
      // itemCount: _users.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisExtent: 500,
      ),
      itemBuilder: (context, gindex) => Card(
          child: SingleChildScrollView(
        child: Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _users.length,
            itemBuilder: (context, lindex) => Card(
              child: ListTile(
                title: Text(_users[lindex]),
                onTap: () => print("$gindex & $lindex"),
              ),
            ),
          ),
        ),
      )),
    );
  }
  // Widget _contentGridView() {
  //   return GridView.builder(
  //     itemCount: 4,
  //     // itemCount: _users.length,
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 4,
  //       mainAxisExtent: 500,
  //     ),
  //     itemBuilder: (context, gindex) => Card(
  //         child: SingleChildScrollView(
  //       child: Flexible(
  //         child: ListView.builder(
  //           shrinkWrap: true,
  //           physics: NeverScrollableScrollPhysics(),
  //           itemCount: _users.length,
  //           itemBuilder: (context, lindex) => Card(
  //             child: ListTile(
  //               title: Text(_users[lindex]),
  //               onTap: () => print("$gindex & $lindex"),
  //             ),
  //           ),
  //         ),
  //       ),
  //     )),
  //   );
  // }
}
