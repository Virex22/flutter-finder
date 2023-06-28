import 'package:flutter/material.dart';
import 'models/bachelor.dart';
import 'bachelor_preview.dart';

class BachelorList extends StatelessWidget {
  final List<Bachelor> bachelors;

  const BachelorList({super.key, required this.bachelors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bachelors.length,
      itemBuilder: (context, index) {
        return BachelorPreview(bachelor: bachelors[index]);
      },
    );
  }
}
