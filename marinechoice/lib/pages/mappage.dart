import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'homepage.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Location _locationController = new Location();
  LatLng? _currentP = null;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: _currentP == null
          ? const Center(
        child: Text("Loading...", style: TextStyle(fontSize: 40),),
      )
          : GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentP!,
          zoom: 3,
        ),
        markers: {
          Marker(
              markerId: MarkerId("_currentLocation"),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              position: _currentP!),
        },
      ),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
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
          print(_currentP);
        });
      }
    });
  }

  _navigate(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomePage()));
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
      currentIndex: 3,
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
