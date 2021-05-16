import 'package:flutter/material.dart';

class DetailCard extends StatelessWidget {
  final String heading;
  final String detail;

  DetailCard(this.heading, this.detail);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.black87),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              heading,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Text(
              detail,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
