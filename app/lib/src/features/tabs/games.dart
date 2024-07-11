import 'package:app/src/features/widgets/custom_card.dart';
import 'package:app/src/features/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class MyGames extends StatefulWidget {
  const MyGames({super.key});

  @override
  State<MyGames> createState() => _MyGamesState();
}

class _MyGamesState extends State<MyGames> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CustomCard(),
      // child: Padding(
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 10,
      //   ),
      //   child: Column(
      //     children: [
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       // CustomInput(
      //       //   labeltext: "Competição",
      //       //   controller: _searchController,
      //       //   icon: Icons.search,
      //       //   obscureText: false,
      //       // ),
      //       Container(
      //         width: MediaQuery.of(context).size.width,
      //         height: 180,
      //         decoration: BoxDecoration(
      //           color: const Color(0xFF3DB62A),
      //           borderRadius: BorderRadius.circular(10),
      //           boxShadow: const [
      //             BoxShadow(
      //               color: Colors.grey,
      //               blurRadius: 6,
      //               spreadRadius: 0.6,
      //             ),
      //           ],
      //         ),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             
      //             Padding(
      //               padding: const EdgeInsets.all(10.0),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
                        
      //                   Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                     children: [
      //                       const 
      //                       ),
      //                       const SizedBox(width: 80,),
      //                       
      //                     ],
      //                   ),
      //                   const Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Text(
      //                         "Data",
      //                         style: TextStyle(
      //                           fontFamily: "IrishGrover",
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.w500,
      //                           fontSize: 18,
      //                         ),
      //                       ),
      //                       const SizedBox(width: 100,),
      //                       Text(
      //                         "17 jun 2024",
      //                         style: TextStyle(
      //                           fontFamily: "IrishGrover",
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.w500,
      //                           fontSize: 18,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   const Text(
      //                     "Horário",
      //                     style: TextStyle(
      //                       fontFamily: "IrishGrover",
      //                       color: Colors.white,
      //                       fontWeight: FontWeight.w500,
      //                       fontSize: 18,
      //                     ),
      //                   ),
      //                   // const Wrap(
      //                   //   spacing: 8,
      //                   //   children: [
      //                   //     Text(
      //                   //       "1° Jogo: 16/08/2024 16:30h",
      //                   //       style: TextStyle(
      //                   //         fontFamily: "IrishGrover",
      //                   //         color: Colors.white,
      //                   //         fontWeight: FontWeight.w600,
      //                   //         fontSize: 18,
      //                   //       ),
      //                   //     ),
      //                   //     Text(
      //                   //       "2° Jogo: 16/08/2024 15:45h",
      //                   //       style: TextStyle(
      //                   //         fontFamily: "IrishGrover",
      //                   //         color: Colors.white,
      //                   //         fontWeight: FontWeight.w600,
      //                   //         fontSize: 18,
      //                   //       ),
      //                   //     ),
      //                   //     // Text(
      //                   //     //   "3° Jogo: 16/08/2024",
      //                   //     //   style: TextStyle(
      //                   //     //     fontFamily: "IrishGrover",
      //                   //     //     color: Colors.white,
      //                   //     //     fontWeight: FontWeight.w600,
      //                   //     //     fontSize: 16,
      //                   //     //   ),
      //                   //     // ),
      //                   //   ],
      //                   // )
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
