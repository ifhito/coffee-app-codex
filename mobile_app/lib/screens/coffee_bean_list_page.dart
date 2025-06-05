import 'package:flutter/material.dart';

import '../models/coffee_bean.dart';
import '../services/api_service.dart';

class CoffeeBeanListPage extends StatefulWidget {
  const CoffeeBeanListPage({super.key});

  @override
  State<CoffeeBeanListPage> createState() => _CoffeeBeanListPageState();
}

class _CoffeeBeanListPageState extends State<CoffeeBeanListPage> {
  late Future<List<CoffeeBean>> _futureBeans;
  final ApiService _api = ApiService();

  @override
  void initState() {
    super.initState();
    _futureBeans = _api.fetchCoffeeBeans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Coffee Beans')),
      body: FutureBuilder<List<CoffeeBean>>(
        future: _futureBeans,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No beans found'));
          }
          final beans = snapshot.data!;
          return ListView.builder(
            itemCount: beans.length,
            itemBuilder: (context, index) {
              final bean = beans[index];
              return ListTile(
                title: Text(bean.name),
                subtitle: Text('${bean.origin} - ${bean.roastLevel}'),
              );
            },
          );
        },
      ),
    );
  }
}
