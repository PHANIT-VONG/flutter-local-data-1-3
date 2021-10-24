import 'package:flutter/material.dart';
import 'package:flutter_local_data/controller/people_controller.dart';
import 'package:flutter_local_data/model/people_model.dart';
import 'package:flutter_local_data/page/show_people_page.dart';
import 'package:flutter_local_data/widget/textfield_widget.dart';

class SqliteTestPage extends StatefulWidget {
  const SqliteTestPage({Key? key}) : super(key: key);

  @override
  _SqliteTestPageState createState() => _SqliteTestPageState();
}

class _SqliteTestPageState extends State<SqliteTestPage> {
  var _nameController = TextEditingController();
  var _sexController = TextEditingController();
  var _addressController = TextEditingController();
  var _id;

  @override
  void initState() {
    super.initState();
    _id = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqlite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFieldWidget(
              labelText: 'Name',
              controller: _nameController,
            ),
            TextFieldWidget(
              labelText: 'Gender',
              controller: _sexController,
            ),
            TextFieldWidget(
              labelText: 'Addrees',
              controller: _addressController,
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              height: 50.0,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () async {
                  await PeopleController().insertPeople(
                    PeopleModel(
                      id: _id.toString(),
                      name: _nameController.text,
                      sex: _sexController.text,
                      address: _addressController.text,
                    ),
                  );
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => ShowPeoplePage()),
                      (route) => false);
                  print('People inserted');
                },
                child: Text('INSERT PEOPLE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
