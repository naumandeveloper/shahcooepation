import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 //   var state=FeedNotifier();
  //  state.notifyListeners();
    String? item1="Hand Feed";
    var litems = ["Hand Feed", "Buy Feed"];
    var _key=GlobalKey<FormState>();
    return ChangeNotifierProvider(
      create: ((context) => FeedNotifier()),
      child: Scaffold(
        appBar: AppBar(title: Text("Feed Management System"),),
        body: Form(
          key: _key,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
          TextFormField(
          decoration: InputDecoration(
          hintText: "Feed Name",
              hintStyle: TextStyle(inherit: true),
              labelText: "Feed Name"
          ),
      ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "No of Animals",
                      hintStyle: TextStyle(inherit: true),
                      labelText: "No of Animals"
                  ),
                ),

      Consumer<FeedNotifier>(
          builder: (context, state, child){
       return  DropdownButton(
              dropdownColor: Colors.yellow,
              // Initial Value
              value: item1,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: litems.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                item1 = newValue;
                state.notifyListeners();
              },
            );


          },
      ),
            Consumer<FeedNotifier>(
              builder: (context,state,child){
              return item1=="Hand Feed" ?
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (String newval){
                  item1=newval;
                  state.notifyListeners();
                },
                decoration: InputDecoration(
                    hintText: "Labout Cost",
                    hintStyle: TextStyle(inherit: true),
                    labelText: "Labour Cost"
                ),
              ) :  TextFormField(
                  keyboardType: TextInputType.number,
                onChanged: (String newval){
                  item1=newval;
                  state.notifyListeners();
                },
                decoration: InputDecoration(
                    hintText: "Price",
                    hintStyle: TextStyle(inherit: true),
                    labelText: "Price"
                ),

              );

              }

            ),
                ElevatedButton(
                    onPressed: (){
                      if(_key.currentState!.validate()){

                      }

                    },
                    child: Text("Feed Saved")
                )

  ]
    ),
        ),
    )
    );
  }
}

class FeedNotifier with ChangeNotifier {
  notifyListeners();
}
