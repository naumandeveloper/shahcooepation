
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => DashboardNotifier()),
    child: Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

        ],
      ),
    ),
    );
  }
}
class DashboardNotifier with ChangeNotifier{

}
