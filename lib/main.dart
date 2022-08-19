import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping/json%20class.dart';

main() => runApp(shop());

class shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: pgone(),
    );
  }
}

class pgone extends StatefulWidget {
  @override
  State<pgone> createState() => _pgoneState();
}

class _pgoneState extends State<pgone> {
  Dio dio = Dio();
  String url = 'https://fakestoreapi.com/products';
  shoplist? product;

  @override
  void initstate() {
    super.initState();
    getData();
  }

  Future<shoplist> getData() async {
    Response response = await dio.get(url);
    product = shoplist.fromJson(response.data);
    return product!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text('كله بالحب'),
      ),
      body: FutureBuilder<shoplist>(
        future: getData(),
        builder: ((context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: product!.duck!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.network(
                          "${product?.duck[index]?.img}",
                        ),
                        Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.orange, width: 6)),
                            child: Text(
                              '${product?.duck[index]?.title}',
                              style: TextStyle(fontSize: 40),
                            ),
                        ),
                        Text('${product?.duck[index]?.price}' , style: TextStyle(fontSize: 30),)
                      ],
                    );
                  },
                )
              : snapshot.hasError
                  ? Text('oops , something went wrong')
                  : Center(child: CupertinoActivityIndicator());
        }),
      ),
    );
  }
}
