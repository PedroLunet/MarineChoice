import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:marinechoice/pages/postpage.dart';
import 'package:marinechoice/pages/recipespage.dart';
import 'package:marinechoice/pages/userprofile.dart';
import '../models/fisharea_model.dart';
import '../models/protarea_model.dart';
import 'settingspage.dart';
import 'fishpage.dart';
import 'homepage.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Location _locationController = Location();
  LatLng? _currentP;
  final _database = FirebaseDatabase.instance.ref();
  Future<Set<Marker>?>? _pointsFuture;

  List<ProtArea> protAreaList = [];
  List<FishArea> fisAreaList = [];

  @override
  void initState() {
    super.initState();
    _pointsFuture = getPoints();
    getLocationUpdates();
  }

  Future<Set<Marker>?> getPoints() async {
    try {
      Set<Marker> set = {};
      await retrieveMapData();

      for (var element in protAreaList) {
        set.add(Marker(
            infoWindow: InfoWindow(
                title: "Area Protegida",
                snippet: element.protAreaData!.description!),
            markerId: MarkerId("p_area_${element.protAreaData!.description!}"),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            position: LatLng(double.parse(element.protAreaData!.latitude!),
                double.parse(element.protAreaData!.longitude!))));
      }

      for (var element in fisAreaList) {
        set.add(Marker(
            infoWindow: InfoWindow(
                title: "Area de Pesca",
                snippet: "Pesca de ${element.fishAreaData!.fish!}"),
            markerId: MarkerId("f_area_${element.fishAreaData!.fish!}"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            position: LatLng(double.parse(element.fishAreaData!.latitude!),
                double.parse(element.fishAreaData!.longitude!))));
      }

      return set;
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching points: $e");
      }
      return null; // Return null to indicate error
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Set<Marker>?>(
      future: _pointsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            var set = snapshot.data!;
            if (_currentP != null) {
              set.add(Marker(
                infoWindow: const InfoWindow(title: "Localização Atual"),
                markerId: const MarkerId("_currentLocation"),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue),
                position: _currentP!,
              ));
            }

            return Scaffold(
              bottomNavigationBar: buildBottomNavigationBar(),
              appBar: buildAppBar(),
              body: Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: _currentP ?? const LatLng(0, 0),
                      zoom: 3,
                    ),
                    markers: set,
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.circle, color: Colors.red),
                              SizedBox(width: 5),
                              Text("Área Protegida"),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.circle, color: Colors.green),
                              SizedBox(width: 5),
                              Text("Área de Pesca"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<void> getLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await _locationController.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          if (kDebugMode) {
            print(_currentP);
          }
        });
      }
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
      currentIndex: 3,
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

  Future<void> retrieveMapData() async {
    var fishAreas = await _database.child("FISHAREA").get();

    for (var fishArea in fishAreas.children) {
      FishAreaData fishAreaData = FishAreaData.fromJson(fishArea.value as Map);
      FishArea fishAreaF =
          FishArea(key: fishArea.key, fishAreaData: fishAreaData);
      fisAreaList.add(fishAreaF);
    }

    if (kDebugMode) {
      print("List $fisAreaList");
    }

    var protAreas = await _database.child("PROTAREA").get();

    for (var protArea in protAreas.children) {
      ProtAreaData protAreaData = ProtAreaData.fromJson(protArea.value as Map);
      ProtArea protAreaf =
          ProtArea(key: protArea.key, protAreaData: protAreaData);
      protAreaList.add(protAreaf);
    }

    if (kDebugMode) {
      print("List $protAreaList");
    }
  }
}
