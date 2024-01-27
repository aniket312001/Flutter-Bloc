import 'package:bloc2/model/post_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>> getPostsApi() async {
    final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

    try {
      // Make a GET request
      final response = await http.get(Uri.parse(apiUrl));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the JSON response
        print(response.body.toString() + " response");
        List<dynamic> postData = json.decode(response.body);

        // var data = postData.map((data) => PostModel.fromJson(data)).toList();

        // Create a Post instance from the JSON data
        return postData.map((data) => PostModel.fromJson(data)).toList();
      } else {
        throw Exception(
            'Failed to load post. Status code: ${response.statusCode}');
        // print('Failed to load post. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print(error.toString() + "error");
      return Future.error('Error: $error');
      // print('Error: $error');
    }
  }
}
