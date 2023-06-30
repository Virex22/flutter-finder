import 'package:finder/data/provider/bachelor_list.dart' as bachelor_list;
import 'package:finder/data/provider/bachelor_likes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/bachelor.dart';
import '../page/bachelor_details.dart';

class BachelorPreviewList extends StatelessWidget {
  final Bachelor bachelor;
  final bool? deletable;
  final bool? hidable;

  const BachelorPreviewList(
      {Key? key, required this.bachelor, this.deletable, this.hidable})
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

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(bachelor.avatar),
      ),
      title: Text('${bachelor.firstname} ${bachelor.lastname}'),
      subtitle: Text(bachelor.job ?? 'Not specified'),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (deletable == null)
              IconButton(
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
            if (deletable == true)
              IconButton(
                icon: const Icon(Icons.heart_broken),
                onPressed: () {
                  bachelorLikes.removeLikedBachelor(bachelor);
                },
              ),
            if (hidable == true)
              IconButton(
                icon: const Icon(Icons.visibility_off),
                onPressed: () {
                  Provider.of<bachelor_list.BachelorList>(context,
                          listen: false)
                      .removeBachelor(bachelor);
                  Provider.of<BachelorLikes>(context, listen: false)
                      .removeLikedBachelor(bachelor);
                },
              ),
          ],
        ),
      ),
      onTap: () {
        _navigateToDetails(context);
      },
    );
  }
}
