class Province {
  Province({
    this.provinceId,
    this.province,
  });

  String? provinceId;
  String? province;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        provinceId: (json["province_id"] == null) ? null : json["province_id"],
        province: (json["province"] == null) ? null : json["province"],
      );

  Map<String, dynamic> toJson() => {
        "province_id": (provinceId == null) ? null : provinceId,
        "province": (province == null) ? null : province,
      };
}

class DestinationProvince {
  DestinationProvince({
    this.provinceId,
    this.province,
  });

  String? provinceId;
  String? province;

  factory DestinationProvince.fromJson(Map<String, dynamic> json) => DestinationProvince(
        provinceId: (json["province_id"] == null) ? null : json["province_id"],
        province: (json["province"] == null) ? null : json["province"],
      );

  Map<String, dynamic> toJson() => {
        "province_id": (provinceId == null) ? null : provinceId,
        "province": (province == null) ? null : province,
      };
}
