import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marinechoice/pages/mappage.dart';
import 'package:marinechoice/dbhelper.dart';
import 'package:marinechoice/pages/recipespage.dart';
import 'package:sqflite/sqflite.dart';
import 'package:animated_search_bar/animated_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  int selectedBox = -1;
  String searchText="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffB4D8F9),
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigationBar(),
        body: buildSingleChildScrollView());
  }

  SingleChildScrollView buildSingleChildScrollView() {

    return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: const Text(
                'WELCOME, John Doe',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            Container(
              child: const Text(
                'Did you know...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            buildContainer(
                'To satisfy our appetite, we are catching more fish than the ocean can produce. We have reached a point where marine ecosystems and many local communities - especially in developing countries - are at risk. Overfishing has become the second largest threat to our oceans, after climate change, and soon there may be no more fish to catch, produce, or eat.',
                0),
            buildContainer(
                '93% of fish stocks in the Mediterranean are overexploited.',
                1),
            buildContainer('31% of global fish stocks are overexploited.', 2),
            buildContainer(
                'In 2022, the household spending on fishery and aquaculture products in the EU-27 surged by nearly 11% compared to 2021, accelerating the upward trend that began in 2018.',
                3),
            buildContainer(
                'Illegal, unreported, and unregulated fishing could soon reach up to 26 million tons, more than 30% of the total annual catch of the world.',
                4),
          ],
        ),
      );
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
      currentIndex: 0,
      onTap: _navigate,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/home.svg', height: 25, width: 30,),
          label: ("HOME"),),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/fishing-rod.svg', height: 25, width: 30,),
          label: ("FIND"),),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/chef-hat.svg', height: 30, width: 30,),
            label: ("COOK")),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/map.svg', height: 30, width: 30,),
            label: ("MAP")),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/envelope-open.svg', height: 25, width: 30,),
            label: ("SHARE")),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/user.svg', height: 30, width: 30,),
            label: ("YOU")),
      ],
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900,),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900,),
    );
  }


  Widget buildContainer(String text, int number) {
    if (number == selectedBox || text.length <= 27 * 6) {
      return Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff126863), width: 3),
            color: const Color(0xffD6E7F7),
            borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff126863), width: 3),
            color: const Color(0xffD6E7F7),
            borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Text(
            "${text.characters.take((27 * 6) - 3)}...",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextButton(
              onPressed: () => {
                    setState(() {
                      selectedBox = number;
                    })
                  },
              child: const Text("Read more...",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )))
        ]),
      );
    }
  }

  AppBar buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        alignment: Alignment.center,
        child: AnimatedSearchBar(
          label: "Search Something Here",
          onChanged: (value) {
            debugPrint("value on Change");
            setState(() {
              searchText = value;
            });
          },
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
