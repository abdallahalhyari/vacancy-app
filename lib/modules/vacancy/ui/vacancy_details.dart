import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_network/image_network.dart';
import 'package:vacancy_app/models/job.dart';


class VacancyDetailsScreen extends StatelessWidget {
  final Job vacancy;

  const VacancyDetailsScreen({super.key, required this.vacancy});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          vacancy.title.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(isPortrait ? 16.0 : 32.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: ImageNetwork(
                  image: vacancy.imageUrl!,
                  height: 150,
                  width: MediaQuery.sizeOf(context).width,
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
            ),
            const SizedBox(height: 24),
            _buildDetailText('Company', vacancy.company!, screenWidth),
            _buildDetailText('Location', vacancy.location!, screenWidth),
            _buildDetailText('Description', vacancy.description!, screenWidth),
            _buildDetailText('Salary', vacancy.salary!, screenWidth),
            _buildDetailText('Date Posted', vacancy.datePosted!, screenWidth),
            _buildDetailText(
                'Long Description', vacancy.longDescription!, screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailText(String label, String value, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.black),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 95, 157, 207),
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}