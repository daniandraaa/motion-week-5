import 'package:clone_ig/app/data/model/post_model.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final PostModel model;
  final void Function() onPressed;

  const Post({super.key, required this.model, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/${model.profilepic}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Visibility(
                          visible: model.isSponsored,
                          child: const Text(
                            "Sponsored",
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Icon(Icons.menu)
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Image.asset(
            'assets/images/${model.postings}',
            fit: BoxFit.cover,
            width: double.infinity,
            height: 390,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        model.isLiked ? Icons.favorite : Icons.favorite_border,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.chat_bubble_outline,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send_outlined,
                      ),
                    ),
                  ],
                ),
                const Icon(Icons.bookmark_border_rounded)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.likesCount} Likes',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "${model.username} ",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      model.description,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
