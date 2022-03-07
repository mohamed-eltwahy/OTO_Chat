import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tel_chat/data/auth.dart';
import 'package:tel_chat/data/database.dart';
import 'package:tel_chat/helper/const.dart';
import 'package:tel_chat/layout/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
  Stream? usersStream;
  TextEditingController searchTextEditingController = TextEditingController();
  onsearchedBtnClicked() async {
    setState(() {
      isSearching = true;
    });
    usersStream = await DataBaseMethods()
        .getuserbyUserName(searchTextEditingController.text);
  }

  Widget searchUserList() {
    return StreamBuilder(
      stream: usersStream,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return searchedUserTile(
                      ds['imgUrl'], ds['name'], ds['email'], ds['username']);
                })
            : const CircularProgressIndicator();
      },
    );
  }

  Widget searchedUserTile(String imgUrl, name, username, email) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ChatScreen(
                  chatWithUsername: username,
                  username: name,
                )),
          ),
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              imgUrl,
              height: 50,
              width: 50,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(email),
            ],
          )
        ],
      ),
    );
  }

  Widget chatRoomsList() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          InkWell(
            onTap: () {
              AuthMethods().signout().then((f) {
                Navigator.pushReplacementNamed(context, signin);
              });
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            Row(
              children: [
                isSearching
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isSearching = false;
                            searchTextEditingController.text = '';
                          });
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.arrow_back),
                        ),
                      )
                    : Container(),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black87,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          controller: searchTextEditingController,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'username '),
                        )),
                        GestureDetector(
                            onTap: () {
                              if (searchTextEditingController.text != "") {
                                onsearchedBtnClicked();
                              }
                            },
                            child: const Icon(Icons.search))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            isSearching ? searchUserList() : chatRoomsList()
          ])),
    );
  }
}
