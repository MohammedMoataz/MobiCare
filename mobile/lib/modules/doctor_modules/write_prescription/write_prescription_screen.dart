import 'package:flutter/material.dart';

class WritePrescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xFF1BAEA6),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          'MobiCare',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 33,
                        backgroundColor: Color(0xFF5299DA),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://www.freepik.com/free-photo/female-doctor-lab-coat-white-isolated-confident-smile_14806208.htm#query=woman%20doctor&position=13&from_view=search&track=ais'),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Dr.Hala Ahmed',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Container(
                      width: 300,
                      child: Text(
                        'Diploma of egyption cognitive-behavioral society',
                      )),
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: 200,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xFF60D2CE)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Age',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: 150,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xFF60D2CE)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Medicines',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xFF60D2CE)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Test',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xFF60D2CE)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Radiologies',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 4),
              SizedBox(
                width: 250,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Color(0xFF60D2CE)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Notes',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Text(
                  '''----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
----- -----  ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
----- -----  ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----'''),
            ],
          ),
        ),
      ),
    );
  }
}
