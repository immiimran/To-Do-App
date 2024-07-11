import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toto_crud/controllers/notes_controller.dart';
import 'package:toto_crud/routes/routes_names.dart';
import 'package:toto_crud/views/custom_single_notes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());

    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            const Text(
              'My Notes',
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    )),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        )),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  )
                ],
              ),
            ),
            Expanded(
              child: Obx(() => SingleChildScrollView(
                    child: Column(
                      children: [
                        controller.notes.isEmpty
                            ? const Center(
                                child: Text(
                                  'No Notes Available',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                reverse: true,
                                itemCount: controller.notes.length,
                                itemBuilder: (context, index) {
                                  // ignore: unused_local_variable
                                  final note = controller.notes[index];

                                  return CustomSingleNotes(
                                    index: index,
                                  );
                                })
                      ],
                    ),
                  )),
            ),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => Get.toNamed(RoutesNames.note),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
