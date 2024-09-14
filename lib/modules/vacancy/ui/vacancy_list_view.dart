import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_network/image_network.dart';
import 'package:vacancy_app/models/job.dart';
import 'package:vacancy_app/modules/vacancy/bloc/vacancy_bloc.dart';
import 'package:vacancy_app/modules/vacancy/ui/vacancy_details.dart';
import 'package:vacancy_app/widgets/shimmer_widget.dart';

class VacancyListView extends StatelessWidget {
  const VacancyListView({super.key});

  @override
  Widget build(BuildContext context) {
    VacancyBloc vacancyBloc=context.read<VacancyBloc>();
    return Scaffold(
      appBar: AppBar(title: const Text('Vacancies')),
      body: BlocBuilder<VacancyBloc, VacancyState>(
        builder: (context, state) {
          return state is VacancyInitial? const ShimmerWidget():ListView.builder(
            itemCount:vacancyBloc.jobs.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
              Job job= vacancyBloc.jobs[index];
                return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                VacancyDetailsScreen(vacancy: job),
                          ),
                       );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: ImageNetwork(
                                image: job.imageUrl!,
                                height: 80,
                                width: 90,
                                duration: 1500,
                                curve: Curves.easeIn,
                                onPointer: true,
                                debugPrint: false,
                                fullScreen: false,
                                fitAndroidIos: BoxFit.cover,
                                borderRadius: BorderRadius.circular(10),
                                onLoading: const SpinKitFadingFour(
                                  color: Colors.blue,
                                  size: 50.0,
                                ),
                                onError: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                                onTap: () {
                                  debugPrint("©gabriel_patrick_souza");
                                },
                              )
                            ),
                            const SizedBox(width: 16),
                            // Text section
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Vacancy title
                                  Text(
                                    job.title!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    job.description!,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),

                                  Text(
                                    'Posted: ${job.datePosted}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
              }
          );
        },
      ),
    );
  }
}
