import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marinechoice/pages/postpage.dart';
import 'package:marinechoice/pages/recipeinfopage.dart';
import '../models/recipe_model.dart';
import 'settingspage.dart';
import 'fishpage.dart';
import 'homepage.dart';
import 'mappage.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RecipesPage();
  }
}

class _RecipesPage extends State<RecipesPage> {
  final _database = FirebaseDatabase.instance.ref();

  List<Recipe> recipeList = [];

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

  Widget buildContainer(Recipe recipe, int number) {
    if (recipeList.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => RecipeInfoPage(recipe: recipe)))
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width / 2 - 20,
        height: 130,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffD6E7F7), width: 3),
            color: const Color(0xffD6E7F7),
            borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(children: [

              Text(
                recipe.recipeData!.title!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildSingleChildScrollView() {
    return FutureBuilder<void>(
        future: retrieveRecipeData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  child: const Text("Recommended",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                Wrap(
                    direction: Axis.horizontal,
                    children: _getRecipes(recipeList)),
              ]),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  List<Widget> _getRecipes(List<Recipe> recipeList) {
    List<Widget> list = [];

    for (int i = 0; i < recipeList.length; i++) {
      list.add(buildContainer(recipeList[i], i));
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
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const PostPage()));
        break;
    }
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xff5B92C6),
      currentIndex: 2,
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

  Future<void> retrieveRecipeData() async {
    var result = await _database.child("RECIPE").get();

    for (var recipe in result.children) {
      try{
        RecipeData recipeData = RecipeData.fromJson(recipe.value as Map);
        Recipe recipef = Recipe(key: recipe.key, recipeData: recipeData);
        recipeList.add(recipef);
      }catch(e){
        if (kDebugMode) {
          print("Error: ${e.toString()}");
        }
      }

    }
  }
}
