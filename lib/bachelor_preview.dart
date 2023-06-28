import 'package:flutter/material.dart';
import 'models/bachelor.dart';
import 'bachelor_details.dart';

class BachelorPreview extends StatelessWidget {
  final Bachelor bachelor;

  const BachelorPreview({super.key, required this.bachelor});

  void _navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BachelorDetails(bachelor: bachelor)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(bachelor.avatar),
      ),
      title: Text('${bachelor.firstname} ${bachelor.lastname}'),
      subtitle: Text(bachelor.job ?? 'Not specified'),
      onTap: () {
        _navigateToDetails(context);
      },
    );
  }
}
