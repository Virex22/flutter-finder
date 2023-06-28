import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:finder/bachelor_likes.dart';
import 'package:flutter/material.dart';
import 'models/bachelor.dart';
import 'package:provider/provider.dart';

class BachelorDetails extends StatefulWidget {
  final Bachelor bachelor;

  const BachelorDetails({
    Key? key,
    required this.bachelor,
  }) : super(key: key);

  @override
  BachelorDetailsState createState() => BachelorDetailsState();
}

class BachelorDetailsState extends State<BachelorDetails> {
  bool isLiked = false;
  final ConfettiController _controller =
      ConfettiController(duration: const Duration(microseconds: 100));

  @override
  void initState() {
    final bachelorLikes = Provider.of<BachelorLikes>(context, listen: false);
    isLiked = bachelorLikes.isLiked(widget.bachelor);
    super.initState();
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        _controller.play();
      }
    });
    final bachelorLikes = Provider.of<BachelorLikes>(context, listen: false);
    if (isLiked) {
      bachelorLikes.addLikedBachelor(widget.bachelor);
    } else {
      bachelorLikes.removeLikedBachelor(widget.bachelor);
    }
    showLikeSnackbar();
  }

  void showLikeSnackbar() {
    final snackBar = SnackBar(
      content: Text(
        isLiked
            ? 'You liked ${widget.bachelor.firstname} ${widget.bachelor.lastname}'
            : 'You unliked ${widget.bachelor.firstname} ${widget.bachelor.lastname}',
      ),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bachelor Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.bachelor.avatar),
                  radius: 50,
                ),
                IconButton(
                  icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked
                          ? Colors.red
                          : Colors.white.withOpacity(0.75)),
                  onPressed: _toggleLike,
                ),
                ConfettiWidget(
                  confettiController: _controller,
                  blastDirectionality: BlastDirectionality.explosive,
                  blastDirection: -(11 * pi / 6),
                  emissionFrequency: 0.05,
                  numberOfParticles: 500,
                  maxBlastForce: 100,
                  minBlastForce: 80,
                  gravity: 0.1,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple,
                    Colors.yellow,
                    Colors.red,
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              '${widget.bachelor.firstname} ${widget.bachelor.lastname}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Job: ${widget.bachelor.job ?? 'Not specified'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Description: ${widget.bachelor.description ?? 'Not specified'}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleLike,
              child: Text(
                isLiked ? 'Unlike' : 'Like',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
