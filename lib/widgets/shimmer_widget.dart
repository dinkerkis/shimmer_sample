import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget {
  getShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, pos) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: Colors.white,
                    height: 50, width: 50,
                  ),
                ),
                title: Container(
                  color: Colors.white,
                  height: 18,
                ),
                subtitle: Container(
                  color: Colors.white,
                  height: 12,
                ),
              ),
              const Divider(color: Colors.white,),
            ],
          );
        },
      ),
    );
  }
}