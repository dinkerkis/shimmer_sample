import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListWidget {
  getList(data) {
    return ListView.builder(
      itemCount: data.isEmpty ? 0 : data.length,
      itemBuilder: (context, pos) {
        var image = data[pos]['image-url'];
        var title = data[pos]['title'];
        var description = data[pos]['description'];
        return Column(
          children: <Widget>[
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(image,
                  fit: BoxFit.fill,
                  height: 50, width: 50,
                  loadingBuilder: (ctx, child, progress) {
                    if (progress == null) return child;
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      enabled: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          color: Colors.white,
                          height: 50, width: 50,
                        ),
                      ),
                    )
                    /*Container(
                      padding: const EdgeInsets.all(10),
                      height: 50, width: 50,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.black,
                        value: progress.expectedTotalBytes != null
                            ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                            : null,
                      ),
                    )*/;
                  },
                ),
              ),
              title: Text(title, style: TextStyle(fontSize: 20),),
              subtitle: Text(description, style: TextStyle(fontSize: 14),),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}