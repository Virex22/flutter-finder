import 'package:finder/views/partial/bachelor_preview_grid.dart';
import 'package:finder/views/partial/bachelor_preview_list.dart';
import 'package:finder/data/provider/bachelor_likes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/bachelor.dart';

class BachelorFavorites extends StatefulWidget {
  const BachelorFavorites({super.key});

  @override
  State<BachelorFavorites> createState() => _BachelorFavoritesState();
}

class _BachelorFavoritesState extends State<BachelorFavorites> {
  bool isGridMode = false;

  @override
  Widget build(BuildContext context) {
    final BachelorLikes bachelorLikes = context.watch<BachelorLikes>();
    final likedBachelors = bachelorLikes.likedBachelors;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.delete),
                        title: const Text('Delete all'),
                        onTap: () {
                          Navigator.pop(context);
                          for (var bachelor in likedBachelors) {
                            bachelorLikes.removeLikedBachelor(bachelor);
                          }
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.view_module),
                        title: const Text('Grid view'),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            isGridMode = true;
                          });
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.view_list),
                        title: const Text('List view'),
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            isGridMode = false;
                          });
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Center(
        child: likedBachelors.isEmpty
            ? const Text('No favorites yet.')
            : isGridMode
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: likedBachelors.length,
                    itemBuilder: (context, index) {
                      Bachelor bachelor = likedBachelors[index];
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          bachelorLikes.removeLikedBachelor(bachelor);
                        },
                        child: BachelorPreviewGrid(
                          bachelor: bachelor,
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: likedBachelors.length,
                    itemBuilder: (context, index) {
                      Bachelor bachelor = likedBachelors[index];
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          bachelorLikes.removeLikedBachelor(bachelor);
                        },
                        child: BachelorPreviewList(
                          bachelor: bachelor,
                          deletable: true,
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
