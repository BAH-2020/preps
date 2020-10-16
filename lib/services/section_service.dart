import 'package:preps/models/section_model.dart';

abstract class BaseSectionService {
  Future<List<Section>> getSection();
}

class SectionService implements BaseSectionService {
  @override
  Future<List<Section>> getSection() async {
    // response =  http.get('url');
    // deserialize (response.data)  json => Data model
    final data = <Section>[
      Section(id: 'all', title: 'All'),
      Section(id: 'hot', title: 'Hot'),
      Section(id: 'cool', title: 'Cool'),
    ];
    await Future.delayed(Duration(milliseconds: 3000));
    return Future.value(data);
  }
}
