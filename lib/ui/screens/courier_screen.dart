part of 'screens.dart';

class CourierScreen extends StatefulWidget {
  const CourierScreen({Key? key}) : super(key: key);

  @override
  State<CourierScreen> createState() => _CourierScreenState();
}

class _CourierScreenState extends State<CourierScreen> {
  final List<Courier> _courier = [
    Courier(codeName: "jne", description: "Jalur Nugraha Ekakurir (JNE)"),
    Courier(codeName: "pos", description: "Pos Indonesia (POS)"),
    Courier(codeName: "tiki", description: "Titipan Kilat (TIKI)"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Courier")),
      body: ListView(
        children: _courier.map((e) => _items(e)).toList(),
      ),
    );
  }

  ListTile _items(Courier data) {
    return ListTile(
      title: Text(data.description ?? "Not Available"),
      onTap: () {
        Navigator.pop(context, data);
      },
    );
  }
}
