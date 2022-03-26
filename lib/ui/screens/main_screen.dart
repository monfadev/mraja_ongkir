part of 'screens.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// From
  Province? province;
  City? city;

  /// To
  DestinationProvince? toProvince;
  DestinationCity? toCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(title: const Text("Raja Ongkir")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Province", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Material(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProvinceScreen())).then((value) {
                  setState(() {
                    province = value;
                  });
                });
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(province != null ? province!.province! : "Select Provinsi"),
                    const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text("City", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Material(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                if (province == null) {
                  Flushbar(
                    message: "Please pick province",
                    duration: const Duration(seconds: 1),
                    flushbarPosition: FlushbarPosition.BOTTOM,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    borderRadius: BorderRadius.circular(10),
                  ).show(context);
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen(province?.provinceId))).then((value) {
                    setState(() {
                      city = value;
                    });
                  });
                }
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(city != null ? city!.cityName! : "Select City"),
                    const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  ],
                ),
              ),
            ),
          ),
          _items(
            title: "Destination Province",
            onTap: () {
              if (province == null || city == null) {
                Flushbar(
                  message: "Please pick province and city",
                  duration: const Duration(seconds: 1),
                  flushbarPosition: FlushbarPosition.BOTTOM,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  borderRadius: BorderRadius.circular(10),
                ).show(context);
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DestinationProvinceScreen())).then((value) {
                  setState(() {
                    toProvince = value;
                  });
                });
              }
            },
            data: toProvince != null ? toProvince!.province! : "Select Destination Province",
          ),
          _items(
            title: "Destination City",
            onTap: () {
              if (province == null || city == null) {
                Flushbar(
                  message: "Please pick province and city",
                  duration: const Duration(seconds: 1),
                  flushbarPosition: FlushbarPosition.BOTTOM,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  borderRadius: BorderRadius.circular(10),
                ).show(context);
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DestinationCityScreen(toProvince?.provinceId))).then((value) {
                  setState(() {
                    toCity = value;
                  });
                });
              }
            },
            data: toCity != null ? toCity!.cityName! : "Select Destination City",
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () async {
              await RajaOngkirHttp(context).createOngkir();
            },
            child: const Text("Create Ongkir"),
          ),
        ],
      ),
    );
  }

  Widget _items({String? title, Function? onTap, String? data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        Text(title ?? "", style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Material(
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              onTap!();
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data ?? ""),
                  const Icon(Icons.arrow_forward_ios_rounded, size: 16),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
