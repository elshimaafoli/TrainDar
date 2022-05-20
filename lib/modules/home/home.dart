import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:traindar_app/modules/search_by_station/select_stations.dart';
import 'package:traindar_app/modules/search_by_trainid/messagesearch.dart';
import 'package:traindar_app/modules/share_location/select_train_id.dart';
import 'package:traindar_app/shared/network/local/local_storage.dart';
import '../../swap.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String shareText = "Share Location";
  @override
  initState() {
    super.initState();
    if (shareText != "Stop Sharing") {
      LocalStorage().setShareData(false);
    }
    LocalStorage().getShareData();
    if (LocalStorage.check  == true) {
      shareText = "Stop Sharing";
   }
  }
  @override
  Widget build(BuildContext context) {
    List<DataButton> fetchButton = [
      DataButton(
          text: shareText,
          icon: Icons.location_on,
          colorIcon: Colors.red,
          function: () async {
            if(shareText=="Stop Sharing"){
              setState(() {
                LocalStorage().setShareData(false);
                shareText="Share Location";
                //ShareAPI().deleteShare(trainId:  );
              });
            }
            Location location = Location();
            PermissionStatus _permissionGranted =
                await location.hasPermission();
            if (_permissionGranted == PermissionStatus.granted) {
              Navigator.push(context, Config.route(SelectTrainID()));
            } else {
              _permissionGranted = await location.requestPermission();
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
            Navigator.push(context, Config.route(MessageSearch()));
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
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.push(context, Config.route(SelectStations()));
            },
            child: Text("test"),
          )
        ],
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
