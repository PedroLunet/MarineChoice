import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marinechoice/pages/postpage.dart';
import 'package:marinechoice/pages/recipeinfopage.dart';
import 'package:marinechoice/pages/recipespage.dart';
import 'package:marinechoice/pages/settingspage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:marinechoice/globals.dart' as globals;
import '../components/getUploadImages.dart';
import '../models/recipe_model.dart';
import 'fishpage.dart';
import 'homepage.dart';
import 'mappage.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _database = FirebaseDatabase.instance.ref();
  late Future<void> userData;
  List<Recipe> recipeList = [];
  late String user = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userData = retrieveData();
  }

  Future<void> retrieveData() async {
    await getUserData();
    await retrieveRecipeData();
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
      case 5:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const UserProfile()));
        break;
    }
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color(0xff5B92C6),
      currentIndex: 5,
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
        height: 130 + MediaQuery.of(context).size.height / 8,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff4A668A), width: 3),
            color: const Color(0xff4A668A),
            borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align items to start
          children: [
            Text(
              recipe.recipeData!.title!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const Spacer(), // This will push the following widget to the bottom
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FutureBuilder<String?>(
                future: getImage(recipe.recipeData!
                    .imagePath), // Ensure getImage returns a Future<String?>
                builder:
                    (BuildContext context, AsyncSnapshot<String?> snapshot) {
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
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSingleChildScrollView() {
    return FutureBuilder<void>(
      future: userData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: const EdgeInsets.all(30),
                child: const Center(
                  child: Text(
                    "Your profile",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff4A668A),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(30),
                child: Text("Hello, $user!",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.all(30),
                child: const Text("Here are the recipes you've posted so far:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4A668A),
                    )),
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                    direction: Axis.horizontal,
                    children: _getRecipes(recipeList)),
              ),
            ]),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  List<Widget> _getRecipes(List<Recipe> recipeList) {
    List<Widget> list = [];

    for (int i = 0; i < recipeList.length; i++) {
      list.add(buildContainer(recipeList[i], i));
    }

    return list;
  }

  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    if (username == null) {
      throw Exception("Username null");
    }

    user = username;
  }

  Future<void> retrieveRecipeData() async {
    var result =
        await _database.child(globals.selectedLanguage).child("RECIPE").get();

    for (var recipe in result.children) {
      try {
        RecipeData recipeData =
            RecipeData.fromJson(recipe.value as Map, globals.selectedLanguage);
        Recipe recipef = Recipe(key: recipe.key, recipeData: recipeData);

        if (recipef.recipeData!.author! == user) {
          recipeList.add(recipef);
        }
      } catch (e) {
        if (kDebugMode) {
          print("Error: ${e.toString()}");
        }
      }
    }
    if (kDebugMode) {
      print(recipeList.toString());
    }
  }
}
