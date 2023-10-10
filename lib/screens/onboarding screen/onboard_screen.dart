import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../profilename%20screen/screen_profile.dart';

class ScreenOnBoard extends StatefulWidget {
  const ScreenOnBoard({super.key});

  @override
  State<ScreenOnBoard> createState() => _ScreenOnBoardState();
}

class _ScreenOnBoardState extends State<ScreenOnBoard> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.only(top: 140),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 35),
                child: Image(
                  width: MediaQuery.of(context).size.width*0.8,
                  image: const AssetImage('assets/images/onboard_logo.png'),
                ),
              ),
               Center(
                 child: Text(
                  'Save Your Money With \n Mtracker',
                  textAlign: TextAlign.center,
                  style:GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500
                    )
                  )
              ),
               ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'A money manager you can \ntrust for life',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 126, 123, 123)
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
      
              //routing to home
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ScreenProfile(),));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 101, 209, 190),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(150, 40),
                  ),
                  child: const Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
