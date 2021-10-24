import 'package:flutter/material.dart';

class MeditationCard extends StatelessWidget {
  const MeditationCard(this.title, this.img, this.route);
  @required
  final String title;
  @required
  final String img;
  final Widget route;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => openDetails(context),
        child: Material(
            borderRadius: BorderRadius.circular(10.0),
            elevation: 15,
            shadowColor: Colors.grey,
            child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      child: Image.asset(
                        img,
                        fit: BoxFit.fill,
                        width: 130,
                        height: 130,
                      ),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15)),
                    ),
                    Text(
                      "$title",
                      style: TextStyle(
                          fontFamily: "Times new Roman",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    )
                  ],
                ))));
  }

  openDetails(BuildContext context) => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => route));
}
