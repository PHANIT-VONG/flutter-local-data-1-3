import 'package:flutter/material.dart';
import 'package:flutter_local_data/controller/people_controller.dart';
import 'package:flutter_local_data/model/people_model.dart';
import 'package:flutter_local_data/page/detail_people_page.dart';
import 'package:flutter_local_data/page/sqlite_test_page.dart';

class ShowPeoplePage extends StatefulWidget {
  const ShowPeoplePage({Key? key}) : super(key: key);

  @override
  _ShowPeoplePageState createState() => _ShowPeoplePageState();
}

class _ShowPeoplePageState extends State<ShowPeoplePage> {
  List<PeopleModel> _list = [];
  _selectPeople() async {
    await PeopleController().selectPeople().then((value) {
      if (value.isNotEmpty) {
        setState(() {
          _list.addAll(value);
        });
      } else {
        print('No People');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _selectPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('People List')),
      body: _list.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                var _data = _list[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPeoplePage(peopleModel: _data),
                      ),
                    );
                  },
                  title: Text(_data.name + "(${_data.address})"),
                  subtitle: Text(_data.id),
                  trailing: Text(_data.sex),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey,
                );
              },
              itemCount: _list.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => SqliteTestPage()),
            (route) => false,
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
