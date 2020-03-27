
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';



class TestHardware extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text ("Test Your Hardware"),
      ),
      body: Center(
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Press this button to test your hardware."  +  '\n' + 'The plant will be watered.' + '\n' + 'The LEDs will flash.' + '\n' + 'The heater will be turned on.' + '\n'),
            RaisedButton(
              child: Text("Test All Hardware"),
              onPressed: _updateTestAllDatabase,
              color: Colors.grey,
              textColor: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
            RaisedButton(
              child: Text("   Test Watering    "),
              onPressed: _updateTestWaterDatabase,
              color: Colors.grey,
              textColor: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
            RaisedButton(
              child: Text("       Test LEDs       "),
              onPressed: _updateTestLightDatabase,
              color: Colors.grey,
              textColor: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
            RaisedButton(
              child: Text("     Test Heater      "),
              onPressed: _updateTestHeaterDatabase,
              color: Colors.grey,
              textColor: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
//            RaisedButton(
//              child: Text("Test Lid"),
//              onPressed: _updateTestLidDatabase,
//              color: Colors.grey,
//              textColor: Colors.black,
//              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//              splashColor: Colors.grey,
//            ),
          ],
        ),
      ),
    );
  }

  _updateTestAllDatabase() {
    FirebaseDatabase.instance.reference().child("HardwareTest").update(
        {"All": "True"}
    );
  }
  _updateTestWaterDatabase() {
    FirebaseDatabase.instance.reference().child("HardwareTest").update(
        {"Water": "True"}
    );
  }
  _updateTestLightDatabase() {
    FirebaseDatabase.instance.reference().child("HardwareTest").update(
        {"Light": "True"}
    );
  }
  _updateTestHeaterDatabase() {
    FirebaseDatabase.instance.reference().child("HardwareTest").update(
        {"Heater": "True"}
    );
  }
  _updateTestLidDatabase() {
    FirebaseDatabase.instance.reference().child("HardwareTest").update(
        {"Lid": "True"}
    );
  }
}