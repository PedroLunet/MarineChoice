import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marinechoice/pages/postpage.dart';
import 'package:marinechoice/pages/recipespage.dart';
import 'package:marinechoice/pages/userprofile.dart';

import '../components/getUploadImages.dart';
import '../components/title_box.dart';
import '../models/fish_model.dart';
import 'settingspage.dart';
import 'fishpage.dart';
import 'homepage.dart';
import 'mappage.dart';

class FishInfoPage extends StatefulWidget {
  final Fish fish;

  const FishInfoPage({super.key, required this.fish});

  @override
  State<StatefulWidget> createState() {
    return _FishInfoPage();
  }
}

class _FishInfoPage extends State<FishInfoPage> {
  Map<String, Color> rates = {
    "High": Colors.green,
    "Medium": Colors.orange,
    "Low": Colors.red
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffB4D8F9),
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: buildSingleChildScrollView(widget.fish),
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

  Widget buildSingleChildScrollView(Fish fish) {
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40,),
            Center(
              child: Text(
                fish.fishData!.name!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff4A668A)
                ),
              ),
            ),
            Text(
              fish.fishData!.origin!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff5B92C6)
              ),
            ),
            const SizedBox(height: 40,),

            Container(
              margin: const EdgeInsets.fromLTRB(0,0,0,40),
                decoration: BoxDecoration(

                  border: Border.all(color: const Color(0xff5B92C6), width: 4),
                  borderRadius: BorderRadius.circular(30),),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),

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
                    width: MediaQuery.of(context).size.width * 0.9,
                    //height: MediaQuery.of(context).size.height * 0.25,
                    );
                  }},
                  ),
                ),
            ),

            TitleBox(title: "Fun Fact!", text: fish.fishData!.facts!),
            const SizedBox(height: 40,),

            TitleBox(title: "Average price per kilogram", text: fish.fishData!.avgPricePerKg!),
            const SizedBox(height: 40,),

            TitleBox(title: "Sustainability Rate", widget: getSustainabilityBadge(fish)),
            const SizedBox(height: 40,),

          ],
        ),
      ),
    );
  }


 Widget getSustainabilityBadge(Fish fish){

    return Container(
      decoration: BoxDecoration(
          color: rates[fish.fishData!.sustainabilityRate!],
          borderRadius: BorderRadius.circular(50)),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Text(
        fish.fishData!.sustainabilityRate!,
        style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
    );

 }

}
