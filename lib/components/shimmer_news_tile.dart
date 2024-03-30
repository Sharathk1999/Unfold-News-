import 'package:flutter/material.dart';

import 'shimmer_container.dart';

class ShimmerNewsTile extends StatelessWidget {
  const ShimmerNewsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          const ShimmerContainer(width: 120, hight: 120),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const ShimmerContainer(
                      width: 30,
                      hight: 30,
                    ),
                    const SizedBox(width: 10),
                    ShimmerContainer(
                      width: MediaQuery.of(context).size.width / 2.6,
                      hight: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ShimmerContainer(
                  width: MediaQuery.of(context).size.width / 1.6,
                  hight: 15,
                ),
                const SizedBox(height: 10),
                ShimmerContainer(
                  width: MediaQuery.of(context).size.width / 1.8,
                  hight: 15,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerContainer(
                      width: MediaQuery.of(context).size.width / 5,
                      hight: 15,
                    ),
                    ShimmerContainer(
                      width: MediaQuery.of(context).size.width / 5,
                      hight: 15,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}