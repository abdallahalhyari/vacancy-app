part of 'vacancy_bloc.dart';

@immutable
sealed class VacancyState {}

final class VacancyInitial extends VacancyState {}

class LoadedJobsEvent extends VacancyState {}