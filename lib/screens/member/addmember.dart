import 'package:flutter/material.dart';
import 'package:project_progress_app/services/auth.dart';

class AddMembers extends StatefulWidget {
  @override
  _AddMembersState createState() => _AddMembersState();
}

class _AddMembersState extends State<AddMembers> {
  TextEditingController _name = TextEditingController();
  TextEditingController _location = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Member'),
        backgroundColor: Colors.blue[400],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              TextFormField(
                style: TextStyle(color: Colors.black),
                controller: _name,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  labelText: "Members Name:",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextFormField(
                style: TextStyle(color: Colors.black),
                controller: _location,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Colors.black,
                  ),
                  labelText: "Members Position:",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 35),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.green,
                ),
                child: MaterialButton(
                    onPressed: () {
                      addMembers(_name.text, _location.text);
                      Navigator.of(context).pop();
                    },
                    child: Text("Save")),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
