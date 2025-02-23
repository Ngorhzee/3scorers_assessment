import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Uint8List? convertToBlobImage(String base64Image) {
  try {
    return base64Decode(base64Image);
  } catch (e) {
    // Log or handle the error
    print("Error decoding Base64 string: $e");
    return null;
  }
}

Color hexToColor(String hex) {
  hex = hex.replaceAll('#', ''); // Remove the # if present
  return Color(int.parse('0xff$hex')); // Add 0xff to specify opacity
}

Future<void> launchUrl(String url) async {
  try{
    await canLaunchUrl(Uri.parse(url));
    launchUrlString(url);
  }catch(e){
     print("Couldn't launch url");
  }

}
