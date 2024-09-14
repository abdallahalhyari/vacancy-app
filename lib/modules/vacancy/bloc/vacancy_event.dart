part of 'vacancy_bloc.dart';

@immutable
sealed class VacancyEvent {}

class LoadJobsEvent extends VacancyEvent {}