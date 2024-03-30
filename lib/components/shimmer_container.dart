import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  final double width;
  final double hight;
  const ShimmerContainer({super.key, required this.width, required this.hight});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor:Colors.lightBlue[50]!,
        highlightColor: Colors.lightBlue[100]!,
        child: Container(
          width: width,
          height: hight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
        ));
  }
}