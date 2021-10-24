import 'package:flutter/cupertino.dart';
import 'package:meditation/Models/Note.dart';

class ProgressOperation extends ChangeNotifier {
  // ignore: deprecated_member_use
  List<Note> _progress = <Note>[];

  List<Note> get getnotes {
    return _progress;
  }

  ProgressOperation() {
    addNewProgress('First Progress', 'First Progress Description');
  }

  void addNewProgress(String title, String description) {
    Note note = Note(title, description);
    _progress.add(note);
    notifyListeners();
  }
}
