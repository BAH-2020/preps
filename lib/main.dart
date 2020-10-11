import 'package:flutter/material.dart';
import 'section_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

const List<Section> sections = <Section>[
  Section(id: 'all', title: 'All'),
  Section(id: 'hot', title: 'Hot'),
  Section(id: 'cool', title: 'Cool'),
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: sections.length,
      child: Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  onPressed: () {})
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(25),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      indicatorColor: Colors.black,
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black45,
                      tabs: sections.map<Widget>((Section section) {
                        return Tab(text: section.title);
                      }).toList())),
            )),
        body: TabBarView(
          children: [
            Tab(text: 'section All selected'),
            Tab(text: 'section Hot selected'),
            Tab(text: 'section Cool selected'),
          ],
        ),
        // body: SingleChildScrollView(
        //       child: Column(
        //         children: [
        //           DatePicker(),
        //         ],
        //       ),
        //     ),
      ),
    ));
  }
}

class DatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _buildDatePickerListItem();
        },
        itemCount: 3,
      ),
    );
  }

  Widget _buildDatePickerListItem({bool active = false}) {
    final Color activeColor = active ? Colors.black : Colors.transparent;
    final Color activeTextColor = active ? Colors.white : Colors.black;
    final double size = 32;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Text(
            'M',
            style: TextStyle(
              color: Colors.black26,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 2),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size),
              color: activeColor,
            ),
            height: size,
            width: size,
            child: Center(
              child: Text(
                '10',
                style: TextStyle(
                  color: activeTextColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
