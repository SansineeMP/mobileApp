import 'package:flutter/material.dart';
import 'package:watchmovie_app/register.dart';

class PagePackage extends StatefulWidget {
  const PagePackage({super.key});

  @override
  State<PagePackage> createState() => _PagePackageState();
}

class _PagePackageState extends State<PagePackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 180, 27, 27),
        leading:
        IconButton( onPressed: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => PageRegister())
        );
        },
        icon: const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text ("ขั้นตอนที่ 2 จาก 3", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),),
                            const SizedBox(height: 10,),
                            Text("เลือกแพ็คเกจ",style: TextStyle(
                              fontSize: 25,
                              color: Colors.grey[700],
                            ),),
                            const SizedBox(height: 10,)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}