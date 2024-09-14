import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vacancy_app/main.dart';
import 'package:vacancy_app/models/job.dart';
import 'package:vacancy_app/widgets/error_screen.dart';

class VacancyApi{


  Future<List<Job>> getJobs()async{
    Response response = await get(Uri.parse(
    'https://www.unhcrjo.org/jobs/api'));
    dynamic body =json.decode(response.body);
    List<Job> jobs=[];
    if(response.statusCode==200){
      for(int i=0;i<body.length;i++) {
         jobs.add(Job.fromJson(body[i]));
      }
      return jobs;
    }else{
      final snackBar = SnackBar(
        content: const Text('An unexpected error occurred.'),
        duration: const Duration(hours: 24),
        action: SnackBarAction(
            label: 'See details',
            onPressed: () {
              Navigator.push(
                globalKey.currentContext!,
                MaterialPageRoute(
                  builder: (context) => ErrorScreen(
                    errorStatusCode: response.statusCode,
                    requestUrl: 'https://www.unhcrjo.org/jobs/api',
                  ),
                ),
              );
            }),
      );
      ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(snackBar);
    }
    return[];
  }
}