import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const LockerPage(),
    );
  }
}

class LockerPage extends StatefulWidget {
  const LockerPage({Key? key}) : super(key: key);

  @override
  State<LockerPage> createState() => _LockerPageState();
}

class _LockerPageState extends State<LockerPage> {
  @override
  Widget build(BuildContext context) {
    var number = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.lock,
                size: 80.0,
                color: Colors.purple[200],
              ),
              Text(
                'กรุณาใส่รหัสผ่าน',
                style: TextStyle(color: Colors.pink),
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  for(var i = 0 ;i <number.length; i++)
                   _buildRowButton(number[i]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 50.0,height: 50.0,),
                      _buildButton4('0'),
                      Container(
                        width: 50.0,
                        height: 50.0,
                        child: Icon(
                          Icons.backspace,
                          size: 30.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'ลืมรหัสผ่าน',
                            style: TextStyle(color: Colors.pink),
                          ))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildRowButton(List<String> numberList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton4(numberList[0]),
        _buildButton4(numberList[1]),
        _buildButton4(numberList[2]),
      ],
    );
  }

  Widget _buildButton4(String numberName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 50.0,
        height: 50.0,
        //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.purple, width: 1.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // สีเงา
                offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
                blurRadius: 4.0,
                spreadRadius: 2.0,
              ),
            ]),
        child: TextButton(
            onPressed: () {},
            child: Text(
              '$numberName',
              style: TextStyle(color: Colors.purple[200]),
            )),
      ),
    );
  }
}
