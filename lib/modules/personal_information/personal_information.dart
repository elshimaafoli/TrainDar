import 'package:flutter/material.dart';
import 'package:traindar_app/apis/userAPI.dart';
import 'package:traindar_app/models/users/user.dart';

class PersonalInformation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _state();
  }
}

class _state extends State<PersonalInformation> {
  List<String> data = ['Name: ', 'Phone: ', 'Email address: ', 'Points: '];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(223, 209, 164, 0.85),
      appBar: AppBar(
        foregroundColor: Colors.black54,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(
                Icons.account_box_rounded,
                color: Colors.red,
                size: 30,
              ),
            ),
            Expanded(
              child: Text(
                "Personal Information",
                style: TextStyle(
                  fontSize: 26,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(223, 209, 162, 1),
      ),
      body: FutureBuilder<User>(
          future: UserAPI().getData(UserAPI.currentUserId),
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            if (snapshot.hasData) {
              List<String> values = [
                snapshot.data!.name,
                snapshot.data!.phone,
                snapshot.data!.email,
                '50'
              ];
              return Padding(
                padding: const EdgeInsets.only(top:20,left: 10,right: 10),
                child: Container(
                  height:  MediaQuery.of(context).size.height*0.5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color.fromRGBO(239, 231, 206, 0.6),
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Edit",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Railway',
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListView.separated(
                        itemBuilder: (context, index) =>
                            buildItem(data[index], values[index]),
                        physics: const ScrollPhysics(),
                          shrinkWrap: true,
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                        separatorBuilder: (context, index) => Container(
                              margin: const EdgeInsets.all(7),
                              height: 5,
                              color: Colors.brown,
                            ),
                        itemCount: values.length),
                      Container(
                        alignment: Alignment.center,
                        margin:EdgeInsets.all(22),
                        height: 5,
                        color: Colors.brown,

                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.brown,
                ),
              );
            }
          }),
    );
  }
}

Widget buildItem(
  String firstLabel,
  String secondLabel,
) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            firstLabel,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              secondLabel,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
