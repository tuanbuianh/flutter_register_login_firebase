import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/src/resources/widgets/home_menu.dart';
import 'package:taxi_app/src/resources/widgets/ride_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GoogleMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.yellow,
          child: Stack(
            children: <Widget>[
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(10.7915178, 106.7271422),
                  zoom: 14.4746,
                ),
              ),
              Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        title: Text(
                          "TAxi App",
                          style: TextStyle(color: Colors.black),
                        ),
                        leading: FlatButton(
                            onPressed: () {
                              print("Click Menu");
                              _scaffoldKey.currentState.openDrawer();
                            },
                            child: Image.asset("images/ic_menu.png")),
                        actions: <Widget>[Image.asset("images/ic_notify.png")],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                        child: RidePicker(),
                      )
                    ],
                  )
              )
            ],
          )
      ),
      drawer: Drawer(
        child: HomeMenu(),
      ),
    );
  }
}
