import 'package:des_mov_dio_carlos/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _api = ApiService();
  List<dynamic> users = [];
  bool loading = true;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    final result = await _api.getUsers();
    setState(() {
      users = result;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo usuarios")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final item = users[index];
                return ListTile(
                  title: Text(item['name'] ?? ''),
                  subtitle: Text(item['email'] ?? ''),
                );
              },
            ),
    );
  }
}
