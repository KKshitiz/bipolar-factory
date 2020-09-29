import 'dart:convert';
import 'package:bipolar/models/collection_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String _collectionUrl =
    'https://api.unsplash.com/collections/?client_id=54LyzyMPDBiEqLm28Z8lUynxiKeZI_fnwVQRLwpclLo';
const String _photosUrlPrefix = "https://api.unsplash.com/collections/";
const String _photosUrlSuffix =
    "/photos?client_id=54LyzyMPDBiEqLm28Z8lUynxiKeZI_fnwVQRLwpclLo";

class ApiDataHandler {
  static List<Collection> _collectionData = [];
  List<String> _photosUrl = [];

  Future<void> _fetchPhotosData(String collectionId) async {
    http.Response response = await http
        .get("$_photosUrlPrefix$collectionId$_photosUrlSuffix".toString());
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var photoData in jsonData) {
        _photosUrl.add(photoData["urls"]["small"]);
      }
      print(_photosUrl);
    } else {
      print(jsonData['errors']);
    }
  }

  static Future<void> _fetchCollectionData() async {
    http.Response response = await http.get(_collectionUrl);
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      for (var collection in jsonData) {
        String id = collection['id'].toString();
        String location = collection['cover_photo']['user']['location'];
        String photosUrl = collection['links']['photos'];
        String coverImageUrl = collection['cover_photo']['urls']['small'];
        print('$coverImageUrl');
        _collectionData.add(Collection(
            collectionId: id,
            location: location,
            collectionPhotosUrl: photosUrl,
            coverImageUrl: coverImageUrl));
      }
    } else {
      print(jsonData['errors']);
    }
  }

  static Future<List<Collection>> getCollectionData() async {
    await _fetchCollectionData();
    return _collectionData;
  }

  Future<List<String>> getPhotosData({@required String collectionId}) async {
    await _fetchPhotosData(collectionId);
    return _photosUrl;
  }
}
