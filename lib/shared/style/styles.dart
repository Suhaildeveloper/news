import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    titleSpacing: 20.0,
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    iconTheme: IconThemeData(color: Colors.black),
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness:
                            Brightness.dark // راجع الكود دا
                        ),
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    )),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed,
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

              );
ThemeData darkTheme = ThemeData(
                // Dark Mode ... الوضع الليلي
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: AppBarTheme(
                    titleSpacing: 20.0,
                    backgroundColor: HexColor('333739'),
                    elevation: 0.0,
                    iconTheme: IconThemeData(color: Colors.grey),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness:
                          Brightness.light, // راجع الكود دا
                    ),
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: HexColor('333739'),
                ),
                iconTheme: IconThemeData(color: Colors.white),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );