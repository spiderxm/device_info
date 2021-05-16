import 'package:device_apps/device_apps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info/widgets/AppCard.dart';

class AllAppsScreen extends StatefulWidget {
  @override
  _AllAppsScreenState createState() => _AllAppsScreenState();
}

class _AllAppsScreenState extends State<AllAppsScreen>
    with AutomaticKeepAliveClientMixin {
  bool loading;
  List apps;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    fetchApps();
  }

  /// fetches list of [apps] and updates state of the application.
  void fetchApps() async {
    setState(() {
      loading = true;
    });
    List appList = await DeviceApps.getInstalledApplications(
        onlyAppsWithLaunchIntent: true,
        includeAppIcons: true,
        includeSystemApps: true);

    setState(() {
      apps = appList;
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
        : Container(
            height: MediaQuery.of(context).size.height * .8,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return ApplicationCard(apps[index]);
                    },
                    itemCount: apps.length,
                  ),
                ),
              ],
            ),
          );
  }
}
