import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Customer extends StatelessWidget {
  const Customer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   var state=FeedNotifier();
    //  state.notifyListeners();
    String? item1="Delivery Customer";
    var litems = ["Delivery Customer", "Home Base"];
    var _key=GlobalKey<FormState>();
    return ChangeNotifierProvider(
        create: ((context) => CustomerNotifier()),
        child: Scaffold(
          appBar: AppBar(title: Text("Customer Management System"),),
          body: Form(
            key: _key,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "CUSTOMER NAME",
                        hintStyle: TextStyle(inherit: true),
                        labelText: "CUSTOMER NAME"
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Address",
                        hintStyle: TextStyle(inherit: true),
                        labelText: "Address"
                    ),
                  ),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (String newval){
                item1=newval;
              //  state.notifyListeners();
              },
              decoration: InputDecoration(
                  hintText: "Phone No",
                  hintStyle: TextStyle(inherit: true),
                  labelText: "Phone No"
              ),

            ),

                  Consumer<CustomerNotifier>(
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
                  // Consumer<CustomerNotifier>(
                  //     builder: (context,state,child){
                  //       return item1=="Delivery Customer" ?
                  //       TextFormField(
                  //         keyboardType: TextInputType.number,
                  //         onChanged: (String newval){
                  //           item1=newval;
                  //           state.notifyListeners();
                  //         },
                  //         decoration: InputDecoration(
                  //             hintText: "Labout Cost",
                  //             hintStyle: TextStyle(inherit: true),
                  //             labelText: "Labour Cost"
                  //         ),
                  //       ) :  SizedBox();
                  //
                  //     }
                  //
                  // ),
                  ElevatedButton(
                      onPressed: (){
                        if(_key.currentState!.validate()){

                        }

                      },
                      child: Text("Customer Saved")
                  )

                ]
            ),
          ),
        )
    );
  }
}

class CustomerNotifier with ChangeNotifier {
  notifyListeners();
}
