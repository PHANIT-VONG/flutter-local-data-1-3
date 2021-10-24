import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _nameController = TextEditingController();
  var _name;

  _selectName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? 'NoName';
    });
  }

  @override
  void initState() {
    super.initState();
    _selectName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Data'),
      ),
      body: _name != null
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    style: TextStyle(fontSize: 20.0),
                    decoration: InputDecoration(
                      labelText: 'Enter Name',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    height: 50.0,
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setString('name', _nameController.text);
                        setState(() {
                          _name = prefs.getString('name') ?? 'NoName';
                          _nameController.clear();
                          print('Name = $_name');
                        });
                      },
                      child: Text('SUBMIT DATA'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16.0),
                    height: 50.0,
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.remove('name');
                        setState(() {
                          _name = prefs.getString('name') ?? 'NoName';
                          _nameController.clear();
                          print('Name = $_name');
                        });
                      },
                      child: Text('REMOVE DATA'),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text('Name : $_name', style: TextStyle(fontSize: 20.0)),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
