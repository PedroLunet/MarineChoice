import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marinechoice/pages/postpage.dart';
import 'package:marinechoice/pages/settingspage.dart';
import 'package:marinechoice/pages/mappage.dart';
import 'package:marinechoice/pages/recipespage.dart';
import 'package:marinechoice/pages/userprofile.dart';
import 'fishpage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  int selectedBox = -1;
  String searchText = "";

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
          Text(
            AppLocalizations.of(context)!.did_you_know,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: Color(0xff4A668A),
            ),
          ),
          buildContainer(AppLocalizations.of(context)!.statement1, 0),
          buildContainer(AppLocalizations.of(context)!.statement2, 1),
          buildContainer(AppLocalizations.of(context)!.statement3, 2),
          buildContainer(AppLocalizations.of(context)!.statement4, 3),
          buildContainer(AppLocalizations.of(context)!.statement5, 4),
        ],
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
      currentIndex: 0,
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
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/fishing-rod.svg',
            height: 25,
            width: 30,
          ),
          label: AppLocalizations.of(context)!.fish,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/chef-hat.svg',
            height: 30,
            width: 30,
          ),
          label: AppLocalizations.of(context)!.cook,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/map.svg',
            height: 30,
            width: 30,
          ),
          label: AppLocalizations.of(context)!.map,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/envelope-open.svg',
            height: 25,
            width: 30,
          ),
          label: AppLocalizations.of(context)!.post,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/user.svg',
            height: 30,
            width: 30,
          ),
          label: AppLocalizations.of(context)!.you,
        ),
      ],
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w900,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w900,
      ),
    );
  }

  Widget buildContainer(String text, int number) {
    if (number == selectedBox || text.length <= 27 * 6) {
      return Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width - 20,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff4A668A), width: 3),
            color: const Color(0xff4A668A),
            borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff4A668A), width: 3),
            color: const Color(0xff4A668A),
            borderRadius: BorderRadius.circular(15)),
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Text(
            "${text.characters.take((27 * 6) - 3)}...",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          TextButton(
              onPressed: () => {
                    setState(() {
                      selectedBox = number;
                    })
                  },
              child: Text(AppLocalizations.of(context)!.read_more,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffB4D8F9),
                  )))
        ]),
      );
    }
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
}
