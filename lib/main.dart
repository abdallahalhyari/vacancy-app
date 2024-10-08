import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vacancy_app/modules/vacancy/bloc/vacancy_bloc.dart';
import 'package:vacancy_app/modules/vacancy/ui/vacancy_list_view.dart';


final GlobalKey<NavigatorState> globalKey = GlobalKey();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => VacancyBloc()..add(LoadJobsEvent()),
        child: const VacancyListView(),
      ),
    );
  }
}


