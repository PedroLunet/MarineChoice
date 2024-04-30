import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marinechoice/pages/recipespage.dart';

import '../models/recipe_model.dart';
import 'SettingsPage.dart';
import 'homepage.dart';
import 'mappage.dart';

class RecipeInfoPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeInfoPage({super.key, required this.recipe});

  @override
  State<StatefulWidget> createState() {
    return _RecipeInfoPage();
  }


}


class _RecipeInfoPage extends State<RecipeInfoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffB4D8F9),
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: buildSingleChildScrollView(widget.recipe),
    );
  }

  _navigate(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomePage()));
        break;
      case 2:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RecipesPage()));
        break;
      case 3:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const MapPage()));
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
            'assets/icons/home.svg', height: 25, width: 30,),
          label: ("HOME"),),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/fishing-rod.svg', height: 25, width: 30,),
          label: ("FISH"),),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/chef-hat.svg', height: 30, width: 30,),
            label: ("COOK")),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/map.svg', height: 30, width: 30,),
            label: ("MAP")),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/envelope-open.svg', height: 25, width: 30,),
            label: ("POST")),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg', height: 30, width: 30,),
            label: ("YOU")),
      ],
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900,),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900,),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
        margin: const EdgeInsets.only(left: 55, top: 30, right: 55, bottom: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [Color(0xffD6E7F7), Color(0xffD6E7F7)],
            )),
      ),
      title: TextField(
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black87,
        decoration: InputDecoration(
          suffixIcon: Padding(
              padding:
              const EdgeInsets.only(left: 20, top: 5, right: 0, bottom: 5),
              child: SvgPicture.asset('assets/icons/search.svg')),
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.black87),
          border: InputBorder.none,
        ),
      ),
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
              color: Color(0xffB4D8F9),
            ),
            child: SvgPicture.asset(
              'assets/icons/settings.svg',
              height: 37,
              width: 37,
            ),
          ),
        )
      ],
    );
  }

  SingleChildScrollView buildSingleChildScrollView(Recipe recipe) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                recipe.recipeData?.title ?? 'Title not available',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Ingredients:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Check if recipeData and ingredients are not null before accessing them
          if (recipe.recipeData != null && recipe.recipeData!.ingredient != null)
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recipe.recipeData!.ingredient!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    recipe.recipeData!.ingredient![index],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              },
            ),
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Preparation:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Check if recipeData and ingredients are not null before accessing them
          if (recipe.recipeData != null && recipe.recipeData!.preparation != null)
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: recipe.recipeData!.preparation!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    recipe.recipeData!.preparation![index],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              },
            ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              "Author: ${recipe.recipeData?.author ?? 'Author not available'}",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }



}
