import 'package:flutter_local_data/model/people_model.dart';
import 'package:flutter_local_data/repos/repository.dart';

class PeopleController {
  late Repository _repository;
  PeopleController() {
    this._repository = Repository();
  }

  Future<void> insertPeople(PeopleModel peopleModel) {
    return _repository.insertPeople('tbPeople', peopleModel.toMap());
  }

  Future<List<PeopleModel>> selectPeople() async {
    var response = await _repository.selectPeople('tbPeople') as List;
    List<PeopleModel> peopleList = [];
    response.map((item) {
      return peopleList.add(PeopleModel.fromJson(item));
    }).toList();
    return peopleList;
  }

  Future<void> deletePeople(String printerId) {
    return _repository.deletePeople('tbPeople', printerId);
  }

  Future<void> updatePeople(PeopleModel peopleModel) {
    return _repository.updatePeople(
      'tbPeople',
      peopleModel.toMap(),
      peopleModel.id,
    );
  }
}
