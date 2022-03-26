part of 'screens.dart';

class DestinationProvinceScreen extends StatefulWidget {
  const DestinationProvinceScreen({Key? key}) : super(key: key);

  @override
  State<DestinationProvinceScreen> createState() => _DestinationProvinceScreenState();
}

class _DestinationProvinceScreenState extends State<DestinationProvinceScreen> {
  final TextEditingController _etSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Province")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _etSearch,
              decoration: fieldDecoration("Search"),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<DestinationProvince>>(
              future: RajaOngkirHttp(context).listOfDestinationProvince(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
                if (!snapshot.hasData && snapshot.hasError) return const SizedBox(height: 300, child: Center(child: Text("Data not found")));

                return ListView(
                  children: snapshot.data!.map((e) => _items(e)).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile _items(DestinationProvince data) {
    return ListTile(
      title: Text(data.province ?? "Not Available"),
      onTap: () {
        Navigator.pop(context, data);
      },
    );
  }
}
