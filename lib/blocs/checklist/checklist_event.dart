part of 'checklist_bloc.dart';

@immutable
sealed class ChecklistEvent extends Equatable {}

final class FetchAllChecklistEvent extends ChecklistEvent {
  @override
  List<Object?> get props => [];
}

final class CreateChecklistEvent extends ChecklistEvent {
  final String name;

  CreateChecklistEvent({
    required this.name,
  });

  @override
  List<Object?> get props => [
        name,
      ];
}
