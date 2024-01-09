import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app/my_app.dart';
import 'package:meal_monkey/app/my_app_controller.dart';
import 'package:meal_monkey/core/data/repositories/shared_preferences_repository.dart';
import 'package:meal_monkey/core/services/cart_service.dart';
import 'package:meal_monkey/core/services/connectivity_service.dart';
import 'package:meal_monkey/core/services/location_service.dart';
import 'package:meal_monkey/core/services/notification_service.dart';
import 'package:meal_monkey/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
/*
network utilits
network config
common response

*/


/* for all api
reposetry
end point
model
 */
/*
الاستدعاء
 */

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });
  await Get.put(SharedPreferencesRepository());
  await Get.put(LocationService());
  Get.put(CartService());
  Get.put(ConnectivityService());
  Get.put(MyAppController());

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    Get.put(NotificationService());
  } catch (e) {
    print(e);
  }

  runApp(const MyApp());
}
