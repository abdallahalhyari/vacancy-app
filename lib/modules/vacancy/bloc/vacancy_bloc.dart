import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vacancy_app/models/job.dart';
import 'package:vacancy_app/modules/vacancy/data/repository.dart';

part 'vacancy_event.dart';
part 'vacancy_state.dart';

class VacancyBloc extends Bloc<VacancyEvent, VacancyState> {
  List<Job> jobs = [];
  final VacancyRepository vacancyRepository = VacancyRepository();
  VacancyBloc() : super(VacancyInitial()) {
    on<LoadJobsEvent>((event, emit) async {
      jobs = await vacancyRepository.getJobs();
      emit(LoadedJobsEvent());
    });
  }
}
