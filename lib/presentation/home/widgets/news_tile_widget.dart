import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String time;
  const NewsTile({super.key, required this.title, required this.author, required this.imageUrl, required this.time,});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.background,
            ),
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                     Text(author)
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                 Text(
                  title,
                  maxLines: 2,
                ),
                Text(
                  time,
                  style: Theme.of(context).textTheme.labelSmall,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
