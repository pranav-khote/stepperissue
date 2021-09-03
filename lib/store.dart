import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  String selected = "Empty";

  Map<String, int> data = {
    "Data 1": 10,
    "Data 2": 11,
    "Data 3": 12,
    "Data 4": 13,
    "Data 5": 14,
  };
}

class ChangeMutation extends VxMutation<MyStore> {
  String selected;
  ChangeMutation(this.selected);

  perform() {
    store.selected = selected;
  }
}
