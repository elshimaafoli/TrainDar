import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traindar_app/apis/share_location_api.dart';
import 'package:traindar_app/layout/home_layout.dart';
import 'package:traindar_app/modules/nearest_stations/nearest_stations.dart';
import 'package:traindar_app/modules/search_by_station/select_stations.dart';
import 'package:traindar_app/modules/search_by_trainid/messagesearch.dart';
import 'package:traindar_app/modules/share_location/select_train_id.dart';
import '../../swap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _shareText = "Share Location";
  bool _isValidShare = false;
  late StreamSubscription<LocationData> locationSubscription;
  Future<bool> getValidShare() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isValidShare = prefs.getBool("isShare")!;
      print('$_isValidShare+get');
      print('${prefs.getBool("isShare")}   msh');
    });
    return Future(() => _isValidShare);
  }

  void setValidShare() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool("isShare", _isValidShare);
      print('$_isValidShare+set');
    });
  }

  void _operationsOfLocation() {
    Location location = Location();
    locationSubscription =
        location.onLocationChanged.listen((LocationData currentLocation) async {
    bool res= await ShareAPI().sharedLocation(
               locationLat:
           currentLocation.latitude as double,
              locationLng:
               currentLocation.latitude as double);
    print('$res  sls');
          print(currentLocation.longitude);
          print(currentLocation.latitude);
        });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      bool var1 = await getValidShare();
      if (var1) {
        _shareText = "Stop Sharing";
        _operationsOfLocation();
      } else {
        _shareText = "Share Location";
      }
      print('$var1+init');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<DataButton> fetchButton = [
      DataButton(
          text: _shareText,
          icon: Icons.location_on,
          colorIcon: Colors.red,
          function: () async {
            if (_isValidShare) {
              setState(() {
                locationSubscription.cancel();
                _isValidShare = false;
                setValidShare();
                _shareText = "Share Location";
                ShareAPI().deleteShare(trainId: 2015);
                Navigator.push(context, Config.route(HomeLayout()));
              });
            } else {
              //operation of share location
              Location location = Location();
              PermissionStatus _permissionGranted =
                  await location.hasPermission();
              if (_permissionGranted == PermissionStatus.granted) {
                Navigator.push(context, Config.route(SelectTrainID()));
              } else {
                _permissionGranted = await location.requestPermission();
                Navigator.push(context, Config.route(SelectTrainID()));
              }
            }
          }),
      DataButton(
          text: "Search By TrainID",
          icon: Icons.train,
          function: () {
            Navigator.push(context, Config.route(MessageSearch()));
          }),
      DataButton(
          text: "Search By Station",
          icon: Icons.search_rounded,
          function: () {
            Navigator.push(context, Config.route(SelectStations()));
          }),
      DataButton(
          text: "Nearest Station",
          icon: Icons.location_city,
          function: () {
            Navigator.push(context, Config.route(NearestStations()));
          }),
      DataButton(
          text: "Manage Points",
          icon: Icons.monetization_on_rounded,
          colorIcon: Colors.amber,
          function: () {
            Navigator.push(context, Config.route(HomeScreen()));
          }),
    ];
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
        foregroundColor: Colors.black,
        leading: IconButton(
          alignment: Alignment.topLeft,
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.house,
              size: 30,
            ),
            Text(
              'Home',
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/backgroundHome.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
            child: Center(
                child: ListView.separated(
                    itemBuilder: (context, index) =>
                        buildItem(context, fetchButton[index]),
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemCount: fetchButton.length)),
          ),
        ),
      ),
    );
  }

  Widget buildItem(BuildContext context, DataButton dataButton) => Stack(
        // alignment: Alignment.topLeft,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .2,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * .15,
            right: MediaQuery.of(context).size.width * .15,
            top: MediaQuery.of(context).size.height * .02,
            bottom: MediaQuery.of(context).size.height * .02,
            child: MaterialButton(
              onPressed: () => dataButton.function(),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Color.fromRGBO(239, 231, 206, 0.6),
                ),
                child: Center(
                  child: Text(
                    dataButton.text,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width * .15,
              right: MediaQuery.of(context).size.width * .72,
              top: MediaQuery.of(context).size.height * .001,
              bottom: MediaQuery.of(context).size.height * .12,
              child: CircleAvatar(
                // decoration: const BoxDecoration(
                //   borderRadius: BorderRadius.all(Radius.circular(1000)),
                //color:  Color.fromRGBO(75, 58, 40, 1),
                child: Icon(
                  dataButton.icon,
                  size: 33,
                  color: dataButton.colorIcon,
                ),
                backgroundColor: const Color.fromRGBO(75, 58, 40, 1),
              )),
        ],
      );
}

class DataButton {
  String text;
  IconData icon;
  Color colorIcon;
  Function function;
  DataButton({
    required this.text,
    required this.icon,
    required this.function,
    this.colorIcon = Colors.black,
  });
}
