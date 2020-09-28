import 'package:flutter/material.dart';

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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'All',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DatePicker(),
          ],
        ),
      ),
    );
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
