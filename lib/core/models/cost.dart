// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

// String welcomeToJson(Welcome data) => json.encode(data.toJson());

// class Welcome {
//     Welcome({
//         this.rajaongkir,
//     });

//     Rajaongkir rajaongkir;

//     factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         rajaongkir: json["rajaongkir"] == null ? null : Rajaongkir.fromJson(json["rajaongkir"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "rajaongkir": rajaongkir == null ? null : rajaongkir.toJson(),
//     };
// }

// class Rajaongkir {
//     Rajaongkir({
//         this.query,
//         this.status,
//         this.originDetails,
//         this.destinationDetails,
//         this.results,
//     });

//     Query query;
//     Status status;
//     NDetails originDetails;
//     NDetails destinationDetails;
//     List<Result> results;

//     factory Rajaongkir.fromJson(Map<String, dynamic> json) => Rajaongkir(
//         query: json["query"] == null ? null : Query.fromJson(json["query"]),
//         status: json["status"] == null ? null : Status.fromJson(json["status"]),
//         originDetails: json["origin_details"] == null ? null : NDetails.fromJson(json["origin_details"]),
//         destinationDetails: json["destination_details"] == null ? null : NDetails.fromJson(json["destination_details"]),
//         results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "query": query == null ? null : query.toJson(),
//         "status": status == null ? null : status.toJson(),
//         "origin_details": originDetails == null ? null : originDetails.toJson(),
//         "destination_details": destinationDetails == null ? null : destinationDetails.toJson(),
//         "results": results == null ? null : List<dynamic>.from(results.map((x) => x.toJson())),
//     };
// }

// class NDetails {
//     NDetails({
//         this.cityId,
//         this.provinceId,
//         this.province,
//         this.type,
//         this.cityName,
//         this.postalCode,
//     });

//     String cityId;
//     String provinceId;
//     String province;
//     String type;
//     String cityName;
//     String postalCode;

//     factory NDetails.fromJson(Map<String, dynamic> json) => NDetails(
//         cityId: json["city_id"] == null ? null : json["city_id"],
//         provinceId: json["province_id"] == null ? null : json["province_id"],
//         province: json["province"] == null ? null : json["province"],
//         type: json["type"] == null ? null : json["type"],
//         cityName: json["city_name"] == null ? null : json["city_name"],
//         postalCode: json["postal_code"] == null ? null : json["postal_code"],
//     );

//     Map<String, dynamic> toJson() => {
//         "city_id": cityId == null ? null : cityId,
//         "province_id": provinceId == null ? null : provinceId,
//         "province": province == null ? null : province,
//         "type": type == null ? null : type,
//         "city_name": cityName == null ? null : cityName,
//         "postal_code": postalCode == null ? null : postalCode,
//     };
// }

// class Query {
//     Query({
//         this.origin,
//         this.destination,
//         this.weight,
//         this.courier,
//     });

//     String origin;
//     String destination;
//     int weight;
//     String courier;

//     factory Query.fromJson(Map<String, dynamic> json) => Query(
//         origin: json["origin"] == null ? null : json["origin"],
//         destination: json["destination"] == null ? null : json["destination"],
//         weight: json["weight"] == null ? null : json["weight"],
//         courier: json["courier"] == null ? null : json["courier"],
//     );

//     Map<String, dynamic> toJson() => {
//         "origin": origin == null ? null : origin,
//         "destination": destination == null ? null : destination,
//         "weight": weight == null ? null : weight,
//         "courier": courier == null ? null : courier,
//     };
// }

// class Result {
//     Result({
//         this.code,
//         this.name,
//         this.costs,
//     });

//     String code;
//     String name;
//     List<ResultCost> costs;

//     factory Result.fromJson(Map<String, dynamic> json) => Result(
//         code: json["code"] == null ? null : json["code"],
//         name: json["name"] == null ? null : json["name"],
//         costs: json["costs"] == null ? null : List<ResultCost>.from(json["costs"].map((x) => ResultCost.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "code": code == null ? null : code,
//         "name": name == null ? null : name,
//         "costs": costs == null ? null : List<dynamic>.from(costs.map((x) => x.toJson())),
//     };
// }

// class ResultCost {
//     ResultCost({
//         this.service,
//         this.description,
//         this.cost,
//     });

//     String service;
//     String description;
//     List<CostCost> cost;

//     factory ResultCost.fromJson(Map<String, dynamic> json) => ResultCost(
//         service: json["service"] == null ? null : json["service"],
//         description: json["description"] == null ? null : json["description"],
//         cost: json["cost"] == null ? null : List<CostCost>.from(json["cost"].map((x) => CostCost.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "service": service == null ? null : service,
//         "description": description == null ? null : description,
//         "cost": cost == null ? null : List<dynamic>.from(cost.map((x) => x.toJson())),
//     };
// }

// class CostCost {
//     CostCost({
//         this.value,
//         this.etd,
//         this.note,
//     });

//     int value;
//     String etd;
//     String note;

//     factory CostCost.fromJson(Map<String, dynamic> json) => CostCost(
//         value: json["value"] == null ? null : json["value"],
//         etd: json["etd"] == null ? null : json["etd"],
//         note: json["note"] == null ? null : json["note"],
//     );

//     Map<String, dynamic> toJson() => {
//         "value": value == null ? null : value,
//         "etd": etd == null ? null : etd,
//         "note": note == null ? null : note,
//     };
// }

// class Status {
//     Status({
//         this.code,
//         this.description,
//     });

//     int code;
//     String description;

//     factory Status.fromJson(Map<String, dynamic> json) => Status(
//         code: json["code"] == null ? null : json["code"],
//         description: json["description"] == null ? null : json["description"],
//     );

//     Map<String, dynamic> toJson() => {
//         "code": code == null ? null : code,
//         "description": description == null ? null : description,
//     };
// }
