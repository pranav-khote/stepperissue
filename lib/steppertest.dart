import 'package:flutter/material.dart';
import 'package:stepperissue/store.dart';
import 'package:velocity_x/velocity_x.dart';

class StepperTest extends StatelessWidget {
  const StepperTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyStore store = VxState.store as MyStore;

    dropDownWidget() {
      return VxBuilder(
        mutations: {ChangeMutation},
        builder: (context, _, __) {
          return DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text("Change Value"),
                value: "Empty",
              ),
              DropdownMenuItem(
                child: Text("Data1"),
                value: "Data 1",
              ),
              DropdownMenuItem(
                child: Text("Data2"),
                value: "Data 2",
              ),
              DropdownMenuItem(
                child: Text("Data3"),
                value: "Data 3",
              ),
              DropdownMenuItem(
                child: Text("Data4"),
                value: "Data 4",
              ),
              DropdownMenuItem(
                child: Text("Data5"),
                value: "Data 5",
              ),
            ],
            onChanged: (value) {
              ChangeMutation(
                value.toString(),
              );
            },
            value: store.selected,
          );
        },
      );
    }

    stepperWidget() {
      return VxBuilder(
        mutations: {ChangeMutation},
        builder: (context, _, __) {
          return Column(
            children: [
              Text("Original Value ${store.data[store.selected]}"),
              SizedBox(
                height: 10,
              ),
              store.selected.contains("Empty")
                  ? Container()
                  : VxStepper(
                      defaultValue: int.parse(
                        store.data[store.selected].toString(),
                      ),
                    ),
            ],
          );
        },
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dropDownWidget(),
              stepperWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
