import 'package:flutter/material.dart';
import 'package:update_api/controllers/update_controller.dart';
import 'package:update_api/controllers/view_controller.dart';

class Update_View extends StatefulWidget {
  const Update_View(
      {super.key, required this.name, required this.email, required this.id});
  final id;
  final name;
  final email;

  @override
  State<Update_View> createState() => _Update_ViewState();
}

class _Update_ViewState extends State<Update_View> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController datacontroller = TextEditingController();

  @override
  void initState() {
    namecontroller.text = "${widget.name}";
    emailcontroller.text = "${widget.email}";
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: namecontroller,
            ),
            TextField(
              controller: emailcontroller,
            ),
            ElevatedButton(
                onPressed: () async {
                  var myresponseapi = await updateUser(
                      widget.id, namecontroller.text, emailcontroller.text);
                  print(myresponseapi.statusCode);
                  if (myresponseapi.statusCode == 200) {
                    namecontroller.clear();

                    emailcontroller.clear();
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      var error = "Something went wrong";
                    });
                  }
                },
                child: Text("Update")),
          ],
        ),
      ),
    );
  }
}
