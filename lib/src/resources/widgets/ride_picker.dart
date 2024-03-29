import 'package:flutter/material.dart';

class RidePicker extends StatefulWidget {
  @override
  _RidePickerState createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color(0x88999999),
              offset: Offset(0, 5),
              blurRadius: 5,
            )
          ]),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
                onPressed: () {},
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 50,
                        child: Center(
                          child: Image.asset("images/ic_location_black.png"),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        width: 40,
                        height: 50,
                        child: Center(
                          child: Image.asset("images/ic_remove_x.png"),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 50),
                        child: Text(
                          "dia cmn chi luc dau",
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 16, color: Color(0xff323643)),
                        ),
                      )
                    ],
                  ),
                )),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
                onPressed: () {},
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 50,
                        child: Center(
                          child: Image.asset("images/ic_map_nav.png"),
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
