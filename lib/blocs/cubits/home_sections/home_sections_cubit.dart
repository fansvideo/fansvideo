import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSections extends Cubit<String> {
  HomeSections() : super('top_sections');

  void setOffset(String section) => emit(section);
}

