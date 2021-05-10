import 'package:flutter/material.dart';
import 'package:info/models/CategoryItem.dart';
import 'package:info/screens/battery.dart';
import 'package:info/screens/info.dart';
import 'package:info/screens/sensors.dart';
import 'package:info/screens/apps.dart';
import 'package:info/widgets/category.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  onTap(int index) {
    setState(() {
      this.index = index;
    });
  }

  List<CategoryItem> categoryItems = [
    new CategoryItem("Info", LineIcons.info),
    new CategoryItem("Battery", LineIcons.battery34Full),
    new CategoryItem("Apps", LineIcons.googlePlay),
    new CategoryItem("Sensor", LineIcons.microchip)
  ];

  List<Widget> children = [
    InfoScreen(),
    BatteryDetailsScreen(),
    AllAppsScreen(),
    SensorDetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Device Info",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
              height: 60,
              child: ListView.builder(
                itemCount: categoryItems.length,
                itemBuilder: (ctx, i) {
                  print(i);
                  return Category(
                    categoryItem: categoryItems[i],
                    onTap: onTap,
                    index: i,
                    isSelected: i == index,
                  );
                },
                scrollDirection: Axis.horizontal,
              )),
          children[index]
        ],
      ),
    );
  }
}
