import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/services/category.dart';
import 'package:untitled3/services/category_operations.dart';
import 'package:untitled3/services/music.dart';
import 'package:untitled3/services/music_operations.dart';
import 'package:untitled3/services/music1.dart';
import 'package:untitled3/services/music_operations1.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  Widget createCategory(category Category) {
    //to convet categor ydata to widget
    // double containerHeight = 300.0;
    return Container(
      color: Colors.blueGrey.shade900,
      //height: containerHeight,
      child: Row(
        children: [
          Image.network(
            Category.imageURL,
            fit: BoxFit.cover,
            // height: containerHeight,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              Category.name,
              style: TextStyle(color: Colors.white),
            ), //children needs list of catergories
          ),
        ],
      ),
    );
  }

  List<Widget> createListOfCategories() {
    List<category> categoryList = CategoryOperations
        .getCategories(); //traverse category list convetr to widgit//receive data cobert data to widget using map function
    List<Widget> categories = categoryList
        .map((category Category) => createCategory(Category))
        .toList();
    return categories;
  }

  Widget createMusic(Music music) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
              height: 120,
              width: 120,
              child: Image.network(music.image, fit: BoxFit.cover)),
          Text(music.name, style: TextStyle(color: Colors.white)),
          Text(music.desc, style: TextStyle(color: Colors.white))
        ],
      ),
    );
  }

  Widget createMusicList(String label) {
    List<Music> musicList = MusicOperations.getMusic(); //get music
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Made For You',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 200,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                //item builer context and index
                return createMusic(musicList[index]);
              },
              itemCount: musicList.length),
        ),
      ]),
    );
  }

  Widget createMusic1(Music1 music1) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
              height: 120,
              width: 120,
              child: Image.network(music1.image, fit: BoxFit.cover)),
          Text(music1.name, style: TextStyle(color: Colors.white)),
          Text(music1.desc, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget createMusicList1(String label) {
    List<Music1> musicList1 = MusicOperations1.getMusic1(); //get music
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
          /* Text(
        'Made For You',
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),*/
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Artists',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, index) {
                    //item builer context and index
                    return createMusic1(musicList1[index]);
                  },
                  itemCount: musicList1.length),
            ),
          ]),
    );
  }

  Widget createGrid() {
    return Container(
      padding: EdgeInsets.all(10),
      height: 200,
      child: GridView.count(
        childAspectRatio: 5 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2, //2 cells shown ata atime
        children: createListOfCategories(), //to bring data children
      ),
    );
  }

  Widget createAppBar(String msg) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(msg),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(
              Icons.settings,
              color: Colors.white,
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blueGrey.shade500, Colors.black, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
        children: [
          createAppBar('Welcome Back'),
          SizedBox(
            height: 5,
          ),
          createGrid(),
          createMusicList('Music for you'),
          createMusicList1('Top Artists'),
        ],
      ),

      //color: Colors.orange,
    ));
  }
}
