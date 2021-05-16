import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:info/widgets/detailCard.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  AndroidDeviceInfo _androidDeviceInfo;
  bool loading;

  @override
  void initState() {
    super.initState();
    fetchDeviceDetails();
  }

  void fetchDeviceDetails() async {
    setState(() {
      loading = true;
    });

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    setState(() {
      _androidDeviceInfo = androidInfo;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_androidDeviceInfo.systemFeatures);

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
        : Container(
            height: MediaQuery.of(context).size.height * .8,
            child: SingleChildScrollView(
              child: Column(children: [
                DetailCard("Brand", _androidDeviceInfo.brand),
                DetailCard("Device", _androidDeviceInfo.device),
                DetailCard("Display", _androidDeviceInfo.display),
                DetailCard("Manufacturer", _androidDeviceInfo.manufacturer),
                DetailCard("Android Version",
                    _androidDeviceInfo.version.sdkInt.toString()),
                DetailCard("Model", _androidDeviceInfo.model),
                DetailCard("Android Id", _androidDeviceInfo.androidId),
                DetailCard("Android Id", _androidDeviceInfo.hardware),
              ]),
            ),
          );
  }
}
