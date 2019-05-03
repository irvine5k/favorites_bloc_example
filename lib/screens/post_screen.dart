import 'package:favorites_app_bloc/blocs/post_bloc.dart';
import 'package:favorites_app_bloc/components/post_card.dart';
import 'package:favorites_app_bloc/models/post.dart';
import 'package:favorites_app_bloc/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  PostBloc _postBloc;

  @override
  void initState() {
    _postBloc = PostBloc();
    super.initState();
  }

  @override
  void dispose() {
    _postBloc = PostBloc();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Posts"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: _postBloc.postListFlux,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  Post post = snapshot.data[index];
                  return PostCard(post);
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FavoritesScreen(),
              ),
            ),
      ),
    );
  }
}
