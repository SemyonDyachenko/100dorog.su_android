import 'package:flutter/material.dart';

class ProfileSettings extends StatefulWidget {
  _ProfileSettings createState() => _ProfileSettings();
}

class _ProfileSettings extends State<ProfileSettings> {
  createDeleteDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Вы действительно хотите удалить аккаунт? После этой операции восстановление аккаунта будет невзомжным. ",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color.fromARGB(500, 59, 204, 122),
                child: Text("Отмена",
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              FlatButton(
                onPressed: () {},
                color: Color.fromARGB(200, 247, 72, 72),
                child: Text("Да"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 22,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        title: Text("Настройки",
            style: TextStyle(color: Colors.black, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * .8),
              child: Center(
                child: FlatButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: Colors.transparent)),
                  minWidth: MediaQuery.of(context).size.width * .95,
                  height: 60,
                  onPressed: () => createDeleteDialog(context),
                  child: Text(
                    "Удалить аккаунт",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
