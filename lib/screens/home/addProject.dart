import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:project_progress_app/services/auth.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String _locationMessage = "";
  Geolocator location;
  TextEditingController _name = TextEditingController();
  TextEditingController _location = TextEditingController();

  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Project'),
        backgroundColor: Colors.blueGrey,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/d.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
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
                    labelText: "Project Name:",
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
                    labelText: "Location:",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Location: $_locationMessage"),
                        trailing: Icon(Icons.location_city),
                        onTap: _getCurrentLocation,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.blueGrey,
                  ),
                  child: MaterialButton(
                      onPressed: () {
                        addProject(
                            _name.text, _location.text, _locationMessage);
                        Navigator.of(context).pop();
                      },
                      child: Text("Save",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20))),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
