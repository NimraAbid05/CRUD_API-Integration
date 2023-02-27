import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
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
  //    void showalert() {
  //   QuickAlert.show(
  //       context: context,
  //       type: QuickAlertType.success,
  //       text: "User updated successfully!");
  // }

  @override
  void initState() {
    namecontroller.text = "${widget.name}";
    emailcontroller.text = "${widget.email}";
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: namecontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var myresponseapi = await updateUser(
                    widget.id, namecontroller.text, emailcontroller.text);
                print(myresponseapi.statusCode);
                showDialog(
                    context: context,
                    builder: (context) {
                      return Container(
                        child: AlertDialog(
                          title: Text("User updated successfully!"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Ok"))
                          ],
                        ),
                      );
                    });

                if (myresponseapi.statusCode == 200) {
                  namecontroller.clear();
                  emailcontroller.clear();
                  // showalert();

                } else {
                  setState(() {
                    var error = "Something went wrong";
                  });
                }
              },
              child: Text("Update"),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                textStyle: TextStyle(
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
