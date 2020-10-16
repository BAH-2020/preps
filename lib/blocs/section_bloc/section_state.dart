part of 'section_bloc.dart';

@immutable
abstract class SectionState {}

class SectionInitial extends SectionState {}

class Loading extends SectionState {}

// const List<Section> sections = <Section>[
//   Section(id: 'all', title: 'All'),
//   Section(id: 'hot', title: 'Hot'),
//   Section(id: 'cool', title: 'Cool'),
// ];

class Loaded extends SectionState {
  final List<Section> sections;

  Loaded({this.sections});
}

class Failure extends SectionState {}
