import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';


class PlantList extends StatefulWidget {
  const PlantList();
  @override
  _PlantListState createState() => new _PlantListState();
}

class _PlantListState extends State<PlantList> {
bool isSearching = false;
  _updateDatabaseEntry(String name, String light, String temperature,
      String water) {
    FirebaseDatabase.instance.reference().child("Information").child(
        "CurrentPlant").update(
        {
          "Name": name,
          "Light": light,
          "Temperature": temperature,
          "Water": water
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    var plants = FirebaseDatabase.instance.reference().child('Plants');

    return Scaffold(
      appBar: AppBar(
        title: !isSearching ? Text("Choose Your Plant"):
        TextField(
          decoration: InputDecoration(
              hintText: "Search plant",
              icon: Icon(Icons.search),

          ),

        ),
        actions: <Widget>[
          IconButton(
            icon: !isSearching ? Icon(Icons.search) : Icon(Icons.cancel),
            onPressed:() {
              setState(() {
                this.isSearching = !this.isSearching;
              });
            },

          )
        ],
      ),
      body:
      new Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                decoration: ShapeDecoration(
                    shape: Border(bottom: BorderSide(color: Theme
                        .of(context)
                        .dividerColor))
                ),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 55.0,
                child:
                new StreamBuilder(
                  stream: FirebaseDatabase.instance
                      .reference()
                      .child("Information")
                      .onValue,

                  //plants.onValue,
                  builder: (context, snap) {
                    if (snap.hasData && !snap.hasError &&
                        snap.data.snapshot.value != null) {
                      Map data = snap.data.snapshot.value;
                      List item = [];

                      data.forEach((index, data) =>
                          item.add({"key": index, ...data}));

                      return ListView.builder(
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("Current Plant: " + item[index]["Name"],
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontFamily: 'Raleway'),
                            ),
                          );
                        },
                      );
                    }
                    else
                      return Text(" ");
                  },
                ),
              ),
              Expanded(
                child: new StreamBuilder(
                  stream: plants.onValue,
                  builder: (context, snap) {
                    if (snap.hasData && !snap.hasError &&
                        snap.data.snapshot.value != null) {
                      Map data = snap.data.snapshot.value;
                      List item = [];

                      data.forEach((index, data) =>
                          item.add({"key": index, ...data}));

                      return ListView.builder(
                        itemCount: item.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(item[index]["Name"]),
                            onTap: () =>
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildAboutDialog(
                                          context, item[index]["Name"],
                                          item[index]["Temperature"],
                                          item[index]["Light"],
                                          item[index]["Water"],
                                          item[index]['key']),
                                  barrierDismissible: false,
                                ),
                          );
                        },
                      );
                    }
                    else
                      return Text(" ");
                  },
                ),
              ),
            ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildAddPlant(context),
              barrierDismissible: false,
            ),
      ),
    );
  }

  Widget _buildAboutDialog(BuildContext context, String name,
      String temperature, String light, String water, key) {
    return new AlertDialog(
      title: new Text(name),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(temperature, light, water),
          //_buildLogoAttribution(),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          padding: EdgeInsets.only(right: 10.0),
          onPressed: () {
            _updateDatabaseEntry(name, light, temperature, water);
            Navigator.of(context).pop();
          },
          //textColor: Theme.of(context).primaryColor,
          child: const Text('Choose this plant'),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          //textColor: Theme.of(context).primaryColor,
          child: const Text('Go back'),
        ),
        new IconButton(icon: Icon(Icons.delete),
            onPressed: () {
              FirebaseDatabase.instance.reference().child('Plants')
                  .child(key)
                  .remove();
              Navigator.of(context).pop();
            }),
      ],
    );
  }


  Widget _buildAboutText(String temperature, String light, String water) {
    return new RichText(
      text: new TextSpan(
        text: 'Optimal Temperature: ' + temperature + '\u2103' + '\n\n' +
            'Light need: ' + light + '\n\n' + 'Watering need: ' + water +
            '\n\n',
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }

  final inputName = TextEditingController(text: "Example Plant");
  final inputTemperature = TextEditingController(text: "25");
  final inputLight = TextEditingController();
  final inputWater = TextEditingController();




  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputName.dispose();
    inputTemperature.dispose();
    inputLight.dispose();
    inputWater.dispose();
    super.dispose();
  }



  Widget _buildAddPlant(BuildContext context) {

    String lightSetting = "Low";
    bool lightLow = true;
    bool lightModerate = false;
    bool lightHigh = false;

    String waterSetting = "Low";
    bool waterLow = true;
    bool waterModerate = false;
    bool waterHigh = false;


    return StatefulBuilder(
        builder: (context, setState) {
          return new AlertDialog(
            title: new Text("Add a new plant", style: TextStyle(fontSize: 18)),
            content: new Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Name of the plant: ", style: TextStyle(fontSize: 13)),
                _buildAddPlantTextName(),
                Text("\n \n" + "Optimal temperature of plant: (Celsius)", style: TextStyle(fontSize: 13)),
                _buildAddPlantTextTemperature(),
                Text("\n \n" + "Light need of plant: " + "\n", style: TextStyle(fontSize: 13)),

                //Light
                Container(
                  child: Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Low", style: TextStyle(fontSize: 12)),
                              Checkbox(
                                value: lightLow,
                                onChanged: (bool value) {
                                  setState(() {
                                    lightSetting = "Low";
                                    lightLow = true;
                                    lightModerate = false;
                                    lightHigh = false;
                                  });
                                },
                              ),

                            ],
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Moderate", style: TextStyle(fontSize: 12)),
                              Checkbox(
                                value: lightModerate,
                                onChanged: (bool value) {
                                  setState(() {
                                    lightSetting = "Moderate";
                                    lightLow = false;
                                    lightModerate = true;
                                    lightHigh = false;
                                  });
                                },
                              ),
                            ],
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("High", style: TextStyle(fontSize: 12)),
                              Checkbox(
                                value: lightHigh,
                                onChanged: (bool value) {
                                  setState(() {
                                    lightSetting = "High";
                                    lightLow = false;
                                    lightModerate = false;
                                    lightHigh = true;
                                  });
                                },
                              ),
                            ],
                          ),
                        ]
                    ),
                  ),
                ),


                //_buildAddPlantTextLight(),
                Text("\n \n" + "Water need of plant: "  + "\n", style: TextStyle(fontSize: 13)),


                Container(
                  child: Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Low", style: TextStyle(fontSize: 12)),
                              Checkbox(
                                value: waterLow,
                                onChanged: (bool value) {
                                  setState(() {
                                    waterSetting = "Low";
                                    waterLow = true;
                                    waterModerate = false;
                                    waterHigh = false;
                                  });
                                },
                              ),

                            ],
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Moderate", style: TextStyle(fontSize: 12)),
                              Checkbox(
                                value: waterModerate,
                                onChanged: (bool value) {
                                  setState(() {
                                    waterSetting = "Moderate";
                                    waterLow = false;
                                    waterModerate = true;
                                    waterHigh = false;
                                  });
                                },
                              ),
                            ],
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("High", style: TextStyle(fontSize: 12)),
                              Checkbox(
                                value: waterHigh,
                                onChanged: (bool value) {
                                  setState(() {
                                    waterSetting = "High";
                                    waterLow = false;
                                    waterModerate = false;
                                    waterHigh = true;
                                  });
                                },
                              ),
                            ],
                          ),
                        ]
                    ),
                  ),
                ),



                //_buildAddPlantTextWater(),
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                padding: EdgeInsets.only(right: 111.0),
                onPressed: () {
                  FirebaseDatabase.instance.reference().child('Plants').push().set({
                    "Name": inputName.text,
                    "Temperature": inputTemperature.text,
                    "Light": lightSetting,
                    "Water": waterSetting
                  });
                  //Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                //textColor: Theme.of(context).primaryColor,
                child: const Text('Add plant'),
              ),
              new FlatButton(
                onPressed: () {
                  //inputName.text = " ";
                  //inputTemperature.text = " ";
                  inputName.text = "Example Plant";
                  inputTemperature.text = "25";
                  //inputLight.text = " ";
                  //inputWater.text = " ";
                  Navigator.of(context).pop();
                },
                //textColor: Theme.of(context).primaryColor,
                child: const Text('Go back'),
              ),
            ],
          );
        }
    );
  }


  Widget _buildAddPlantTextName() {
    return new Container(
      height: 25.0,
      //padding: const EdgeInsets.all(16.0),
      child: TextField(
        autofocus: false,
        controller: inputName,
        decoration: InputDecoration(
          //border: OutlineInputBorder(),
          //prefixText: 'Name of plant: ',
          //labelText: 'Example Plant',
        ),
      ),
    );
  }

  Widget _buildAddPlantTextTemperature() {
    return new Container(
      height: 25.0,
      //padding: const EdgeInsets.all(16.0),
      child: TextField(
        autofocus: false,
        controller: inputTemperature,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          //border: OutlineInputBorder(),
          //prefixText: 'Temperature need of plant: ',
          //labelText: '25',
        ),
      ),
    );
  }

  Widget _buildAddPlantTextLight() {
    return new Container(
      height: 25.0,
      //padding: const EdgeInsets.all(16.0),
      child: TextField(
        autofocus: false,
        controller: inputLight,
        decoration: InputDecoration(
          //border: OutlineInputBorder(),
          //prefixText: 'Light need of plant: ',
          //labelText: 'Light need of plant: ',
        ),
      ),
    );
  }

  Widget _buildAddPlantTextWater() {
    return new Container(
      height: 25.0,
      //padding: const EdgeInsets.all(16.0),
      child: TextField(
        autofocus: false,
        controller: inputWater,
        decoration: InputDecoration(
          //border: OutlineInputBorder(),
          //prefixText: 'Watering need of plant: ',
          //labelText: 'Watering need of plant: ',
        ),
      ),
    );
  }
}