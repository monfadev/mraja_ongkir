part of 'screens.dart';

class DestinationCityScreen extends StatefulWidget {
  final String? param;
  const DestinationCityScreen(this.param, {Key? key}) : super(key: key);

  @override
  State<DestinationCityScreen> createState() => _DestinationCityScreenState();
}

class _DestinationCityScreenState extends State<DestinationCityScreen> {
  final TextEditingController _etSearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("City")),
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
            child: FutureBuilder<List<DestinationCity>>(
              future: RajaOngkirHttp(context).listOfDestinationCity(widget.param ?? ""),
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

  ListTile _items(DestinationCity data) {
    return ListTile(
      title: Text(data.cityName ?? "Not Available"),
      onTap: () {
        Navigator.pop(context, data);
      },
    );
  }
}
