import 'dart:developer';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marinechoice/pages/settingspage.dart';
import 'package:marinechoice/pages/mappage.dart';
import 'package:marinechoice/pages/recipespage.dart';
import 'fishpage.dart';
import 'homepage.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PostPage();
  }
}

class _PostPage extends State<PostPage> {
  int selectedBox = -1;
  String searchText = "";
  String imagePath = '';

  final TextEditingController _titleController = TextEditingController();
  String _cuisineType = '';
  final List<String> _selectedIngredients = [];
  final List<String> _selectedFishes = [];
  final List<String> _recipeSteps = [];

  final databaseReference = FirebaseDatabase.instance.ref();

  final List<String> _cuisineTypes = [
    'Italian',
    'Chinese',
    'Indian',
    'Japanese',
    'Mexican',
    'French',
    'Thai',
    'Spanish',
    'Mediterranean',
    'American',
    'Korean',
    'Brazilian',
  ];

  final List<String> _availableIngredients = [
    'Salt',
    'Pepper',
    'Olive Oil',
    'Garlic',
    'Onion',
    'Tomato',
    'Chicken',
    'Pasta',
    'Rice',
    'Beef',
    'Cheese',
    'Egg',
    'Milk',
  ];

  final List<String> _availableFishes = [
    'Salmon',
    'Tuna',
    'Cod',
    'Trout',
    'Haddock',
    'Herring',
    'Mackerel',
    'Sardines',
    'Anchovies',
    'Bass',
    'Catfish',
    'Flounder',
  ];

  void _addStep() {
    setState(() {
      _recipeSteps.add('');
    });
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
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(30),
              child: const Text("Write your recipe!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 32,
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(30),
              child: TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Recipe Title',
                ),
              ),
            ),
            const Text('Cuisine Type:', style: TextStyle(fontSize: 18)),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: _buildFilterChips(_cuisineTypes, [_cuisineType],
                  (selectedItem) {
                _cuisineType = selectedItem;
              }),
            ),
            const Text('Ingredients:', style: TextStyle(fontSize: 18)),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: _buildFilterChips(_availableIngredients,
                  _selectedIngredients, (selectedItem) {}),
            ),
            const Text('Fishes:', style: TextStyle(fontSize: 18)),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 30),
              child: _buildFilterChips(
                  _availableFishes, _selectedFishes, (selectedItem) {}),
            ),
            const Text('Recipe Steps:', style: TextStyle(fontSize: 18)),
            ..._recipeSteps.asMap().entries.map((entry) {
              int index = entry.key;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Step ${index + 1}',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _recipeSteps[index] = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }),
            ElevatedButton(
              onPressed: _addStep,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue[200]!),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                shadowColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      side: BorderSide(color: Colors.grey[600]!)),
                ),
              ),
              child: const Text('Add Another Step'),
            ),
           Container ( 
             margin: const EdgeInsets.all(30),
             
             child: ElevatedButton(
              onPressed: () async {
                ImagePicker imagePicker = ImagePicker();
                XFile? file =
                    await imagePicker.pickImage(source: ImageSource.gallery);

                if (file == null) {
                  log("Something went wrong when getting image");
                }

                Reference refRoot = FirebaseStorage.instance.ref();
                Reference referenceDirImages = refRoot.child("recipes");

                Reference referenceImgtoUpload = referenceDirImages.child('${file?.name}');

                try {
                  await referenceImgtoUpload.putFile(File(file!.path));

                  imagePath = referenceImgtoUpload.fullPath;

                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Image Uploaded Successfully!'),
                      ),);

                } catch (error) {if (kDebugMode) {
                  print("Error uploading image: $error");
                }}
              },
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                shadowColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      side:
                      const BorderSide(color: Color(0xff5B92C6), width: 3)),
                ),
              ),
              child: Container (
                padding: EdgeInsets.all(30),
                child: const Text('Pick Image', style: TextStyle(
                    color: Color(0xff5B92C6),
                    fontWeight: FontWeight.w600,
                    fontSize: 20),),),
            ),),
            ElevatedButton(
              onPressed: () {
                if (_titleController.text.isNotEmpty &&
                    _cuisineType != '' &&
                    _selectedIngredients.isNotEmpty &&
                    _selectedFishes.isNotEmpty &&
                    _recipeSteps.isNotEmpty) {
                  insertData(_titleController.text, _cuisineType,
                      _selectedIngredients, _selectedFishes, _recipeSteps, imagePath);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RecipesPage()));
                }
              },
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blue[200]!),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                shadowColor:
                MaterialStateProperty.all<Color>(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      side: BorderSide(color: Colors.grey[600]!)),
                ),
              ),
              child: const Text(
                'Post Recipe',),
            ),
          ],
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

  void insertData(String title, String cuisineType, List<String> ingredients,
      List<String> fishes, List<String> steps, String imagePath) {
    databaseReference.child("RECIPE").push().set({
      'title': title,
      'cusineType': cuisineType,
      'ingredients': ingredients,
      'preparation': steps,
      'imagePath' : imagePath,
    });
    _titleController.clear();
    _cuisineType = '';
    _selectedIngredients.clear();
    _selectedFishes.clear();
    _recipeSteps.clear();
  }
}
