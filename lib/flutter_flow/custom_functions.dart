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
import '/auth/firebase_auth/auth_util.dart';

DateTime? futureDate(
  DateTime? startDate,
  int? minutes,
  int? seconds,
  int? hours,
  int? days,
) {
  // create a new variable for the result
  DateTime result;

  // set initial value from startDate input parameter.
  //If startDate is null then use current Timestamp as StartDate
  result = startDate ?? (DateTime.now());

  // null saftey checks for all input parameters
  int addMinutes = 0 + (minutes ?? 0);
  int addSeconds = 0 + (seconds ?? 0);
  int addHours = 0 + (hours ?? 0);
  int addDays = 0 + (days ?? 0);

//calculate future date by adding all input durations to the StartDate stored in result variable

  result = result.add(Duration(
      seconds: addSeconds,
      minutes: addMinutes,
      hours: addHours,
      days: addDays));

//return final result with the future date

  return result;
}
