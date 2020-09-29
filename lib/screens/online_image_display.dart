import 'package:bipolar/services/api_data_handler.dart';
import 'package:flutter/material.dart';
import '../widgets/collection_tile.dart';

class OnlineImageDisplay extends StatefulWidget {
  @override
  _OnlineImageDisplayState createState() => _OnlineImageDisplayState();
}

class _OnlineImageDisplayState extends State<OnlineImageDisplay> {
  List<String> imageUrls = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiDataHandler.getCollectionData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      CollectionTile(
                        collectionData: snapshot.data[2 * index],
                      ),
                      CollectionTile(
                        collectionData: snapshot.data[2 * index + 1],
                      ),
                    ],
                  );
                });
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Fetching data',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            );
          }
        });
  }
}
