import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toto_crud/controllers/notes_controller.dart';
import 'package:toto_crud/model/notes_model.dart';
import 'package:toto_crud/views/custom_button.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());
    final arg = Get.arguments != null
        ? Get.arguments as Map
        : {
            'isUpdate': false,
            'note': null,
          };
    final bool isUpdate = arg['isUpdate'] ?? false;
    final note = arg['note'] == null ? null : arg['note'] as NotesModel;

    final int? index = arg['index'] == null ? null : arg['index'] as int;
    final titleController = TextEditingController(
      text: isUpdate ? note!.title : null,
    );
    final descriptionController = TextEditingController(
      text: isUpdate ? note!.description : null,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.link),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
              minLines: 1,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: descriptionController,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
                minLines: 1,
                maxLines: 20,
                decoration: const InputDecoration(
                  hintText: 'Describe Your Notes',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        title: 'Save Changes',
        onTap: () {
          if (titleController.text.isEmpty ||
              descriptionController.text.isEmpty) {
            Get.snackbar('Error', 'Title and Description are Required');
          } else {
            // Add Now
            isUpdate
                ? controller.updateNote(
                    index!,
                    NotesModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      createdDate: note!.createdDate,
                      updatedDate: DateTime.now(),
                    ))
                : controller.addNotes(NotesModel(
                    title: titleController.text,
                    description: descriptionController.text,
                    createdDate: DateTime.now()));
            Get.back();
          }
        },
      ),
    );
  }
}
