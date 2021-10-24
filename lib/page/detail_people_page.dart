import 'package:flutter/material.dart';
import 'package:flutter_local_data/controller/people_controller.dart';
import 'package:flutter_local_data/model/people_model.dart';
import 'package:flutter_local_data/page/show_people_page.dart';
import 'package:flutter_local_data/widget/textfield_widget.dart';

class DetailPeoplePage extends StatefulWidget {
  const DetailPeoplePage({Key? key, required this.peopleModel})
      : super(key: key);

  final PeopleModel peopleModel;

  @override
  _DetailPeoplePageState createState() => _DetailPeoplePageState();
}

class _DetailPeoplePageState extends State<DetailPeoplePage> {
  var _nameController = TextEditingController();
  var _sexController = TextEditingController();
  var _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.peopleModel.name;
    _sexController.text = widget.peopleModel.sex;
    _addressController.text = widget.peopleModel.address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit People'),
        actions: [
          TextButton(
            onPressed: () async {
              await PeopleController().updatePeople(
                PeopleModel(
                  id: widget.peopleModel.id,
                  name: _nameController.text,
                  sex: _sexController.text,
                  address: _addressController.text,
                ),
              );
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => ShowPeoplePage()),
                  (route) => false);
              print('People updated');
            },
            child: Text(
              'UPDATE PEOPLE',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
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
                  await PeopleController().deletePeople(widget.peopleModel.id);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => ShowPeoplePage()),
                      (route) => false);
                  print('People inserted');
                },
                child: Text('DELETE PEOPLE'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
