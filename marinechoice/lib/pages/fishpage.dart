import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marinechoice/pages/fishinfopage.dart';
import 'package:marinechoice/pages/recipespage.dart';

import '../components/getUploadImages.dart';
import '../models/fish_model.dart';
import 'settingspage.dart';
import 'homepage.dart';
import 'mappage.dart';

class FishPage extends StatefulWidget {
  const FishPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FishPage();
  }
}

class _FishPage extends State<FishPage> {
  final _database = FirebaseDatabase.instance.ref();

  List<Fish> fishList = [];

  Map<String,Color> rates= {
    "High" : Colors.green,
    "Medium" : Colors.orange,
    "Low" : Colors.red
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffB4D8F9),
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: buildSingleChildScrollView(),
    );
  }

  Widget buildContainer(Fish fish, int number) {
    if (fishList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FishInfoPage(fish: fish)))
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width / 2 - 20,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffD6E7F7), width: 3),
            color: const Color(0xffD6E7F7),
            borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(
            fish.fishData!.name!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FutureBuilder<String?>(
              future: getImage(fish.fishData!.imagePath), // Ensure getImage returns a Future<String?>
              builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || snapshot.data == null) {
                  if (kDebugMode) {
                    print('Error loading image: ${snapshot.error}');
                  }
                  return const Center(child: Text('Failed to load image'));
                } else {
                  return Image.network(
                    snapshot.data!,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    height: MediaQuery.of(context).size.height / 8,
                  );
                }},
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            decoration: BoxDecoration(
              color: rates[fish.fishData!.sustainabilityRate!],
              borderRadius: BorderRadius.circular(50)
            ),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child:Text(
              fish.fishData!.sustainabilityRate!,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),
            ),
            ),


        ]),
      ),
    );
  }

  Widget buildSingleChildScrollView() {
    return FutureBuilder<void>(
        future: retrieveFishData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  child: const Text("Fish and their sustainability rating",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Wrap(
                    direction: Axis.horizontal,
                    children: _getFish(fishList)),
              ]),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  List<Widget> _getFish(List<Fish> fishList) {
    List<Widget> list = [];

    for (int i = 0; i < fishList.length; i++) {
      list.add(buildContainer(fishList[i], i));
    }

    return list;
  }

  _navigate(int index) {
    switch (index) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const FishPage()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const RecipesPage()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const MapPage()));
        break;
    }
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xff5B92C6),
      currentIndex: 1,
      onTap: _navigate,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/home.svg',
            height: 25,
            width: 30,
          ),
          label: ("HOME"),
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/fishing-rod.svg',
            height: 25,
            width: 30,
          ),
          label: ("FISH"),
        ),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/chef-hat.svg',
              height: 30,
              width: 30,
            ),
            label: ("COOK")),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/map.svg',
              height: 30,
              width: 30,
            ),
            label: ("MAP")),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/envelope-open.svg',
              height: 25,
              width: 30,
            ),
            label: ("POST")),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              height: 30,
              width: 30,
            ),
            label: ("YOU")),
      ],
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w900,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w900,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xffB4D8F9),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: SvgPicture.asset(
              'assets/icons/settings.svg',
              height: 37,
              width: 37,
            ),
          ),
        )
      ],
      title: const Center(
        child: Text(
          "MarineChoice",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Future<void> retrieveFishData() async {
    var result = await _database.child("FISH").get();

    for (var fish in result.children) {
      try{
        FishData fishData = FishData.fromJson(fish.value as Map);
        Fish fishF = Fish(key: fish.key, fishData: fishData);
        fishList.add(fishF);
      }catch(e){
        if (kDebugMode) {
          print("Error: ${e.toString()}");
        }
      }

    }
  }

}
