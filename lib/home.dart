import 'package:finder/bachelor_list.dart';
import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
import 'package:finder/data_provider/bachelor_data_provider.dart'
    as bachelor_data_provider;

class Home extends StatelessWidget {
  Home({super.key});

  final List<Bachelor> bachelors =
      bachelor_data_provider.FakeDataGenerator().generateFakeBachelors();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Finder',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text('Finder')),
          body: Center(
            child: BachelorList(bachelors: bachelors),
          ),
        ));
  }
}
