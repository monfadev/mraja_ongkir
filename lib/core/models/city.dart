class City {
  City({
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

  factory City.fromJson(Map<String, dynamic> json) => City(
        cityId: (json["city_id"] == null) ? null : json["city_id"],
        provinceId: (json["province_id"] == null) ? null : json["province_id"],
        province: (json["province"] == null) ? null : json["province"],
        type: (json["type"] == null) ? null : json["type"],
        cityName: (json["city_name"] == null) ? null : json["city_name"],
        postalCode: (json["postal_code"] == null) ? null : json["postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "city_id": (cityId == null) ? null : cityId,
        "province_id": (provinceId == null) ? null : provinceId,
        "province": (province == null) ? null : province,
        "type": (type == null) ? null : type,
        "city_name": (cityName == null) ? null : cityName,
        "postal_code": (postalCode == null) ? null : postalCode,
      };
}

class DestinationCity {
  DestinationCity({
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

  factory DestinationCity.fromJson(Map<String, dynamic> json) => DestinationCity(
        cityId: (json["city_id"] == null) ? null : json["city_id"],
        provinceId: (json["province_id"] == null) ? null : json["province_id"],
        province: (json["province"] == null) ? null : json["province"],
        type: (json["type"] == null) ? null : json["type"],
        cityName: (json["city_name"] == null) ? null : json["city_name"],
        postalCode: (json["postal_code"] == null) ? null : json["postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "city_id": (cityId == null) ? null : cityId,
        "province_id": (provinceId == null) ? null : provinceId,
        "province": (province == null) ? null : province,
        "type": (type == null) ? null : type,
        "city_name": (cityName == null) ? null : cityName,
        "postal_code": (postalCode == null) ? null : postalCode,
      };
}
