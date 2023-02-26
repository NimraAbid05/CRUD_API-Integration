import 'package:flutter/material.dart';

import 'package:update_api/controllers/view_controller.dart';
import 'package:update_api/views/update.dart';

class Home_View extends StatefulWidget {
  const Home_View({super.key});

  @override
  State<Home_View> createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getUsers(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Update_View(
                                      name: "${snapshot.data.data[index].name}",
                                      id: "${snapshot.data.data[index].id}",
                                      email:
                                          "${snapshot.data.data[index].email}",
                                    )));
                      },
                      child: ListTile(
                        title: Text("${snapshot.data.data[index].name}"),
                        subtitle: Text("${snapshot.data.data[index].email}"),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
