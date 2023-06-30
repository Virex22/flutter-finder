import 'package:finder/data/provider/bachelor_list.dart' as bachelor_list;
import 'package:finder/data/provider/bachelor_likes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/bachelor.dart';
import '../page/bachelor_details.dart';

class BachelorPreviewGrid extends StatelessWidget {
  final Bachelor bachelor;

  const BachelorPreviewGrid({Key? key, required this.bachelor})
      : super(key: key);

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
    final BachelorLikes bachelorLikes = context.watch<BachelorLikes>();

    bool isLiked = bachelorLikes.likedBachelors.contains(bachelor);

    return GestureDetector(
      onTap: () {
        _navigateToDetails(context);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: Image.network(
                    bachelor.avatar,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${bachelor.firstname} ${bachelor.lastname}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.grey,
                      ),
                      onPressed: () {
                        bachelorLikes.removeLikedBachelor(bachelor);
                      },
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
}
