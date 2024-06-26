import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String time;
  final VoidCallback onTap;
  const NewsTile({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                      const Icon(CupertinoIcons.pencil_ellipsis_rectangle),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Flexible(
                        child: Text(author,style:const TextStyle(
                        fontFamily: "Raleway",
                        fontSize: 12,
                                            
                                            ),
                                            overflow: TextOverflow.ellipsis,),
                      )
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
      ),
    );
  }
}
