import 'package:flutter/material.dart';
import 'package:meditation/Models/Note.dart';
import 'package:meditation/Models/progress_operation.dart';
import 'package:meditation/add_progress.dart';
import 'package:meditation/main.dart';
import 'package:provider/provider.dart';

class AddProgress extends StatefulWidget {
  const AddProgress({Key? key}) : super(key: key);

  @override
  _AddProgressState createState() => _AddProgressState();
}

class _AddProgressState extends State<AddProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Your Daily Progress"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()))),
        ),
        backgroundColor: Colors.greenAccent,
        body: Consumer<ProgressOperation>(
            builder: (context, ProgressOperation data, child) {
          return ListView.builder(
              itemCount: data.getnotes.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    alignment: Alignment.center,
                    color: Colors.grey,
                  ),
                  child: ProgressCard(data.getnotes[index]),
                  onDismissed: (DismissDirection direction) {
                    print("Direction");
                    setState(() {
                      data.getnotes.removeAt(index);
                    });
                  },
                );
                //return ProgressCard(data.getnotes[index]);
              });
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddScreen()));
          },
          child: Icon(
            Icons.create,
            color: Colors.greenAccent,
            size: 30,
          ),
          backgroundColor: Colors.white,
          shape: CircleBorder(),
          elevation: 4.0,
        ));
  }
}

class ProgressCard extends StatelessWidget {
  final Note note;
  ProgressCard(this.note);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            note.title,
            style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 25,
                fontFamily: "Times New Roman",
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.0),
          Text(note.description,
              style: TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 18,
                  fontFamily: "Times New Roman",
                  fontWeight: FontWeight.bold))
        ]));
  }
}
