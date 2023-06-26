import 'package:flutter/material.dart';
import 'package:mobi_care/shared/styles/colors.dart';
import '../../../../models/Constants.dart';
import '../view/view.dart' as view;

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MobiCare',),
        centerTitle: true,
        backgroundColor: primaryColor1BA,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: Constants.stories.map((e) {
                String? url = Constants.getYoutubeThumbnail(e.url);
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => view.View(
                            model: e,
                        )
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          e.title,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading:
                            url == null ? const SizedBox() : Image.network(url),
                      ),
                    ),
                  ),
                );
              }).toList(),
            )),
          ],
        ),
      ),
    );
  }
}
