import 'package:provider/provider.dart';
import 'package:reco_app/widgets/dashboardnavigation.dart';

import 'index.dart';
import 'mycolors.dart';
import 'providers/appData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppData())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Reco App',
          theme: ThemeData(
              primaryColor: MyColor.appBarColor,
              accentColor: MyColor.buttonColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: TextTheme(
                headline1:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                headline6:
                    TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
                bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hindi'),
              )),
          home: SafeArea(child: DashboardNavigation())),
    );
    //home: SafeArea(child: SearchScreen()));
  }
}
