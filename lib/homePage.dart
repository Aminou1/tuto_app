import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

T getRandomElement<T>(List<T> list) {
  final random = new Random();
  var i = random.nextInt(list.length);
  return list[i];
}

class _HomePageState extends State<HomePage> {
  List<String> name = ["Issa", "Mani", "Bachir", "Sani"];
  var selectedName = "";
  updateName(name) {
    setState(() {
      selectedName = name;
    });
  }

  int _selected = 0;

  updateIndex(int selectedItem) {
    setState(() {
      _selected = selectedItem;
    });
  }

  updateAppTitle(int index) {
    if (index == 0) {
      return "Accueil";
    } else if (index == 1) {
      return "Recherche";
    } else if (index == 2) {
      return "Favoris";
    } else if (index == 3) {
      return "Profile";
    } else {
      return "Ah lan wa sah lan";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor:Colors.transparent,
          statusBarIconBrightness:Brightness.light,
          systemNavigationBarIconBrightness:Brightness.light,
      ),
        backgroundColor: Colors.green,
        title: Text(updateAppTitle(_selected)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 243, 238, 238),
        child: Center(
            child: Text(
          "As salam aleykoum $selectedName",
          // ignore: prefer_const_constructors
          style: TextStyle(fontSize: 15.0, color: Colors.pink),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          updateName(getRandomElement(name));
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.orange,
         currentIndex: _selected,
         elevation: 5.0,
          onTap: updateIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.orange, size: 34.0),
                label: "Accueil",
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.orange, size: 34.0),
                label: "Recherche",
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color: Colors.orange, size: 34.0),
                label: "Favorie",
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.orange, size: 34.0),
                label: "Profil",
                backgroundColor: Colors.grey)
          ]),
    );
  }
}
