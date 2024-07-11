import 'package:get/get.dart';
import 'package:toto_crud/routes/routes_names.dart';
import 'package:toto_crud/views/home.dart';
import 'package:toto_crud/views/note.dart';

class RoutesPages {
  static List<GetPage<dynamic>>? routes = [
    GetPage(
      name: RoutesNames.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: RoutesNames.note,
      page: () => const NoteScreen(),
    )
  ];
}
