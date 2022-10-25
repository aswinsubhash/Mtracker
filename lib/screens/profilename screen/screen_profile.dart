import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mtracker/main.dart';
import 'package:mtracker/screens/home%20screen/dash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenProfile extends StatelessWidget {
  ScreenProfile({super.key});
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image(
                        width: MediaQuery.of(context).size.width * 0.6,
                        image: const AssetImage(
                            'assets/images/MTRACKER LOGO CLR.png'),
                      ),
                    ),
                    Text(
                      'What should we call \n you?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(fontSize: 30),
                          color: const Color.fromARGB(255, 94, 94, 94),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 201, 245, 235),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: _textController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Name',
                          hintStyle: TextStyle(
                              color: Color.fromARGB(255, 143, 143, 143)),
                          contentPadding: EdgeInsets.all(20),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 70,
                      width: 320,
                      child: Text(
                        'By clicking the submit button below,i here by agree to accept the following terms and conditions governing my \nuse of Mtracker app.I further refirm my acceptance of the \ngeneral terms and conditions',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 143, 143, 143),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        checkLogin(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 101, 209, 190),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: const Size(150, 40),
                      ),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx,[bool mounted = true]) async {
    final profileName = _textController.text;
    final sharedPreferences = await SharedPreferences.getInstance();
    if (profileName.isNotEmpty) {
      await sharedPreferences.setString(saveKey, profileName);
      if(!mounted) return;
      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (ctx1) {
            return const DashScreen();
          },
        ),
      );
    }else {
       if(!mounted) return;
       AnimatedSnackBar.material(
        'Please enter your name', 
        duration: const Duration(seconds: 5),
        type: AnimatedSnackBarType.error,
        mobileSnackBarPosition: MobileSnackBarPosition
            .bottom, // Position of snackbar on mobile devices
      ).show(ctx);
    }
  }
}
