import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:battery/battery.dart';

class BatteryDetailsScreen extends StatefulWidget {
  @override
  _BatteryDetailsScreenState createState() => _BatteryDetailsScreenState();
}

class _BatteryDetailsScreenState extends State<BatteryDetailsScreen> {
  bool loading;
  int batteryLevel;
  String status;

  @override
  void initState() {
    super.initState();
    batteryDetails();
  }

  void batteryDetails() async {
    setState(() {
      loading = true;
    });
    var _battery = Battery();
    int _batteryLevel = await _battery.batteryLevel;
    print(_batteryLevel);
    setState(() {
      batteryLevel = _batteryLevel;
    });
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      setState(() {
        status = state.toString();
      });
    });

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? Container(
            height: MediaQuery.of(context).size.height * .8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: CupertinoActivityIndicator(
                  radius: 20,
                )),
              ],
            ))
        : Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black87),
                padding: EdgeInsets.all(20),
                child: Text(
                  batteryLevel.toString() + " %",
                  style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              if (status.toString().split(".").length >= 2)
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black87),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    status.toString().split(".")[1].toUpperCase(),
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
            ],
          );
  }
}
