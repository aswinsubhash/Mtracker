
import 'package:url_launcher/url_launcher.dart';

Future<void>sendMail()async{
  final Uri url = Uri.parse('mailto:aswinsubhash3@gmail.com?subject=Feedback About Mtracker App&body=');
  if(!await launchUrl(url)){
    throw 'Could not launch';
  } 
}