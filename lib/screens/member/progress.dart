import 'package:flutter/material.dart';
import 'package:project_progress_app/models/circle.dart';

class Progress extends StatefulWidget {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  double brightness = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Progress'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomPaint(
              foregroundPainter: CircleProgress(
                  brightness), // this will add custom painter after child
              child: Container(
                  width: 150,
                  height: 150,
                  child: Center(
                      child: Text(
                    "${brightness} %",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))),
            ),
            Slider(
              min: 0.0,
              max: 100.0,
              value: brightness,
              onChanged: (val) {
                setState(() {
                  brightness = val;
                });
              },
              divisions: 10,
            ),
            RaisedButton(
              color: Colors.green[400],
              child: Text(
                'Update',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
