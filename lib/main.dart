import 'package:date_picker_timeline/date_picker_timeline.dart';
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
              preferredSize: Size.fromHeight(20),
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
        body: Column(
          children: [CustomDatePicker(), Expanded(child: SectionContent())],
        ),
      ),
    ));
  }
}

class SectionContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: TabBarView(
      children: [
        Tab(text: 'section All selected'),
        Tab(text: 'section Hot selected'),
        Tab(text: 'section Cool selected'),
      ],
    ));
  }
}

class CustomDatePicker extends StatefulWidget {
  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Container(
              child: DatePicker(
            DateTime.now(),
            width: 60,
            height: 80,
            controller: _controller,
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.black,
            selectedTextColor: Colors.white,
            // inactiveDates: [],
            onDateChange: (date) {
              // New date selected
              setState(() {
                _selectedValue = date;
              });
            },
          ))
        ]));
  }
}
