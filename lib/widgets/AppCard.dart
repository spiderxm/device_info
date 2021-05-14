import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class ApplicationCard extends StatelessWidget {
  final application;

  ApplicationCard(this.application);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.black87),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.memory(application.icon),
                height: 70,
                width: 70,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 130,
                child: Text(
                  application.appName,
                  overflow: TextOverflow.clip,
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: FlatButton.icon(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)),
                    color: Colors.white,
                    icon: Icon(Icons.open_in_new),
                    onPressed: () {
                      DeviceApps.openApp(application.packageName);
                    },
                    label: Text("Open")),
              )
            ],
          ),
        ),
      ),
    );
  }
}
