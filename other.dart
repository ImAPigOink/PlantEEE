import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';



class OthersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: AppBar(
          title: Text("Help")
        ),
        body: Center(
          child: Column
            (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Expanded(
                  child: ListView(
                    children:  <Widget>[
                      Card(
                          child: ListTile(
                            title: Text('Getting Started'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)
                                  => GettingStarted())
                              );
                            },
                          )
                      ),
                      Card(
                        child: ListTile(
                          title: Text('The App'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)
                                => TheApp())
                            );
                          },
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('Your First Plant'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)
                                => YourFirstPlant())
                            );
                          },
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('FAQ'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)
                                => FAQ())
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
class GettingStarted extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Getting started"),
      ),
      body: Center(
        child: Container(
          alignment: Alignment(0.0, -1),
          child: Text ('Welcome to Plantie,' +'\n'+
              'This app has been created for your comfort. '
               'You will be able to see the status of your plant in real time.'
               'Find how to begin your journey to a cleaner future in the sections we offer.'
               'Don’t hesitate to come back and refresh your memory at any time.'
            + '\n' + '\n'+ '1)	Getting started' + '\n' + '\n' +
              'PlantEE provides an automatic growing device that will take care of your plants and crops. You get to choose what to grow thanks to the flexibility of our device.'
              'In order to get started, you will need to acquire soil and seeds for your specific plants. Set the soil in the lower compartment leaving a small space to set your seeds.'
              'Cover these with some more soil and you are ready to go! We careful not to overflow the container. Set the case on top and open your app to finalise the process.'
            , textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 14.0
            ),
          ),
          margin: new EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}

class TheApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("The App"),
      ),
      body: Center(
        child: Container(
          alignment: Alignment(0.0, -1.0),
          child: SingleChildScrollView(
            child: Text ('This app has been created to help you connect with your plant no matter where you are.'
                'It will also set the device to specific properties that will allow your plant to thrive and grow as quickly as possible.' +'\n'+
                'The app is divided into 4 sections, all of which can be seen in the bottom layer.'
                + '\n' + '\n'+ '1)	Home page:' + '\n' + '\n' +
                'In this section you will be able to see the status of your plant and its progress. '
                    'More importantly, you will be notified when the device’s water reservoir is empty.'
                +  '\n' + '\n'+ '2)	Plant Manager:' + '\n' + '\n' +
                'Pay close attention to this section, as it is the one you will interact most with. '
                    'It allows you to select the type of plant you will be growing or customise a new entry.'
                    'At the top of the page, you can see the plant the hardware is currently optimised to manage.'
                    'Below this you will see a list of the available plant in the database.'
                    'The customized plants you will add during the use of the will remain in this list, so it is easy for you to select them again.'
                    'In the lower right side of the screen you can see a + button. When pressing this, you can choose to add a customised plant.'
                    'For this, you will have to name your plant and specify its ideal growth parameters: '
                    'temperature in Celsius (number must be inputted), and light and water need (low, moderate, high options). (examples).'
                +  '\n' + '\n'+ '3)	Test your hardware' + '\n' + '\n' +
                'The name is self-explanatory, this section will allow you to test your hardware.'
                    'When pressing the button, lights will activate, your plants will be watered and the heating will turn on.'
                    'Use it in case you suspect something is not working.'
                    'Although it is a way of showing off your new automatic gadget, please refrain from using it often, as it will unbalance the growing of your plant.'
                +  '\n' + '\n'+ '4)	Help' + '\n' + '\n' +
                'This section has a variety of information you might find useful to fully understand and utilise your PlantEEE.'
              , textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 14.0
              ),
            ),
          ),
          margin: new EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}

class YourFirstPlant extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Your first plant"),
      ),
      body: Center(
        child: Container(
          alignment: Alignment(0.0, -1.0),
          child: Text ('Once you’ve followed the instructions on the Getting Started section,'
              ' your device will be full of soil and your seeds will be planted.  After this, only a couple steps remain.'
              ' Open your app and connect it to your device. Then go to the Plant Manager and choose your type of plant or add a customized option.'
              ' The plant you have chosen will appear at the top of the screen. That means it is now selected.'
              ' The only thing you have to worry about in the next days is to '
              , textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 14.0
            ),
          ),
          margin: new EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}

class FAQ extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Frequently asked question"),
      ),
      body: Center(
        child: Container(
          alignment: Alignment(0.0, -1.0),
          child: Text ('Q) How often do I need to change the soil?'
              + '\n'+ 'It is recommended that you change the soil every year. ' + '\n' + '\n' +
              'Q) How often will I need to refill the water?'
              + '\n'+ 'You will see a notification in the home page of the app. '
              'It is estimated to be needed to change water every week to every 2 weeks depending on the water need of the plant.'
              + '\n' + '\n' +
              'Q) How often do I need to change the batteries?' + '\n' +
              'Every xxxx '
            ,textAlign: TextAlign.justify,
               style: TextStyle(
                fontSize: 14.0
            ),


          ),
          margin: new EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}