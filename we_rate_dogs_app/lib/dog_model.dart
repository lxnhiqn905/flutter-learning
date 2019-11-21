/// This is the class to define the data structure of the dog

import 'dart:convert';
import 'dart:io';

class Dog {
  /// Will be setting throught contructor
  final String name;
  final String location;
  final String description;

  // Get random image from API
  String imageUrl;

  /// Default rate point is 10
  int rate = 10;

  /// Contructor will be setting the detail information of the dog
  Dog(this.name, this.location, this.description);

  /// Method to get the image from api
  Future getImageUrl() async {

    /// If the dog has been exist then skip this task
    if (imageUrl != null) {
      return imageUrl;
    }

    // Using http client to call api
    HttpClient httpClient = HttpClient();

    // Try get it
    try {
      // Build uri of api need connect - In this case using the dog.ceo
      var uri = Uri.http('dog.ceo', '/api/breeds/image/random');

      // Make request and await until complete
      var request = await httpClient.getUrl(uri);

      // Request completed then close it
      var response = await request.close();

      // Decode the response to get the json content
      var responseBody = await response.transform(utf8.decoder).join();

      // The image will save at response content as name 'message'
      imageUrl = json.decode(responseBody)['message'];

      // On error then print error details
    } catch (e) {
      print(e);
    }
  }
}
