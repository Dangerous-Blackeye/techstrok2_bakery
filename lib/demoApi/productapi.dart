// import 'package:flutter/material.dart';
// import 'package:techstrock2/demoApi/api.dart';
// import 'package:techstrock2/demoApi/productmodal.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _client = FakeStoreApiClient();
//   late Future<List<Product>> _futureProducts;

//   @override
//   void initState() {
//     super.initState();
//     _futureProducts = _client.getProducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('FakeStore API Demo'),
//       ),
//       body: Column(
//         children: [
//           TextField(),
//           Expanded(
//             child: FutureBuilder<List<Product>>(
//               future: _futureProducts,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   final products = snapshot.data!;
//                   return ListView.builder(
//                     itemCount: products.length,
//                     itemBuilder: (context, index) {
//                       final product = products[index];
//                       return Card(
//                         child: ListTile(
//                           leading: Image.network(product.image),
//                           title: Text(product.title),
//                           subtitle: Text(product.category),
//                           trailing:
//                               Text('\$${product.price.toStringAsFixed(2)}'),
//                         ),
//                       );
//                     },
//                   );
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 } else {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
