import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:favorites_app_bloc/blocs/favorite_card.dart';
import 'package:favorites_app_bloc/blocs/favorites_bloc.dart';
import 'package:favorites_app_bloc/models/post.dart';
import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final Post post;
  PostCard(this.post);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  FavoriteCardBloc _favoriteCardBloc;

  @override
  void initState() {
    _favoriteCardBloc = FavoriteCardBloc(widget.post);
    WidgetsBinding.instance.addPersistentFrameCallback((_){

    });
    super.initState();
  }

  @override
  void dispose() {
    _favoriteCardBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FavoriteBloc favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    return Card(
      color: Colors.grey[300],
      child: Container(
        margin: const EdgeInsets.all(10),
        width: 200,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Id: ${widget.post.id}"),
            Text("Title: ${widget.post.title}"),
            Text("Body: ${widget.post.body}"),
            StreamBuilder(
              stream: _favoriteCardBloc.isFavoriteFlux,
              initialData: false,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return snapshot.data
                    ? IconButton(
                        icon: Icon(Icons.favorite),
                        color: Colors.red,
                        onPressed: () {
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
