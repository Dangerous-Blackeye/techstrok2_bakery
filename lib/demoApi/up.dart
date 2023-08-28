// import 'package:flutter/material.dart';

// class EditProductScreen extends StatefulWidget {
//   final Product product;

//   EditProductScreen({required this.product});

//   @override
//   _EditProductScreenState createState() => _EditProductScreenState();
// }

// class _EditProductScreenState extends State<EditProductScreen> {
//   late String _name;
//   late double _price;
//   late String _description;

//   @override
//   void initState() {
//     super.initState();
//     _name = widget.product.name;
//     _price = widget.product.price;
//     _description = widget.product.description;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Product'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(labelText: 'Name'),
//               onChanged: (value) {
//                 setState(() {
//                   _name = value;
//                 });
//               },
//               controller: TextEditingController(text: _name),
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: 'Price'),
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//                 setState(() {
//                   _price = double.parse(value);
//                 });
//               },
//               controller: TextEditingController(text: _price.toString()),
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: 'Description'),
//               maxLines: 3,
//               onChanged: (value) {
//                 setState(() {
//                   _description = value;
//                 });
//               },
//               controller: TextEditingController(text: _description),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               child: Text('Save'),
//               onPressed: () {
//                 // Update the product with the new details
//                 widget.product.name = _name;
//                 widget.product.price = _price;
//                 widget.product.description = _description;

//                 // Navigate back to the product list screen
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Product {
//   int id;
//   String name;
//   double price;
//   String description;

//   Product(
//       {required this.id,
//       required this.name,
//       required this.price,
//       required this.description});
// }

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   List<Product> products = [
//     Product(
//         id: 1,
//         name: 'Product 1',
//         price: 10.0,
//         description: 'Description of Product 1'),
//     Product(
//         id: 2,
//         name: 'Product 2',
//         price: 20.0,
//         description: 'Description of Product 2'),
//     Product(
//         id: 3,
//         name: 'Product 3',
//         price: 30.0,
//         description: 'Description of Product 3'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (BuildContext context, int index) {
//           Product product = products[index];
//           return ListTile(
//             title: Text(product.name),
//             subtitle: Text(product.description),
//             trailing: Text(product.price.toString()),
//             onTap: () {
//               // Navigate to the edit product screen and pass the selected product as a parameter
//               Navigator.pushNamed(context, '/edit-product', arguments: product);
//             },
//           );
//         },
//       ),
//     );
//   }
// }
