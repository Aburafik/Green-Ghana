// To parse this JSON data, do
//
//     final regesterTreeModel = regesterTreeModelFromJson(jsonString);

import 'dart:convert';

RegesterTreeModel regesterTreeModelFromJson(String str) => RegesterTreeModel.fromJson(json.decode(str));

String regesterTreeModelToJson(RegesterTreeModel data) => json.encode(data.toJson());

class RegesterTreeModel {
    String treeName;
    int treeHeight;
    String locationPlanted;
    String datePlanted;
    String image;


    RegesterTreeModel({
        required this.treeName,
        required this.treeHeight,
        required this.locationPlanted,
        required this.datePlanted,
        required this.image,
        
    });

    factory RegesterTreeModel.fromJson(Map<String, dynamic> json) => RegesterTreeModel(
        treeName: json["treeName"],
        treeHeight: json["treeHeight"],
        locationPlanted: json["locationPlanted"],
        datePlanted: json["datePlanted"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "treeName": treeName,
        "treeHeight": treeHeight,
        "locationPlanted": locationPlanted,
        "datePlanted": datePlanted,
    };
}
