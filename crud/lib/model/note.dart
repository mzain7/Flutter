import 'package:firebase_database/firebase_database.dart';

class Note {
  String key;
  String title;
  String content;

  Note(this.key, this.title, this.content);

  Note.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key ?? '',
        title = (snapshot.value as Map<String, dynamic>)['title'],
        content = (snapshot.value as Map<String, dynamic>)['content'];

  toJson() {
    return {'title': title, 'content': content};
  }
}
