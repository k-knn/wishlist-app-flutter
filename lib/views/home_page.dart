import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist_app/models/items_model.dart';
import 'package:wishlist_app/provider/bookmark_provider.dart';
import 'package:wishlist_app/views/bookmarks_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List itemsList = [
    {
      "title": "Item 1",
      "subTitle": "This is item 1",
    },
    {
      "title": "Item 2",
      "subTitle": "This is item 2",
    },
    {
      "title": "Item 3",
      "subTitle": "This is item 3",
    },
    {
      "title": "Item 4",
      "subTitle": "This is item 4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context); //pass provider
    // ItemModel itemModel = new ItemModel(title: title, subTitle: subTitle)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "Wishlist App",
        ),
        actions: [
          Row(
            children: [
              Text(bookmarkBloc.count.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookmarksPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: itemsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    bookmarkBloc.incrementCount(); // increment count of item

                    ItemModel itemsModel = new ItemModel(
                        title: itemsList[index]['title'],
                        subTitle: itemsList[index]['subTitle']);

                    bookmarkBloc.addItems(
                       itemsModel); // add item count in bookmark provider
                    print(bookmarkBloc.wishlist[index].title);
                  },
                  title: Text(itemsList[index]['title']),
                  subtitle: Text(itemsList[index]['subTitle']),
                  trailing: Icon(Icons.add),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
