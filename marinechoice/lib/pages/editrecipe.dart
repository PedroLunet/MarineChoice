import 'dart:developer';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marinechoice/pages/postpage.dart';
import 'package:marinechoice/pages/recipeinfopage.dart';
import 'package:marinechoice/pages/settingspage.dart';
import 'package:marinechoice/pages/mappage.dart';
import 'package:marinechoice/pages/recipespage.dart';
import 'package:marinechoice/pages/userprofile.dart';
import '../components/getUploadImages.dart';
import '../models/fish_model.dart';
import '../models/recipe_model.dart';
import 'fishpage.dart';
import 'homepage.dart';
import 'package:marinechoice/globals.dart' as globals;

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<StatefulWidget> createState() {
    return _EditPage();
  }
}

class _EditPage extends State<EditPage> {
  final _database = FirebaseDatabase.instance.ref();
  int selectedBox = -1;
  String searchText = "";
  String imagePath = '';
  bool uploading = false;
  Uint8List? image;
  late Future<void> getInfo;

  late TextEditingController _titleController;
  String _cuisineType = '';
  List<String> _selectedIngredients = [];
  List<String> _selectedFishes = [];
  List<String> _recipeSteps = [];

  final databaseReference = FirebaseDatabase.instance.ref();

  final List<String> _cuisineTypes = [];

  final List<String> _availableIngredients = [];

  final List<String> _availableFishes = [];

  void _addStep() {
    setState(() {
      _recipeSteps.add('');
    });
  }

  @override
  void initState() {
    _titleController =
        TextEditingController(text: widget.recipe.recipeData!.title!);
    _cuisineType = widget.recipe.recipeData!.cusineType!;
    _selectedIngredients = widget.recipe.recipeData!.ingredients!;
    _selectedFishes = widget.recipe.recipeData!.fish!;
    _recipeSteps = widget.recipe.recipeData!.preparation!;
    imagePath = widget.recipe.recipeData!.imagePath!;
    getInfo = getAllInfo();

    super.initState();
  }

