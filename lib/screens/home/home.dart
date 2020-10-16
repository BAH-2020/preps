import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:preps/blocs/section_bloc/section_bloc.dart';
import '../../models/section_model.dart';

/// TODO:
///    yield initial
///    event -> getSections
/// 1. fetch sections from server
///     json -> dataModel
///    yield loading
/// 2. holding sections data in state
///    yield loaded
/// 3. state -> view

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatePickerController _controller = DatePickerController();

  DateTime _currentDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SectionBloc>(
      create: (_) => SectionBloc(),
      child: SafeArea(
        child:
            BlocBuilder<SectionBloc, SectionState>(builder: (context, state) {
          if (state is Loading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is Loaded) {
            return Scaffold(
              body: Center(
                child: Text('loaded'),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: OutlinedButton(
                child: Text('button'),
                onPressed: () => {
                  BlocProvider.of<SectionBloc>(context).add(GetSections()),
                },
              ),
            ),
          );
        }),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return DefaultTabController(
  //     length: sections.length,
  //     child: Builder(
  //       builder: (context) {
  //         if (isLoading) {
  //           return Scaffold(
  //             body: Center(child: CircularProgressIndicator()),
  //           );
  //         } else {
  //           return Scaffold(
  //             appBar: _buildAppBar(),
  //             body: Column(
  //               children: [
  //                 _buildDatePicker(),
  //                 Expanded(
  //                   child: _buildContent(),
  //                 ),
  //               ],
  //             ),
  //           );
  //         }
  //       },
  //     ),
  //   );
  // }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
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
            // tabs: sections.map<Widget>((Section section) {
            //   return Tab(text: section.title);
            // }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker() {
    return DatePicker(
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
          _currentDate = date;
        });
      },
    );
  }

  Widget _buildContent() {
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
