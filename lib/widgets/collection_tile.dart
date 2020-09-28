import 'package:bipolar/screens/collection_photos_display.dart';
import 'package:flutter/material.dart';

class CollectionTile extends StatelessWidget {
  final collectionData;
  CollectionTile({this.collectionData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PhotosDisplay(
                  collectionId: collectionData.collectionId,
                ),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(collectionData.coverImageUrl),
                ),
              ),
            ),
          ),
          Text(
            collectionData.location,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
