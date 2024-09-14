import 'package:vacancy_app/models/job.dart';
import 'package:vacancy_app/modules/vacancy/data/api.dart';

class VacancyRepository {
  final VacancyApi vacancyApi = VacancyApi();
  Future<List<Job>> getJobs() async {
    List<Job> result = await vacancyApi.getJobs();
    return result;
  }
}
