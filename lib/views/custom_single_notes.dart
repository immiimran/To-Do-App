import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:toto_crud/controllers/notes_controller.dart';
import 'package:toto_crud/routes/routes_names.dart';
import 'package:toto_crud/utils/colors.dart';

class CustomSingleNotes extends StatelessWidget {
  final int index;
  const CustomSingleNotes({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());
    final note = controller.notes.elementAt(index);
    final createdDateFormat = DateFormat.yMMMMd().format(note.createdDate);
    final createdTimeFormat = DateFormat.jm().format(note.createdDate);

    final updatedDateFormat =
        DateFormat.yMMMMd().format(note.updatedDate ?? DateTime.now());
    final updatedTimeFormat =
        DateFormat.jm().format(note.updatedDate ?? DateTime.now());
    return Padding(
      padding: const EdgeInsets.all(12),
      child: InkWell(
        onTap: () {
          Get.toNamed(RoutesNames.note, arguments: {
            'isUpdate': true,
            'note': note,
            'index': index,
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Colors.black.withOpacity(.5),
              )),
          child: ListTile(
              horizontalTitleGap: 0,
              leading: Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                    color: Appcolors.backgroundColor, shape: BoxShape.circle),
              ),
              title: Text(
                note.title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      note.description),
                  note.updatedDate != null
                      ? Text(
                          "Updated : $updatedTimeFormat _ $updatedDateFormat")
                      : const SizedBox(),
                  Text('$createdTimeFormat _ $createdDateFormat'),
                ],
              ),
              trailing: IconButton(
                  onPressed: () {
                    Get.snackbar('Deleted', '${note.title} has been deleted',
                        snackPosition: SnackPosition.BOTTOM);
                    controller.deleteNote(index);
                  },
                  icon: const Icon(Icons.delete))),
        ),
      ),
    );
  }
}
