part of 'checklist_bloc.dart';

@immutable
sealed class ChecklistState extends Equatable {}

final class ChecklistInitial extends ChecklistState {
  @override
  List<Object?> get props => [];
}

final class ChecklistLoading extends ChecklistState {
  @override
  List<Object?> get props => [];
}

final class ChecklistLoaded extends ChecklistState {
  @override
  List<Object?> get props => [];
}

final class ChecklistError extends ChecklistState {
  final String message;

  ChecklistError({required this.message});

  @override
  List<Object?> get props => [message];
}
