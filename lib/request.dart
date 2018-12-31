import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_connection/heros.dart';
import 'package:http/http.dart' as http;

class Post {
  var _userId;
  var _id;
  var _title;
  var _body;

  Post(this._userId, this._id, this._title, this._body);

  get body => _body;

  get title => _title;

  get id => _id;

  get userId => _userId;
}

Future<List<Post>> fetchPost() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts');

  if (response.statusCode == 200) {
    print("object 200");
    List<Post> mList = [];
    var jsonData = json.decode(response.body);
    // If the call to the server was successful, parse the JSON
    for (var post in jsonData) {
      var userId = post['userId'];
      var id = post['id'];
      var title = post['title'];
      var body = post['body'];

      mList.add(Post(userId, id, title, body));
    }

    return mList;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class ResponsePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final getFuturePost = FutureBuilder(
      future: fetchPost(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print("object has data");
          return Container(
            color: Colors.white70,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: _buildListViewWidgets(snapshot.data),
          );
        } else if (snapshot.hasError) {
          print("object error");
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner
        return CircularProgressIndicator();
      },
    );

    return Center(
      child: getFuturePost,
    );
  }

  Widget _buildListViewWidgets(List<Post> posts) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Heroes(
          name: posts[index].title,
          color: Colors.yellowAccent,
          imageLocation: AssetImage('images/Mt._Lady_anime_portrait.png')),
      itemCount: posts.length,
    );
  }
}
