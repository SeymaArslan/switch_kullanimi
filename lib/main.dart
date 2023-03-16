import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // switch kullanılırken true false değerini kontrol edebileceğimiz bir bool değişken tanımlaması istiyor
  bool switchKontrol = false; // aslında false olarak açılacak

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Switch(
                value: switchKontrol,
                activeTrackColor: Colors.lightGreen,  // true durumundaki çubuk kısmının rengi
                activeColor: Colors.green, // switch joystick inin rengi true olduğunda
                inactiveTrackColor: Colors.grey, // false durumu bar rengi
                inactiveThumbColor: Colors.black, // false durumu jstick rengi
                onChanged: (veri){    // switch durumunun değiştiğini öğrendiğimiz yer true mu oldu false mu
                  // her değişimde "veri" bize true false değerini aktarmış olacak
                  // biz de bu değeri switchKontrol e aktaracağız ve o da value yu değiştirecek, böylelikle switchin konumunu değişikliğini görebileceğiz
                  setState(() {
                    switchKontrol = veri; //  switchKontrol e swichten aldığımız "veri" yi aktaracağız, bu satır olmazsa switch hareketi değişmiyor
                  });
                  print("Switch: $veri");
                },
            ),

            // butonla switchi kontrolünü görme
            ElevatedButton(
                onPressed: (){
                  print("Switch durum: $switchKontrol");
                },
                child: Text("Göster"),
            ),

          ],
        ),
      ),
    );
  }
}
