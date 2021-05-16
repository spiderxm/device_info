import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeaturesDetailsScreen extends StatefulWidget {
  @override
  _FeaturesDetailsScreenState createState() => _FeaturesDetailsScreenState();
}

class _FeaturesDetailsScreenState extends State<FeaturesDetailsScreen> {
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
        : SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * .8,
              child: ListView.builder(
                itemBuilder: (ctx, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black87),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            _androidDeviceInfo.systemFeatures[i].toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: _androidDeviceInfo.systemFeatures.length,
              ),
            ),
          );
  }
}
