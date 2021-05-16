import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info/widgets/simCard.dart';
import 'package:mobile_number/mobile_number.dart';

class SimDetailScreen extends StatefulWidget {
  @override
  _SimDetailScreenState createState() => _SimDetailScreenState();
}

class _SimDetailScreenState extends State<SimDetailScreen> {
  bool loading;
  List<SimCard> simCards;

  @override
  void initState() {
    super.initState();
    fetchAndSetSimCards();
  }

  void fetchAndSetSimCards() async {
    setState(() {
      loading = true;
    });
    bool permission = await MobileNumber.hasPhonePermission;
    if (permission) {
      final List<SimCard> simCards = await MobileNumber.getSimCards;
      setState(() {
        this.simCards = simCards;
      });
    } else {
      await MobileNumber.requestPhonePermission;
      fetchAndSetSimCards();
    }

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading == true
        ? CupertinoActivityIndicator(
            radius: 20,
          )
        : Container(
      height: MediaQuery.of(context).size.height * .8,
      child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, i) {
                      return SimCardWidget(simCards[i]);
                    },
                    itemCount: simCards.length,
                  ),
                )
              ],
            ),
          );
  }
}
