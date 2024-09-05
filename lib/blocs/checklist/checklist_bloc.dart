import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'checklist_event.dart';
part 'checklist_state.dart';

class ChecklistBloc extends Bloc<ChecklistEvent, ChecklistState> {
  final http.Client client;
  ChecklistBloc({
    required this.client,
  }) : super(ChecklistInitial()) {
    on<FetchAllChecklistEvent>((event, emit) {});
    on<CreateChecklistEvent>((event, emit) {});
  }
}
