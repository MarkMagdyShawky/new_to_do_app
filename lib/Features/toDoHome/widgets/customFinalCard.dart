import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:to_do_app/Features/tasks/screens/doneTasks.dart';
import 'package:to_do_app/core/resources/colorManager.dart';
import 'package:to_do_app/core/resources/imageManager.dart';

class CustomFinalCard extends StatelessWidget {
  const CustomFinalCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: MarkBackgroundColor,
      shadowColor: MarkPrimaryColor,
      elevation: 7,
      surfaceTintColor: MarkBackgroundColor,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SvgPicture.asset(
              ImageManager.finalCard,
              height: 40,
              width: 40,
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "Done",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MarkPrimaryColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 7,
            ),

            //Linear Indicator
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              width: 125,
              barRadius: Radius.circular(30),
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2000,
              percent: 1,
              progressColor: Colors.lightGreenAccent,
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoneTasks(),
            ),
          );
        },
      ),
    );
  }
}
