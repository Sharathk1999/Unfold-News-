import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String tag;
  final String time;
  const TrendingCard({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.tag,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      width: 280,
      margin: const EdgeInsets.only(right: 10.0),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        children: [
          //Container for news image
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.background,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tag,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                time,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
           Row(
            children: [
              Flexible(
                child: Text(
                  title,
                  style:const TextStyle(
                    fontFamily: "Raleway",
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 12,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 5.0,
              ),
               Text(author)
            ],
          )
        ],
      ),
    );
  }
}
