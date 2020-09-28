import 'package:bipolar/services/api_data_handler.dart';
import 'package:flutter/material.dart';

class PhotosDisplay extends StatefulWidget {
  final String collectionId;
  PhotosDisplay({this.collectionId});
  @override
  _PhotosDisplayState createState() => _PhotosDisplayState();
}

class _PhotosDisplayState extends State<PhotosDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            ApiDataHandler().getPhotosData(collectionId: widget.collectionId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: 3, //TODO:derive itemcount from data
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      ImageTile(
                        imageUrl: snapshot.data[2 * index],
                      ),
                      ImageTile(
                        imageUrl: snapshot.data[2 * index + 1],
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
                  Text('Fetching data'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class ImageTile extends StatelessWidget {
  final imageUrl;
  ImageTile({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.45,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
