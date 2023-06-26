import 'package:flutter/material.dart';
import 'package:mobi_care/shared/components/components.dart';

class HomeVisitRequestsScreen extends StatelessWidget {
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
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(
              itemCount: 1,
              separatorBuilder: (context, index) => SizedBox(height: 10,),
              itemBuilder: (context, index) =>  Row(
                children: [
                  DefaultImageShape(
                      isMale: true,
                      height: 40,
                      image: 'https://cdn-icons-png.flaticon.com/512/727/727393.png?w=740&t=st=1682584890~exp=1682585490~hmac=68efe00a2db500f0b011f8f06602ec77b5750ba3f1900745c1c4ec4485614b43',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Mohammed Ali'),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('View request'),
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Color(0xFF1BAEA6)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
