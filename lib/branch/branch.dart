import 'package:flutter/material.dart';

class Branch extends StatefulWidget {
  const Branch({super.key});

  @override
  State<Branch> createState() => _BranchState();
}

class _BranchState extends State<Branch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Branch"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Product',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              CurrentStock(),
              CurrentStock(),
              CurrentStock(),
              CurrentStock(),
              CurrentStock(),
            ],
          ),
        ),
      ),
    );
  }

  Widget CurrentStock() {
    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromARGB(255, 237, 236, 236)),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "bread",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 15),
            ),
            subtitle: Text(
              "Category",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Color.fromARGB(255, 154, 154, 154), fontSize: 15),
            ),
            trailing: Text(
              "Total Available",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
