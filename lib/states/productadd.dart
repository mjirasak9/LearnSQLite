import 'package:flutter/material.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({Key? key}) : super(key: key);

  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  TextEditingController idController = TextEditingController();
  TextEditingController dsController = TextEditingController();
  TextEditingController prController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            textID(),
            textDS(),
            textPR(),
            btnSave(),
          ],
        ),
      ),
    );
  }

  Widget btnSave() {
    return Container(
      padding: EdgeInsets.only(top: 15),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.save),
        label: Text('Save'),
      ),
    );
  }

  Widget textID() {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 15.0),
        width: MediaQuery.of(context).size.width - 100,
        child: TextFormField(
          controller: idController,
          decoration: InputDecoration(
              labelText: 'ID',
              labelStyle: TextStyle(fontSize: 25, color: Colors.green),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.teal),
              ),
              prefixIcon: Icon(
                Icons.store,
                color: Colors.brown,
                size: 30.0,
              )),
        ),
      ),
    );
  }

  Widget textDS() {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 15.0),
        width: MediaQuery.of(context).size.width - 100,
        child: TextFormField(
          controller: dsController,
          decoration: InputDecoration(
              labelText: 'Desc.',
              labelStyle: TextStyle(fontSize: 25, color: Colors.green),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.teal),
              ),
              prefixIcon: Icon(
                Icons.description,
                color: Colors.yellow,
                size: 30.0,
              )),
        ),
      ),
    );
  }

  Widget textPR() {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 15.0),
        width: MediaQuery.of(context).size.width - 100,
        child: TextFormField(
          controller: prController,
          decoration: InputDecoration(
              labelText: 'Price',
              labelStyle: TextStyle(fontSize: 25, color: Colors.green),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.teal),
              ),
              prefixIcon: Icon(
                Icons.price_change,
                color: Colors.red,
                size: 30.0,
              )),
        ),
      ),
    );
  }
}
