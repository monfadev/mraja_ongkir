class Cost {
  Cost({
    this.rajaongkir,
  });

  Rajaongkir? rajaongkir;

  factory Cost.fromJson(Map<String, dynamic> json) => Cost(
        rajaongkir: json["rajaongkir"] == null ? null : Rajaongkir.fromJson(json["rajaongkir"]),
      );

  Map<String, dynamic> toJson() => {
        "rajaongkir": rajaongkir == null ? null : rajaongkir!.toJson(),
      };
}

class Rajaongkir {
  Rajaongkir({
    this.query,
    this.status,
    this.originDetails,
    this.destinationDetails,
    this.results,
  });

  Query? query;
  Status? status;
  NDetails? originDetails;
  NDetails? destinationDetails;
  List<Result>? results;

  factory Rajaongkir.fromJson(Map<String, dynamic> json) => Rajaongkir(
        query: json["query"] == null ? null : Query.fromJson(json["query"]),
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        originDetails: json["origin_details"] == null ? null : NDetails.fromJson(json["origin_details"]),
        destinationDetails: json["destination_details"] == null ? null : NDetails.fromJson(json["destination_details"]),
        results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "query": query == null ? null : query!.toJson(),
        "status": status == null ? null : status!.toJson(),
        "origin_details": originDetails == null ? null : originDetails!.toJson(),
        "destination_details": destinationDetails == null ? null : destinationDetails!.toJson(),
        "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class NDetails {
  NDetails({
    this.cityId,
    this.provinceId,
    this.province,
    this.type,
    this.cityName,
    this.postalCode,
  });

  String? cityId;
  String? provinceId;
  String? province;
  String? type;
  String? cityName;
  String? postalCode;

  factory NDetails.fromJson(Map<String, dynamic> json) => NDetails(
        cityId: json["city_id"],
        provinceId: json["province_id"],
        province: json["province"],
        type: json["type"],
        cityName: json["city_name"],
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "city_id": cityId,
        "province_id": provinceId,
        "province": province,
        "type": type,
        "city_name": cityName,
        "postal_code": postalCode,
      };
}

class Query {
  Query({
    this.origin,
    this.destination,
    this.weight,
    this.courier,
  });

  String? origin;
  String? destination;
  int? weight;
  String? courier;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        origin: json["origin"],
        destination: json["destination"],
        weight: json["weight"],
        courier: json["courier"],
      );

  Map<String, dynamic> toJson() => {
        "origin": origin,
        "destination": destination,
        "weight": weight,
        "courier": courier,
      };
}

class Result {
  Result({
    this.code,
    this.name,
    this.costs,
  });

  String? code;
  String? name;
  List<ResultCost>? costs;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        code: json["code"],
        name: json["name"],
        costs: json["costs"] == null ? null : List<ResultCost>.from(json["costs"].map((x) => ResultCost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "costs": costs == null ? null : List<dynamic>.from(costs!.map((x) => x.toJson())),
      };
}

class ResultCost {
  ResultCost({
    this.service,
    this.description,
    this.cost,
  });

  String? service;
  String? description;
  List<CostCost>? cost;

  factory ResultCost.fromJson(Map<String, dynamic> json) => ResultCost(
        service: json["service"],
        description: json["description"],
        cost: json["cost"] == null ? null : List<CostCost>.from(json["cost"].map((x) => CostCost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "service": service,
        "description": description,
        "cost": cost == null ? null : List<dynamic>.from(cost!.map((x) => x.toJson())),
      };
}

class CostCost {
  CostCost({
    this.value,
    this.etd,
    this.note,
  });

  int? value;
  String? etd;
  String? note;

  factory CostCost.fromJson(Map<String, dynamic> json) => CostCost(
        value: json["value"],
        etd: json["etd"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "etd": etd,
        "note": note,
      };
}

class Status {
  Status({
    this.code,
    this.description,
  });

  int? code;
  String? description;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "description": description,
      };
}
