import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

const entryScreenItems =
    '[{"path":"assets/images/slide1.png","text":"Make a better budget"},{"path":"assets/images/slide2.png","text":"You will spend mindfully"},{"path":"assets/images/slide3.png","text":"Tracking your financial progress"}]';
const months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "September",
  "October",
  "November",
  "December"
];
const weekday = [
  "",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];
const entryRoute = '/';
const loginRoute = '/login';
const registerRoute = '/register';
const startRoute = '/start';
const crtAccountRoute = '/createAcc';
const successRoute = '/success';
const homeRoute = '/home';
const forgotPasswordRoute = '/forgotpassword';
const transactionRoute = '/transaction';
const notificationRoute = '/notification';
const expenseRoute = '/expense';
const incomeRoute = '/income';
const transferRoute = '/transfer';
const accountRoute = '/account';
const accountDetailsRoute = '/accountDetails';
const accountEditRoute = '/accountEdit';

const topPad = 5.0;
const leftPad = 20.0;
const bottomPad = 5.0;
const rightPad = 20.0;

//Colors use in app
const brightness = Brightness.light;
const dark = Brightness.dark;
const primary = Color.fromRGBO(220, 4, 25, 1);
const background = Colors.white;
const onPrimary = Colors.black;
const secondary = Color.fromRGBO(255, 204, 203, 1);
const onSecondary = primary;
const error = Color.fromRGBO(255, 0, 0, 1);
const onError = Color.fromARGB(255, 255, 15, 15);
const onBackground = Color.fromARGB(255, 235, 235, 235);
const surface = Color.fromARGB(0, 66, 66, 65);
const onSurface = Color.fromARGB(90, 66, 66, 65);

const income = Color.fromARGB(255, 217, 154, 61);
const transfer = Color.fromARGB(255, 50, 88, 99);
