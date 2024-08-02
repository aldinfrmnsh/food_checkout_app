import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Colors.green[800],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[800]!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                        AssetImage('assets/images/user_profile1.jpg'),
                  ),
                  SizedBox(width: 16.0),
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                        AssetImage('assets/images/user_profile2.jpg'),
                  ),
                  SizedBox(width: 16.0),
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage:
                        AssetImage('assets/images/user_profile3.jpg'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'MOBILE PROGRAMMING',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 8.0),
              Text(
                'Nanda Maulana 20221020080',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              SizedBox(height: 8.0),
              Text(
                'Dwiki Rizaldi 20221020068',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
              SizedBox(height: 8.0),
              Text(
                'Aldin Firmansyah 20221020050',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
