import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSections extends Cubit<String> {
  HomeSections() : super('top_sections');

  void setSection(String section) => emit(section);
}

