import 'package:finder/bachelor_likes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/bachelor.dart';
import 'bachelor_details.dart';

class BachelorPreview extends StatelessWidget {
  final Bachelor bachelor;

  const BachelorPreview({Key? key, required this.bachelor}) : super(key: key);

  void _navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BachelorDetails(bachelor: bachelor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bachelorLikes = context.watch<BachelorLikes>();

    bool isLiked = bachelorLikes.likedBachelors.contains(bachelor);

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(bachelor.avatar),
      ),
      title: Text('${bachelor.firstname} ${bachelor.lastname}'),
      subtitle: Text(bachelor.job ?? 'Not specified'),
      trailing: IconButton(
        icon: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          color: isLiked ? Colors.red : null,
        ),
        onPressed: () {
          if (isLiked) {
            bachelorLikes.removeLikedBachelor(bachelor);
          } else {
            bachelorLikes.addLikedBachelor(bachelor);
          }
        },
      ),
      onTap: () {
        _navigateToDetails(context);
      },
    );
  }
}
