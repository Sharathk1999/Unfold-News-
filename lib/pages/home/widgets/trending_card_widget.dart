import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String tag;
  final String time;
  final VoidCallback onTap;
  const TrendingCard({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.tag,
    required this.time, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                   errorBuilder: (context, error, stackTrace) {
                    return Image.network("https://t3.ftcdn.net/jpg/05/52/37/18/360_F_552371867_LkVmqMEChRhMMHDQ2drOS8cwhAWehgVc.jpg");
                  },
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
                  radius: 20,
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: const Center(
                    child: Icon(CupertinoIcons.pen),
                  ),
                ),
                // const SizedBox(
                //   width: 2.0,
                // ),
                 Text(author,style:const TextStyle(
                      fontFamily: "Raleway",
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                   )
              ],
            )
          ],
        ),
      ),
    );
  }
}
