import 'package:flutter/material.dart';
import 'package:meditation/Models/progress_operation.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? TitleText;
    String? DescriptionText;
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
          title: Text("Add Details"),
          centerTitle: true,
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0),
      body: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        height: 225,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Enter Title",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontFamily: "Times New Roman",
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Times New Roman",
              ),
              onChanged: (value) {
                TitleText = value;
              },
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Description",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontFamily: "Times New Roman",
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: "Times New Roman",
                ),
                onChanged: (value) {
                  DescriptionText = value;
                },
              ),
            ),
            FlatButton(
                color: Colors.white,
                padding: EdgeInsets.all(5),
                onPressed: () {
                  Provider.of<ProgressOperation>(context, listen: false)
                      .addNewProgress(TitleText!, DescriptionText!);
                  Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 17,
                      fontFamily: "Times New Roman"),
                ))
          ],
        ),
      ),
    );
  }
}
