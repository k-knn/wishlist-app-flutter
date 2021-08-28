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
      "status": "false",
    },
    {
      "title": "Item 2",
      "subTitle": "This is item 2",
      "status": "false",
    },
    {
      "title": "Item 3",
      "subTitle": "This is item 3",
      "status": "false",
    },
    {
      "title": "Item 4",
      "subTitle": "This is item 4",
      "status": "false",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var bookmarkBloc = Provider.of<BookmarkBloc>(context); //pass provider

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "Wishlist App",
        ),
        actions: [
          Row(
            children: [
              Text(
                bookmarkBloc.count.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
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
                    //print(bookmarkBloc.wishlist[index].title);
                    setState(() {
                      itemsList[index]["status"] = "true";
                    });
                  },
                  title: Text(itemsList[index]['title']),
                  subtitle: Text(itemsList[index]['subTitle']),
                  trailing: itemsList[index]["status"] == "false"
                      ? Icon(Icons.star_border_outlined)
                      : Icon(
                          Icons.star,
                          color: Colors.deepOrange,
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
