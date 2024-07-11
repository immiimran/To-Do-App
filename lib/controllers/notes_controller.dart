import 'package:get/get.dart';
import 'package:toto_crud/model/notes_model.dart';

class NotesController extends GetxController {
  RxList<NotesModel> notes = <NotesModel>[].obs;

  addNotes(NotesModel notesData) {
    notes.add(notesData);
    update();
  }

  deleteNote(int index) {
    notes.removeAt(index);
    update();
  }

  updateNote(int index, NotesModel notesData) {
    notes[index] = notesData;
  }
}
