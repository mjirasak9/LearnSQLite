import 'package:flutter/material.dart';
import 'package:mjeetrn33/models/productmodel.dart';
import 'package:mjeetrn33/utilitys/sqllite.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({Key? key}) : super(key: key);

  @override
  _ProductAddState createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  TextEditingController idController = TextEditingController();
  TextEditingController dsController = TextEditingController();
  TextEditingController prController = TextEditingController();
  FocusNode idFocus = FocusNode();
  FocusNode dsFocus = FocusNode();
  FocusNode prFocus = FocusNode();
  FocusNode svFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    idController.dispose();
    dsController.dispose();
    prController.dispose();
    idFocus.dispose();
    dsFocus.dispose();
    prFocus.dispose();
    svFocus.dispose();

    super.dispose();
  }

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
        focusNode: svFocus,
        onPressed: () async {
          Map<String, dynamic> map = Map();
          map['productID'] = idController.text;
          map['productDS'] = dsController.text;
          map['productPR'] = int.parse(prController.text);
          print('Step 1 map => ${map}');

          ProductModel productModel = ProductModel.fromJson(map);

          await SQLHelper().insertDB(productModel).then((value) {
            print('Step 2 Insert Success');
          });

          Navigator.pop(context);
          print(
              'Step 3 ID => ${idController.text} DS => ${dsController.text} PR = ${prController.text}');

          idController.clear();
          dsController.clear();
          prController.clear();
          print(
              'Step 4 ID => ${idController.text} DS => ${dsController.text} PR = ${prController.text}');
          svFocus.unfocus();
          FocusScope.of(context).requestFocus(idFocus);
        },
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
          keyboardType: TextInputType.text,
          autofocus: true,
          controller: idController,
          focusNode: idFocus,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            idFocus.unfocus();
            FocusScope.of(context).requestFocus(dsFocus);
          },
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
          focusNode: dsFocus,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            dsFocus.unfocus();
            FocusScope.of(context).requestFocus(prFocus);
          },
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
          keyboardType: TextInputType.number,
          controller: prController,
          focusNode: prFocus,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            prFocus.unfocus();
            FocusScope.of(context).requestFocus(svFocus);
          },
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
