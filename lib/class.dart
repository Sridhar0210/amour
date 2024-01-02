class DataModel {
  String? name;

  DataModel({required this.name,});
}
class DataModelList {
  List<DataModel> itemList;

  DataModelList(List<Map<String, String>> itemData) : itemList = itemData.map((e) => DataModel(name: e['name'] )).toList();
}
var itemData = [
  {
    'name':""
  },
];
DataModelList dataModelList = DataModelList(itemData);
