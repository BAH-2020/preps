import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:preps/models/section_model.dart';
import 'package:preps/services/section_service.dart';

part 'section_event.dart';
part 'section_state.dart';

class SectionBloc extends Bloc<SectionEvent, SectionState> {
  SectionBloc() : super(SectionInitial());

  @override
  Stream<SectionState> mapEventToState(
    SectionEvent event,
  ) async* {
    if (event is GetSections) {
      yield* _mapGetSectionsToState(event);
    }
  }

  Stream<SectionState> _mapGetSectionsToState(event) async* {
    /// 1. fetch sections from server
    yield Loading();
    try {
      final sectionService = new SectionService();
      final List<Section> data = await sectionService.getSection();
      yield Loaded(sections: data);
    } catch (e) {
      yield Failure();
    }
  }
}

///     json -> dataModel

/// 2. holding sections data in state

/// 3. state -> view
///
