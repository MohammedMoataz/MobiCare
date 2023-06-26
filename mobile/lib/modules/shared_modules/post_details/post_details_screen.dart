import 'package:flutter/material.dart';
import 'package:mobi_care/shared/components/components.dart';
import 'package:mobi_care/shared/styles/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PostDetailsScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String caption;
  final YoutubePlayerController controller;
  final bool gender;
  final String creationalDate;

  const PostDetailsScreen({
    required this.firstName,
    required this.lastName,
    required this.caption,
    required this.controller,
    required this.gender,
    required this.creationalDate
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MobiCare',
        ),
        centerTitle: true,
        backgroundColor: primaryColor1BA,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: DefaultPostView(
              publisherName: 'Dr. ${firstName} ${lastName}',
              publisherImage: 'https://img.freepik.com/premium-vector/graphic-element-printing-poster-banner-website-cartoon-flat-vector-illustration_755718-18.jpg?w=740',
              postText: '${caption}',
              videoUrl: '',
              isMale: gender,
              controller: controller,
              dateOfPublish: creationalDate,
            ),
          ),
        ],
      ),
    );
  }
}
