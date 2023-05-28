import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../view model/live_view_model.dart';

class LiveLocationScreen extends StatefulWidget {
  const LiveLocationScreen({super.key});

  @override
  State<LiveLocationScreen> createState() => _LiveLocationScreenState();
}

class _LiveLocationScreenState extends State<LiveLocationScreen> {
  final liveController = Get.put(LiveLocationViewModel());
  final searchController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer();
  List<dynamic> placesList = [];
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.3753, 69.3451),
    zoom: 14.4746,
  );

  final List<Marker> _marker = [];
  final List<Marker> _list = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(31.5204, 74.3587),
      infoWindow: InfoWindow(title: 'Lahore'),
      onTap: () {},
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(24.8607, 67.0011),
      infoWindow: InfoWindow(title: 'Karachi'),
      onTap: () {},
    ),
    Marker(
      markerId: MarkerId('3'),
      position: LatLng(34.0151, 71.5249),
      infoWindow: InfoWindow(title: 'Peshawar'),
      onTap: () {},
    ),
    Marker(
      markerId: MarkerId('4'),
      position: LatLng(30.1798, 66.9750),
      infoWindow: InfoWindow(title: 'Quetta'),
      onTap: () {},
    ),
    Marker(
      markerId: MarkerId('5'),
      position: LatLng(33.6844, 73.0479),
      infoWindow: InfoWindow(title: 'Islamabad'),
      onTap: () {},
    ),
    Marker(
      markerId: MarkerId('6'),
      position: LatLng(33.6844, 73.0479),
      infoWindow: InfoWindow(title: 'Rahim Yar Khan'),
      onTap: () {},
    ),
    Marker(
      markerId: MarkerId('6'),
      position: LatLng(28.4212, 70.2989),
      infoWindow: InfoWindow(title: 'Rahim Yar Khan'),
      onTap: () {},
    ),
    Marker(
      markerId: MarkerId('11'),
      position: LatLng(28.4129, 70.3001),
      infoWindow: InfoWindow(title: ' Tariq Pharmacy , RYK'),
      onTap: () {},
    ),
    Marker(
      markerId: MarkerId('12'),
      position: LatLng(28.422617039, 70.3061404),
      infoWindow: InfoWindow(title: 'Mian Surgical , RYK'),
      onTap: () {},
    ),
    Marker(
      markerId: MarkerId('7'),
      position: LatLng(30.1575, 71.5249),
      infoWindow: InfoWindow(title: 'Multan'),
      onTap: () {},
    ),
    Marker(
      markerId: MarkerId('8'),
      position: LatLng(27.7244, 68.8228),
      infoWindow: InfoWindow(title: 'Sukkur'),
      onTap: () {},
    ),
    Marker(
      markerId: MarkerId('9'),
      position: LatLng(17.3850, 78.4867),
      infoWindow: InfoWindow(title: 'Hyderabad'),
      onTap: () {},
    ),
    Marker(
      markerId: MarkerId('10'),
      position: LatLng(35.9202, 74.3080),
      infoWindow: InfoWindow(title: 'Gilgit'),
      onTap: () {},
    ),
    Marker(
      markerId: MarkerId('13'),
      position: LatLng(32.1877, 74.1945),
      infoWindow: InfoWindow(title: 'Gujranwala'),
      onTap: () {},
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              'Delivery Street Location',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: 'Inter Regular'),
            ),
            SizedBox(
              height: 5,
            ),
            const Text(
              'Search and select your delivery location',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff8A8A8A),
                  fontFamily: 'Inter thin'),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  controller: searchController,
                  onTap: () {},
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.normal),
                  decoration: InputDecoration(
                    fillColor: Color(0xffFFFFFF),
                    filled: true,
                    prefixIcon: Image.asset('images/loacation_maker.png'),
                    suffixIcon: Icon(
                      Icons.search,
                      size: 15,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(0, 0, 0, 0.08))),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.08),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 0, 0, 0.08)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: SizedBox(
                height: 500,
                width: MediaQuery.of(context).size.width * 1,
                child: GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                  mapType: MapType.hybrid,
                  indoorViewEnabled: true,
                  trafficEnabled: true,
                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  mapToolbarEnabled: true,
                  zoomControlsEnabled: false,
                  zoomGesturesEnabled: true,
                  markers: Set<Marker>.of(_marker),
                  compassEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 53,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: const Color(
                        0xff00AC5D,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 19,
                        width: 19,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white)),
                        child: Center(
                            child: Icon(
                          Icons.check,
                          size: 10,
                          color: Colors.white,
                        )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Confirm Location',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Inter Regular',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          liveController.getUserCurrentLocation().then((value) async {
            _marker.add(Marker(
                markerId: MarkerId('14'),
                position: LatLng(value.latitude, value.longitude),
                infoWindow: InfoWindow(title: 'My Current Location')));

            CameraPosition cameraPosition = CameraPosition(
                zoom: 14, target: LatLng(value.latitude, value.longitude));

            final GoogleMapController controller = await _controller.future;
            controller
                .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
            setState(() {});
          });
        },
        backgroundColor: Color(0xff00AC5D),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 4,
              child: VerticalDivider(
                thickness: 2,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 4,
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                    )),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(
                    width: 4,
                    child: Divider(
                      color: Colors.white,
                      thickness: 2,
                    )),
              ],
            ),
            SizedBox(
              height: 4,
              child: VerticalDivider(
                thickness: 2,
                color: Colors.white,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
