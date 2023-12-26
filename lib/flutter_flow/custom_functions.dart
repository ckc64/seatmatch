import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? convertDate(String? date) {
  DateTime originalDate = DateTime.parse(date!);
  final formatter = DateFormat('MMMM d, y');
  return formatter.format(originalDate);
}

String? trimString(String? name) {
  return name!.trim();
}

String? getMonth(String? date) {
  // get month of a string date 2023-12-22

  List<String> splittedDate = date!.split('-');

  switch (splittedDate[1]) {
    case '01':
      return 'Jan';
    case '02':
      return 'Feb';
    case '03':
      return 'Mar';
    case '04':
      return 'Apr';
    case '05':
      return 'May';
    case '06':
      return 'Jun';
    case '07':
      return 'Jul';
    case '08':
      return 'Aug';
    case '09':
      return 'Sep';
    case '10':
      return 'Oct';
    case '11':
      return 'Nov';
    case '12':
      return 'Dec';
    default:
      return '';
  }
}

String? getDate(String? date) {
  List<String> splittedDate = date!.split('-');

  return splittedDate[2];
}

String? toISO(DateTime? date) {
  // Format DateTime object as a string in the desired format
  String formattedDatetime =
      DateFormat("yyyy-MM-ddTHH:mm:ssZ").format(date!.toUtc());
  return '${formattedDatetime}Z';
}

String? extractCoordinates(String? input) {
// Find the substring between "lat: " and ", lng:"
  int latStart = input!.indexOf("lat: ") + 5;
  int latEnd = input.indexOf(", lng:");
  String latSubstring = input.substring(latStart, latEnd);

  // Find the substring between "lng: " and ")"
  int lngStart = input.indexOf("lng: ") + 5;
  int lngEnd = input.indexOf(")");
  String lngSubstring = input.substring(lngStart, lngEnd);

  // Concatenate the latitude and longitude substrings
  String coordinates = "$latSubstring, $lngSubstring";

  return coordinates;
}
