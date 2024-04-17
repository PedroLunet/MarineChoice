
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marinechoice/dbhelper.dart';
import 'package:marinechoice/pages/recipeinfopage.dart';

import '../models/recipe_model.dart';
import 'homepage.dart';
import 'mappage.dart';


class RecipesPage extends StatefulWidget{
  const RecipesPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RecipesPage();
  }



}

class _RecipesPage extends State<RecipesPage> {

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final preparationController = TextEditingController();
    final authorController = TextEditingController();


    return Scaffold(
      backgroundColor: const Color(0xffB4D8F9),
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: buildSingleChildScrollView(),
    );
  }

  Widget buildContainer(Recipe recipe, int number) {
      return GestureDetector(
        onTap: () =>{Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecipeInfoPage(recipe:recipe)))},
        child:Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width/2 - 20,
        height: 130,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffD6E7F7), width: 3),
            color: const Color(0xffD6E7F7),
            borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        child: Column(
          children:[ Text(
            recipe.title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),]
        ),
      ),);

  }

  Widget buildSingleChildScrollView() {

    return FutureBuilder<List<Recipe>?>(
        future: DataBaseHelperFilters.getAllRecipes(),
        builder: (context,snapshot){
          if (snapshot.connectionState == ConnectionState.done){

            print(snapshot.data);
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(30),
                    child: const Text("Recommended",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    )),
                  ),
                  Wrap(
                    direction: Axis.horizontal,
                  children: _getRecipes(snapshot.data)
                ),]
              ),
            );
          }else{
            return const Center(child: CircularProgressIndicator());
          }


        });


  }

 List<Widget> _getRecipes(List<Recipe>? recipes) {
    List<Widget>  list = [];
    if (recipes == null){
      return list;
    }else{
      for (int i = 0; i < recipes.length; i++) {list.add(buildContainer(recipes[i],i));}
    }
    return list;
 }

  _navigate(int index){
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
          label: ("FIND"),),
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
            label: ("SHARE")),
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
          onTap: () {},
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


}