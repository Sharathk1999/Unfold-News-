import 'package:flutter/material.dart';

import 'shimmer_container.dart';

class ShimmerTrendingCard extends StatelessWidget {
  const ShimmerTrendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(5),
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(children: [
        ShimmerContainer(
          width: MediaQuery.of(context).size.width,
          hight: 200,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerContainer(
              width: MediaQuery.of(context).size.width / 4,
              hight: 10,
            ),
            ShimmerContainer(
              width: MediaQuery.of(context).size.width / 5,
              hight: 10,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShimmerContainer(
              width: MediaQuery.of(context).size.width / 1.6,
              hight: 20,
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShimmerContainer(
              width: MediaQuery.of(context).size.width / 2 - 0.2,
              hight: 20,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ShimmerContainer(
              width: 30,
              hight: 30,
            ),
            const SizedBox(width: 10),
            ShimmerContainer(
              width: MediaQuery.of(context).size.width / 2,
              hight: 20,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ]),
    );
  }
}