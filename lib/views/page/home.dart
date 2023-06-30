import 'package:finder/views/partial/bachelor_list.dart';
import 'package:finder/data/provider/bachelor_list.dart' as bachelor_list;
import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

enum FilterGender { man, women, all }

class HomeState extends State<Home> {
  FilterGender filter = FilterGender.all;
  String? name;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Bachelor> bachelors =
        context.watch<bachelor_list.BachelorList>().bachelorList;
    if (filter != FilterGender.all) {
      bachelors = bachelors
          .where((element) =>
              element.gender ==
              (FilterGender.man == filter ? Gender.male : Gender.female))
          .toList();
    }
    if (name != null && name!.isNotEmpty) {
      bachelors = bachelors
          .where((element) =>
              element.firstname.toLowerCase().contains(name!.toLowerCase()) ||
              element.lastname.toLowerCase().contains(name!.toLowerCase()))
          .toList();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finder',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Finder'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: SizedBox(
                width: 200,
                child: TextField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: ' Search',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      onPressed: () => setState(() {
                        name = _controller.text;
                      }),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                GoRouter.of(context).go('/favorites');
              },
            ),
          ],
        ),
        body: Center(
          child: BachelorList(bachelors: bachelors),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Wrap(
          spacing: 25,
          alignment: WrapAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                setState(() {
                  filter = FilterGender.all;
                });
              },
              tooltip: 'Reset all filters',
              child: const Icon(Icons.refresh),
            ),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () => {
                setState(() {
                  filter = FilterGender.man;
                })
              },
              tooltip: 'set filter to male',
              child: const Icon(Icons.male),
            ),
            FloatingActionButton(
                heroTag: "btn3",
                onPressed: () => {
                      setState(() {
                        filter = FilterGender.women;
                      })
                    },
                tooltip: 'set filter to female',
                child: const Icon(Icons.female)),
          ],
        ),
      ),
    );
  }
}
