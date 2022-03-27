part of 'screens.dart';

class ProvinceScreen extends StatefulWidget {
  const ProvinceScreen({Key? key}) : super(key: key);

  @override
  State<ProvinceScreen> createState() => _ProvinceScreenState();
}

class _ProvinceScreenState extends State<ProvinceScreen> {
  String _search = "";

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
              decoration: fieldDecoration("Search"),
              onChanged: (value) {
                if (mounted) {
                  setState(() {
                    _search = value;
                  });
                }
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Province>>(
              future: RajaOngkirHttp(context).listOfProvince(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CircularProgressIndicator());
                if (!snapshot.hasData && snapshot.hasError) return const SizedBox(height: 300, child: Center(child: Text("Data not found")));

                return ListView(
                  children: snapshot.data!.where((element) => element.province!.toLowerCase().contains(_search.toLowerCase())).map((e) => _items(e)).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile _items(Province data) {
    return ListTile(
      title: Text(data.province ?? "Not Available"),
      onTap: () {
        Navigator.pop(context, data);
      },
    );
  }
}
