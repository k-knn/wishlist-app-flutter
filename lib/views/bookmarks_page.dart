import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist_app/provider/bookmark_provider.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  _BookmarksPageState createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Your wishlist"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: bookmarkBloc.wishlist.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(bookmarkBloc.wishlist[index].title.toString()),
                  subtitle: Text(bookmarkBloc.wishlist[index].subTitle.toString()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
