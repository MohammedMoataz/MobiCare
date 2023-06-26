// import 'package:flutter/material.dart';
// import '../add_lists/add_lists_screen.dart';
// import '../edit_doctor_profile/edit_doctor_profile_screen.dart';
// import '../login/login_screen.dart';
//
// class AddNotesScreen extends StatelessWidget {
//   const AddNotesScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title:  const Text(
//           'My Profile',
//           style: TextStyle(
//             fontWeight: FontWeight.w400,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 16),
//         child: Column(
//           children: [
//             Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children:  <Widget>[
//                   Stack(
//                     alignment: AlignmentDirectional.bottomEnd,
//                     children: const [
//                       CircleAvatar(
//                         radius: 43.0,
//                         backgroundColor: Color.fromRGBO(77, 198, 225, 1),
//                         child: CircleAvatar(
//                           radius: 40.0,
//                           backgroundImage: NetworkImage(
//                             'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=1060&t=st=1680986239~exp=1680986839~hmac=347c4a3241d1741a6b0c5f19e693282afa09b3a37fb08d3cbca683d11e4ba3fb'
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding:  EdgeInsetsDirectional.only (
//                           bottom: 2.0,
//                           end: 2.0,
//                         ),
//                         child: CircleAvatar(
//                           radius: 12.0,
//                           backgroundColor: Color.fromRGBO(77, 198, 225, 1),
//                           child:
//
//                           Icon(Icons.camera_alt,
//                             color: Colors.white,
//                             size: 15.0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10.0,
//                   ),
//                   Text(
//                     "Ali Mohammed",
//                     style: TextStyle(
//                       fontSize: 22.0,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.0,
//                   ),
//                   Text(
//                     "AliMohammed@gmail.com",
//                     style: TextStyle(
//                       fontSize: 15.0,
//                       color: Colors.grey,
//
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5.0,
//                   ),
//                   Row(
//                     // crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children:  [
//                       Text(
//                           'Edit Profile'
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Icon(
//                         Icons.settings,
//                         size: 20,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 15.0,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Container(
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: Color.fromRGBO(27, 174, 166, 1),
//                     ),
//                     child: MaterialButton(
//                       onPressed: ()
//                       {
//                       print('Patients clicked');
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => EditDoctorProfile(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         'Patients',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: Color.fromRGBO(27, 174, 166, 1),
//                     ),
//                     child: MaterialButton(onPressed: ()
//                       {
//                       print('Lists clicked');
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddListsScreen(),
//                           ),
//                         );
//                       },
//                       child: const Text(
//                         'Lists',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Container(
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: Color.fromRGBO(27, 174, 166, 1),
//                     ),
//                     child: MaterialButton(onPressed: ()
//                       {
//                       print('Notes clicked');
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => AddNotesScreen(),
//                         ),
//                       );
//                       },
//                       child: const Text(
//                         'Notes',
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               child: Container(
//                 width: 375.0,
//                 height: 315.0,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[100],
//                 ),
//                 padding: const EdgeInsets.all(15.0,),
//                 // margin: const EdgeInsets.all(15.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   // mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: SingleChildScrollView(
//                         child : Column(
//                           children: [
//                             Row(
//                               // alignment: AlignmentDirectional.bottomEnd,
//                               children: [
//                                 Stack(
//                                   children: [
//                                     CircleAvatar(
//                                       radius: 30.0,
//                                       backgroundColor: Color.fromRGBO(77, 198, 225, 1),
//                                       child: CircleAvatar(
//                                         radius: 27.0,
//                                         backgroundImage: NetworkImage(
//                                           'https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?w=1060&t=st=1680986239~exp=1680986839~hmac=347c4a3241d1741a6b0c5f19e693282afa09b3a37fb08d3cbca683d11e4ba3fb',
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   width: 20.0,
//                                 ),
//                                 Column(
//                                   children: [
//                                     Text('Ali Mohamed',
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16.0,
//
//                                       ),
//                                     ),
//
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   width: 50.0,
//                                 ),
//                                 Container(
//                                   width: 110,
//                                   height: 40,
//                                   decoration: BoxDecoration(
//
//                                     borderRadius: BorderRadius.circular(20),
//                                     color: Color.fromRGBO(27, 174, 166, 1),
//                                   ),
//
//                                   child: MaterialButton(onPressed: ()
//                                   {
//
//                                   },
//                                     child: const Text(
//                                       'Add note',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                             SizedBox(
//                               height: 15.0,
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               width: 210,
//               height: 40,
//               decoration: BoxDecoration(
//
//                 borderRadius: BorderRadius.circular(20),
//                 color: Color.fromRGBO(27, 174, 166, 1),
//               ),
//
//               child: MaterialButton(onPressed: ()
//               {
//
//               },
//                 child: const Text(
//                   'Add Patient',
//                   style: TextStyle(
//                     color: Colors.white,
//                   ),
//
//                 ),
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
//
// }
//
//


