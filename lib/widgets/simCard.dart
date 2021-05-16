import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mobile_number/mobile_number.dart';

class SimCardWidget extends StatelessWidget {
  final SimCard simCard;

  SimCardWidget(this.simCard);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.black87),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  LineIcons.simCard,
                  color: Colors.white,
                  size: 80,
                ),
                Column(
                  children: [
                    Text(
                      simCard.number,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Sim Slot Index : " + simCard.slotIndex.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Country ISO : " + simCard.countryIso,
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Carrier name : " + simCard.carrierName,
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Country Phone Prefix : " + simCard.countryPhonePrefix,
                  style: TextStyle(color: Colors.white, fontSize: 18)),
            )
          ],
        ),
      ),
    );
  }
}
