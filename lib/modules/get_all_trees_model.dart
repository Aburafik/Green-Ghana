// To parse this JSON data, do
//
//     final getAllTreeModel = getAllTreeModelFromJson(jsonString);

import 'dart:convert';

List<GetAllTreeModel> getAllTreeModelFromJson(String str) =>
    List<GetAllTreeModel>.from(
        json.decode(str).map((x) => GetAllTreeModel.fromJson(x)));

String getAllTreeModelToJson(List<GetAllTreeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllTreeModel {
  String id;
  String treeName;
  int treeHeight;
  String locationPlanted;
  String datePlanted;
  String image;
  String status;
  Owner owner;
  int v;

  GetAllTreeModel({
    required this.id,
    required this.treeName,
    required this.treeHeight,
    required this.locationPlanted,
    required this.datePlanted,
    required this.image,
    required this.status,
    required this.owner,
    required this.v,
  });

  factory GetAllTreeModel.fromJson(Map<String, dynamic> json) =>
      GetAllTreeModel(
        id: json["_id"],
        treeName: json["treeName"],
        treeHeight: json["treeHeight"],
        locationPlanted: json["locationPlanted"],
        datePlanted: json["datePlanted"],
        image: json["image"],
        status: json["status"],
        owner: Owner.fromJson(json["owner"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "treeName": treeName,
        "treeHeight": treeHeight,
        "locationPlanted": locationPlanted,
        "datePlanted": datePlanted,
        "image": image,
        "status": status,
        "owner": owner.toJson(),
        "__v": v,
      };
}

class Owner {
  String id;
  String name;

  Owner({
    required this.id,
    required this.name,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