  Widget _buildFilterChips(List<String> items, List<String> selectedItems,
      Function(String) onChanged) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        height: 60, // Adjust the height as needed
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: items.map((item) {
            bool isSelected = selectedItems.contains(item);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FilterChip(
                label: Text(item),
                selected: isSelected,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      selectedItems.add(item);
                    } else {
                      selectedItems.remove(item);
                    }
                    onChanged(item);
                  });
                },
                backgroundColor: Colors.blue[200]!,
                checkmarkColor: Colors.white,
                selectedColor: const Color(0xff5B92C6),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffB4D8F9),
        appBar: buildAppBar(),
        bottomNavigationBar: buildBottomNavigationBar(),
        body: buildSingleChildScrollView());
  }

  Widget buildSingleChildScrollView() {
    return FutureBuilder<void>(
        future: getInfo,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(30),
                    child: Text(AppLocalizations.of(context)!.write_recipe,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                        )),
                  ),
                  Container(
                    margin: const EdgeInsets.all(30),
                    child: TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context)!.title_recipe,
                      ),
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.cuisine_type,
                      style: const TextStyle(fontSize: 18)),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    child: _buildFilterChips(_cuisineTypes, [_cuisineType],
                        (selectedItem) {
                      _cuisineType = selectedItem;
                    }),
                  ),
                  Text(AppLocalizations.of(context)!.ingredients,
                      style: const TextStyle(fontSize: 18)),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    child: _buildFilterChips(_availableIngredients,
                        _selectedIngredients, (selectedItem) {}),
                  ),
                  Text(AppLocalizations.of(context)!.fishes,
                      style: const TextStyle(fontSize: 18)),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 30),
                    child: _buildFilterChips(
                        _availableFishes, _selectedFishes, (selectedItem) {}),
                  ),
                  Text(AppLocalizations.of(context)!.recipe_steps,
                      style: const TextStyle(fontSize: 18)),
                  ReorderableListView(
                    physics: const NeverScrollableScrollPhysics(),
                    // Disable scrolling
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final String item = _recipeSteps.removeAt(oldIndex);
                        _recipeSteps.insert(newIndex, item);
                      });
                    },
                    children: _recipeSteps.asMap().entries.map((entry) {
                      int index = entry.key;
                      final TextEditingController controller =
                          TextEditingController(text: entry.value);
                      return ListTile(
                        key: ValueKey(index),
                        title: TextFormField(
                          controller: controller,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.step +
                                ' ' +
                                (index + 1).toString(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _recipeSteps[index] = value;
                            });
                          },
                        ),
                        leading: const Icon(Icons.reorder),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              _recipeSteps.removeAt(index);
                            });
                          },
                          icon: const Icon(Icons.close, color: Colors.red),
                        ),
                      );
                    }).toList(),
                  ),
                  ElevatedButton(
                    onPressed: _addStep,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue[200]!),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            side: BorderSide(color: Colors.grey[600]!)),
                      ),
                    ),
                    child: Text(AppLocalizations.of(context)!.add_step),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (image != null)
                    Image.memory(
                      image!,
                      width: 300,
                    ),
                  Container(
                    margin: const EdgeInsets.all(30),
                    child: ElevatedButton(
                      onPressed: () async {
                        ImagePicker imagePicker = ImagePicker();
                        XFile? file = await imagePicker.pickImage(
                            source: ImageSource.gallery);

                        if (file == null) {
                          log("Something went wrong when getting image");
                        }

                        setState(() {
                          uploading = true;
                        });

                        image = await file?.readAsBytes();

                        Reference refRoot = FirebaseStorage.instance.ref();
                        Reference referenceDirImages = refRoot
                            .child(globals.selectedLanguage.value)
                            .child("recipes");

                        Reference referenceImgtoUpload = referenceDirImages
                          ..child(globals.selectedLanguage.value)
                              .child('${file?.name}');

                        try {
                          await referenceImgtoUpload.putFile(File(file!.path));

                          imagePath = referenceImgtoUpload.fullPath;

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  AppLocalizations.of(context)!.image_uploaded),
                            ),
                          );
                        } catch (error) {
                          if (kDebugMode) {
                            print("Error uploading image: $error");
                          }
                        }

                        setState(() {
                          uploading = false;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        shadowColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              side: const BorderSide(
                                  color: Color(0xff5B92C6), width: 3)),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        child: uploading
                            ? const CircularProgressIndicator()
                            : Text(
                                AppLocalizations.of(context)!.pick_image,
                                style: const TextStyle(
                                    color: Color(0xff5B92C6),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_titleController.text.isNotEmpty &&
                          _cuisineType != '' &&
                          _selectedIngredients.isNotEmpty &&
                          _selectedFishes.isNotEmpty &&
                          _recipeSteps.isNotEmpty) {
                        updateData(
                            _titleController.text,
                            _cuisineType,
                            _selectedIngredients,
                            _selectedFishes,
                            _recipeSteps,
                            imagePath);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue[200]!),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shadowColor:
                          MaterialStateProperty.all<Color>(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            side: BorderSide(color: Colors.grey[600]!)),
                      ),
                    ),
                    child: Text(AppLocalizations.of(context)!.edit_recipe),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          );
        });
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
      currentIndex: 4,
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

  Future<void> updateData(
      String title,
      String cuisineType,
      List<String> ingredients,
      List<String> fishes,
      List<String> steps,
      String imagePath) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("${globals.selectedLanguage.value}/RECIPE/${widget.recipe.key}");

    await ref.update({
      'title': title,
      'cusineType': cuisineType,
      'ingredients': ingredients,
      'preparation': steps,
      'fish': fishes,
      'imagePath': imagePath,
    });

    DataSnapshot updatedRecipe = await ref.get();

    RecipeData recipeData = RecipeData.fromJson(
        updatedRecipe.value as Map, globals.selectedLanguage.value);
    Recipe recipe = Recipe(key: updatedRecipe.key, recipeData: recipeData);

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RecipeInfoPage(recipe: recipe)));
  }

  Future<void> getAllInfo() async {
    await retrieveIngredients();
    await retrieveFishData();
    await retrieveCuisineType();
    await getImageBytes();
  }

  Future<void> getImageBytes() async {
    String? downloadUrl = await getImage(imagePath);
    http.Response response = await http.get(
      Uri.parse(downloadUrl!),
    );

    image = response.bodyBytes;
  }

  Future<void> retrieveIngredients() async {
    var result = await _database
        .child(globals.selectedLanguage.value)
        .child("INGREDIENTS")
        .get();

    for (var ingredient in result.children) {
      try {
        _availableIngredients.add(ingredient.value.toString());
      } catch (e) {
        if (kDebugMode) {
          print("Error: ${e.toString()}");
        }
      }
    }
  }

  Future<void> retrieveCuisineType() async {
    var result = await _database
        .child(globals.selectedLanguage.value)
        .child("CUISINETYPE")
        .get();

    for (var cuisineType in result.children) {
      try {
        _cuisineTypes.add(cuisineType.value.toString());
      } catch (e) {
        if (kDebugMode) {
          print("Error: ${e.toString()}");
        }
      }
    }
  }

  Future<void> retrieveFishData() async {
    var result = await _database
        .child(globals.selectedLanguage.value)
        .child("FISH")
        .get();

    for (var fish in result.children) {
      try {
        FishData fishData = FishData.fromJson(
            fish.value as Map, globals.selectedLanguage.value);
        Fish fishF = Fish(key: fish.key, fishData: fishData);
        _availableFishes.add(fishF.fishData!.name!);
      } catch (e) {
        if (kDebugMode) {
          print("Error: ${e.toString()}");
        }
      }
    }
  }
}
