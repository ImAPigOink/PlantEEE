import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Home Page"),
      ),
      body:
      Container(
        color: const Color(0xFF009688),

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

              return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    ////day 1000/////

                    Expanded(
                      flex: 3,
                      child:new Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(image:AssetImage('assets/images/343990.jpg'), fit:BoxFit.cover)
                        ),

                        child:
                        new Text(
                          "Day " + item[0]["daysAlive"].toString(),
                          style: new TextStyle(fontSize: 50.0,
                              color: const Color(0xFF000000),
                              fontWeight: FontWeight.w200,
                              fontFamily: "Roboto"),
                        ),



                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,


                      ),
                    ),

                    Spacer(flex:1),

//MOISTURE////////////////
                    Expanded(
                      flex:4,
                      child: new Container(
                        child:
                        new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Spacer(flex:1),
                              Expanded(
                                flex:2,
                                child:new Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image:AssetImage('assets/images/water-drop.png'), fit:BoxFit.contain)
                                  ),
                                  padding: const EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Spacer(flex:1),


                              Expanded(
                                  flex:6,
                                  child: new Container(
                                    child:
                                    new Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 3,
                                            child: new Container(
                                              child:
                                              new Text(
                                                "MOISTURE",
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: const Color(0xFF000000),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Roboto"
                                                ),
                                              ),

                                              color: const Color(0xfffb8c00),
                                              padding: const EdgeInsets.all(0.0),
                                              alignment: Alignment.center,
                                            ),
                                          ),

                                          Expanded(
                                            flex:7,
                                            child: new Container(
                                              child:
                                              new Text(
                                                item[1]["Humidity"].toString() + " %",
                                                style: new TextStyle(fontSize: 30.0,
                                                    color: const Color(0xFF000000),
                                                    fontWeight: FontWeight.w200,
                                                    fontFamily: "Roboto"),
                                              ),
                                              color: const Color(0xFFffccbc),
                                              padding: const EdgeInsets.all(0.0),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ]

                                    ),
                                    padding: const EdgeInsets.all(0.0),
                                    alignment: Alignment.center,
                                  )
                              ),
                              Spacer(flex:1),
                            ]


                        ),

                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                      ),
                    ),
                    Spacer(flex:1),

// temperature///////////////////////
                    Expanded(
                      flex:4,
                      child: new Container(
                        child:
                        new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Spacer(flex:1),
                              Expanded(
                                flex:2,
                                child:new Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image:AssetImage('assets/images/thermometer.png'), fit:BoxFit.contain)
                                  ),
                                  padding: const EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Spacer(flex:1),

                              Expanded(
                                  flex:6,
                                  child: new Container(
                                    child:
                                    new Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 3,
                                            child: new Container(
                                              child:
                                              new Text(
                                                "TEMPERATURE",
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: const Color(0xFF000000),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Roboto"
                                                ),
                                              ),
                                              color: const Color(0xfffb8c00),
                                              padding: const EdgeInsets.all(0.0),
                                              alignment: Alignment.center,
                                            ),
                                          ),

                                          Expanded(
                                            flex:7,
                                            child: new Container(
                                              child:
                                              new Text(
                                                item[1]["Temperature"].toString() + '\u2103',
                                                style: new TextStyle(fontSize: 30.0,
                                                    color: const Color(0xFF000000),
                                                    fontWeight: FontWeight.w200,
                                                    fontFamily: "Roboto"),
                                              ),
                                              color: const Color(0xFFffccbc),
                                              padding: const EdgeInsets.all(0.0),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ]

                                    ),

                                    padding: const EdgeInsets.all(0.0),
                                    alignment: Alignment.center,
                                  )
                              ),
                              Spacer(flex:1),
                            ]

                        ),


                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                      ),
                    ),
                    Spacer(flex:1),

//////light///////////
                    Expanded(
                      flex:4,
                      child: new Container(
                        child:
                        new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Spacer(flex:1),
                              Expanded(
                                flex:2,
                                child:new Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(image:AssetImage('assets/images/sun.png'), fit:BoxFit.contain)
                                  ),
                                  padding: const EdgeInsets.all(0.0),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Spacer(flex:1),

                              Expanded(
                                  flex:6,
                                  child: new Container(
                                    child:
                                    new Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 3,
                                            child: new Container(
                                              child:
                                              new Text(
                                                "LIGHT INTENSITY",
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    color: const Color(0xFF000000),
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Roboto"
                                                ),
                                              ),
                                              color: const Color(0xfffb8c00),
                                              padding: const EdgeInsets.all(0.0),
                                              alignment: Alignment.center,
                                            ),
                                          ),

                                          Expanded(
                                            flex:7,
                                            child: new Container(
                                              child:
                                              new Text(
                                                item[1]["Light"].toString() + " %",
                                                style: new TextStyle(fontSize: 30.0,
                                                    color: const Color(0xFF000000),
                                                    fontWeight: FontWeight.w200,
                                                    fontFamily: "Roboto"),
                                              ),
                                              color: const Color(0xFFffccbc),
                                              padding: const EdgeInsets.all(0.0),
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ]

                                    ),

                                    padding: const EdgeInsets.all(0.0),
                                    alignment: Alignment.center,
                                  )
                              ),
                              Spacer(flex:1),
                            ]

                        ),

                        padding: const EdgeInsets.all(0.0),
                        alignment: Alignment.center,
                      ),
                    ),
                    Spacer(flex:1)
                  ]
              );
            }
            else
              return Text(" ");
          },
        ),
      ),
    );
  }
}

class HomePage2 extends StatefulWidget{
  @override
  HomePage2State createState () => HomePage2State();

}
