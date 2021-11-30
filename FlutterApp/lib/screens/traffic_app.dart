import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:traffic_sign_identity/screens/about_us.dart';
import 'package:traffic_sign_identity/screens/classifier_screen/predictor_page.dart';
import 'package:traffic_sign_identity/screens/classifier_screen/result_screen.dart';
import 'package:traffic_sign_identity/screens/home.dart';
import 'package:traffic_sign_identity/screens/prediction_history.dart';

const HomeRoute = "/"; // '/' is default home route
const ClassifierTitleRoute = "/classifier";
const ClassifierResultRoute = "/classifier/result";
const AboutUsRoute = "/aboutus";
const HistoryPage = "/history";

class TrafficApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _routes(),
        theme: ThemeData.dark(),
        home: HomeScreen());
    // home: HomeScreen());
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case HomeRoute:
          screen = HomeScreen();
          break;
        case ClassifierTitleRoute:
          screen = PredictorPage();
          break;
        case ClassifierResultRoute:
          screen = ResultScreen(arguments['image'], arguments['posts']);
          break;
        case AboutUsRoute:
          screen = AboutUs();
          break;
        case HistoryPage:
          screen = PredicitonHistory();
          break;
        default:
          screen = null;
      }
      return MaterialPageRoute(builder: ((BuildContext context) => screen));
    };
  }
}
