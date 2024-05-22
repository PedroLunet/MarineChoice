import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marinechoice/pages/editrecipe.dart';
import 'package:marinechoice/pages/postpage.dart';
import 'package:marinechoice/pages/recipespage.dart';
import 'package:marinechoice/pages/userprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/getUploadImages.dart';
import '../components/title_box.dart';
import '../models/rating_model.dart';
import '../models/recipe_model.dart';
import 'settingspage.dart';
import 'fishpage.dart';
import 'homepage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:marinechoice/globals.dart' as globals;
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
  double? _rating;
  double? _avg;
  String user = "";
  late Future<void> calculateAndLoad;
  final _database = FirebaseDatabase.instance.ref();
  List<Rating> ratingList = [];

  @override
  void initState() {
    super.initState();
    // Load the rating from SharedPreferences when the page initializes
    calculateAndLoad = _calculateAndLoad();
  }

  Future<void> _loadRating() async {
    var result = await _database
        .child(globals.selectedLanguage.value)
        .child("RATING")
        .get();

    final SharedPreferences prefsEmail = await SharedPreferences.getInstance();
    String? email = prefsEmail.getString('email');
    if (email == null) {
      throw Exception("Email null");
    }

    for (var rating in result.children) {
      try {
        RatingData ratingData = RatingData.fromJson(
            rating.value as Map, globals.selectedLanguage.value);
        Rating ratingf = Rating(key: rating.key, ratingData: ratingData);
        if (ratingf.ratingData!.user_email == email &&
            ratingf.ratingData!.recipe_title ==
                widget.recipe.recipeData!.title!) {
          if (ratingf.ratingData!.rating == null) {
            return;
          }
          _rating = double.parse(ratingf.ratingData!.rating!);
        }
      } catch (e) {
        if (kDebugMode) {
          print("Error: ${e.toString()}");
        }
      }
    }
  }

  Future<void> _calculateAvg() async {
    var result = await _database
        .child(globals.selectedLanguage.value)
        .child("RATING")
        .get();

    double counter = 0;
    double sum = 0;

    for (var rating in result.children) {
      try {
        RatingData ratingData = RatingData.fromJson(
            rating.value as Map, globals.selectedLanguage.value);

        Rating ratingf = Rating(key: rating.key, ratingData: ratingData);

        if (ratingf.ratingData!.recipe_title ==
            widget.recipe.recipeData!.title!) {
          sum += double.parse(ratingf.ratingData!.rating!);
          counter++;
        }
      } catch (e) {
        if (kDebugMode) {
          print("Error: ${e.toString()}");
        }
      }
    }
    if (counter == 0 && sum == 0) {
      _avg = null;
    } else {
      _avg = sum / counter;
    }

    log(_avg.toString());
  }

  Future<void> _calculateAndLoad() async {
    await getUserData();
    await _loadRating();
    await _calculateAvg();
  }

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

  Widget buildSingleChildScrollView(Recipe recipe) {
    return FutureBuilder<void>(
      future: calculateAndLoad,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          if (kDebugMode) {
            print('Error loading image: ${snapshot.error}');
          }
          return const Center(child: Text('Failed to load image'));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    recipe.recipeData?.title ??
                        AppLocalizations.of(context)!.no_title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff4A668A),
                    ),
                  ),
                ),
              ),
              _avg != null
                  ? Column(
                      children: [
                        RatingBar.builder(
                          initialRating: _avg!,
                          minRating: 0,
                          allowHalfRating: true,
                          tapOnlyMode: true,
                          itemBuilder: (context, _) => const Icon(
                            Icons.sailing_outlined,
                            color: Colors.amber,
                          ),
                          ignoreGestures: true,
                          onRatingUpdate:
                              (double value) {}, // Disable user interaction
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        RatingBar.builder(
                          initialRating: 0,
                          minRating: 0,
                          allowHalfRating: true,
                          tapOnlyMode: true,
                          itemBuilder: (context, _) => const Icon(
                            Icons.sailing_outlined,
                            color: Colors.amber,
                          ),
                          ignoreGestures: true,
                          onRatingUpdate:
                              (double value) {}, // Disable user interaction
                        ),
                        Text(
                          AppLocalizations.of(context)!.no_rating,
                          style: const TextStyle(
                              fontSize: 15, color: Color(0xff4A668A)),
                        ),
                      ],
                    ),
              const SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.3,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff5B92C6), width: 4),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: FutureBuilder<String?>(
                    future: getImage(recipe.recipeData!.imagePath),
                    builder: (BuildContext context,
                        AsyncSnapshot<String?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError || snapshot.data == null) {
                        if (kDebugMode) {
                          print('Error loading image: ${snapshot.error}');
                        }
                        return const Center(
                            child: Text('Failed to load image'));
                      } else {
                        return Image.network(
                          snapshot.data!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        );
                      }
                    },
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      margin: EdgeInsets.all(40),
                      child: TitleBox(
                        title: AppLocalizations.of(context)!.no_title,
                        widget: Container(
                          child: (recipe.recipeData != null &&
                                  recipe.recipeData!.fish != null)
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: recipe.recipeData!.fish!.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                        recipe.recipeData!.fish![index],
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Text(AppLocalizations.of(context)!.no_fish),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: EdgeInsets.all(40),
                      child: TitleBox(
                        title: "Ingredients",
                        widget: Container(
                          child: (recipe.recipeData != null &&
                                  recipe.recipeData!.ingredients != null)
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount:
                                      recipe.recipeData!.ingredients!.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(
                                        recipe.recipeData!.ingredients![index],
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Text(
                                  AppLocalizations.of(context)!.no_ingredients),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(40),
                child: TitleBox(
                  title: AppLocalizations.of(context)!.preparation,
                  widget: Container(
                    child: (recipe.recipeData != null &&
                            recipe.recipeData!.preparation != null)
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
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
                          )
                        : Text(AppLocalizations.of(context)!.no_steps),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Author: ${recipe.recipeData?.author ?? 'Author not available'}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff4A668A),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!.rate_recipe,
                      style: const TextStyle(
                          fontSize: 15, color: Color(0xff4A668A)),
                    ),
                    // Conditionally display static or interactive rating bar based on _hasRated
                    _rating != null
                        ? Column(
                            children: [
                              RatingBar.builder(
                                initialRating: _rating!,
                                minRating: 0,
                                allowHalfRating: true,
                                tapOnlyMode: true,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.sailing_outlined,
                                  color: Colors.amber,
                                ),
                                ignoreGestures: true,
                                onRatingUpdate: (double
                                    value) {}, // Disable user interaction
                              ),
                              const SizedBox(height: 10),
                              Text(
                                AppLocalizations.of(context)!.thank_rating,
                                style: const TextStyle(
                                    fontSize: 15, color: Color(0xff4A668A)),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              RatingBar.builder(
                                initialRating: 0,
                                minRating: 0.5,
                                allowHalfRating: true,
                                tapOnlyMode: true,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.sailing_outlined,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) async {
                                  // Update the state variable and rebuild the widget
                                  setState(() {
                                    _rating = rating; // Update the rating value
                                  });

                                  final SharedPreferences prefsEmail =
                                      await SharedPreferences.getInstance();
                                  String? email = prefsEmail.getString('email');
                                  if (email == null) {
                                    throw Exception("Email null");
                                  }

                                  saveRatingToDatabase(
                                      rating.toString(),
                                      email,
                                      widget.recipe.recipeData?.title ??
                                          'Unknown');
                                },
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                    const SizedBox(height: 30),
                    if (recipe.recipeData!.author! == user)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  EditPage(recipe: widget.recipe)));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blue[200]!),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                side: BorderSide(color: Colors.grey[600]!)),
                          ),
                        ),
                        child: Text(AppLocalizations.of(context)!.edit_recipe),
                      ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> saveRatingToDatabase(
      String rating, String userEmail, String recipeTitle) async {
    // Get a reference to your Firebase Realtime Database
    DatabaseReference reference = FirebaseDatabase.instance.ref();

    // Insert the rating into the database under the 'RATING' node
    reference.child(globals.selectedLanguage.value).child('RATING').push().set({
      'rating': rating,
      'user_email': userEmail,
      'recipe_title': recipeTitle,
    }).then((_) {
      // Rating saved successfully
      if (kDebugMode) {
        print(AppLocalizations.of(context)!.rating_saved);
      }
    }).catchError((error) {
      // Handle any errors
      if (kDebugMode) {
        print('Failed to save rating: $error');
      }
    });
    await _calculateAndLoad();
    setState(() {});
  }

  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? username = prefs.getString('username');
    if (username == null) {
      throw Exception("Username null");
    }

    user = username;
  }
}
