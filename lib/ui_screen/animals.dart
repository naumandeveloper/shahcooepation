import 'dart:ui';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Gender { male, female }

class Animals extends StatelessWidget {
  const Animals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? item1 = "children";
    String? selected_breed = "Jersey";
    String? selected_gender = "Select Gender";
    var gender_list = ["Male", "Female"];
    var breed_list = [
      "Jersey",
      "Ayrshire",
      "Friesian",
      "Guernsey",
      "Dogli",
      "Australian"
    ];
    var litem = ["children", "Milky", "Non Milky", "Qurbani"];
    var _value=Gender.male;
    return ChangeNotifierProvider(
      create: ((context) => AnimalsNotifier()),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  hintText: "NickNAME",
                  hintStyle: TextStyle(inherit: true),
                  labelText: "NickNAME"),
            ),
            Text(
              "Animal Breed",
              style: TextStyle(fontSize: 25),
            ),
            Consumer<AnimalsNotifier>(
              builder: (context, state, child) {
                return DropdownButton(
                  dropdownColor: Colors.yellow,
                  // Initial Value
                  value: selected_breed,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: breed_list.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    selected_breed = newValue;
                    state.notifyListeners();
                  },
                );
              },
            ),
            Consumer<AnimalsNotifier>(
              builder: (context,state,child){
                return Column(
                  children: [
                    Text(
                      "Gender",
                      style: TextStyle(fontSize: 10),
                    ),
                    // RadioListTile(
                    //     value: Gender.male, groupValue: _value, onChanged: (Gender? value){
                    //   _value=value!;
                    //   state.notifyListeners();
                    //
                    // }),
                    // RadioListTile(
                    //     value: Gender.female, groupValue: _value,
                    //     onChanged: (Gender? value){
                    //   _value=value!;
                    //   state.notifyListeners();
                    // }),
                  ],
                );
              },
            ),

            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  hintText: "weight",
                  hintStyle: TextStyle(inherit: true),
                  labelText: "Weight"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Animal Type",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Consumer<AnimalsNotifier>(
              builder: (context, state, child) {
                return DropdownButton(
                  dropdownColor: Colors.yellow,
                  // Initial Value
                  value: item1,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: litem.map((String items) {
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
            ElevatedButton(child: Text("Add Animal"), onPressed: () {})
          ],
        ),
      ),
    );
  }
}

class AnimalsNotifier with ChangeNotifier {
  notifyListener() {}
}
