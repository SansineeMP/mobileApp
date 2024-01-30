import 'package:another_flushbar/flushbar.dart';
// import 'package:another_flushbar/flushbar_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:watchmovie_app/class/url.dart';
import 'package:watchmovie_app/login.dart';

class PageRegister extends StatefulWidget {
  const PageRegister({Key? key}) : super(key: key);

  @override
  _PageRegisterState createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  final Dio dio = Dio();
  late PageController _pageController;
  late TextEditingController _fNameController;
  late TextEditingController _lNameController;
  late TextEditingController _passwordController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  String _selectedPackage = '';
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _fNameController = TextEditingController();
    _lNameController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fNameController.dispose();
    _lNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPageIndex == 0) {
      if (_fNameController.text.isEmpty ||
          _lNameController.text.isEmpty ||
          _passwordController.text.isEmpty ||
          _emailController.text.isEmpty ||
          _phoneController.text.isEmpty) {
        _showDialog(
            title: 'Input Invalid',
            content: 'Please typing value in text fields');
        return; // Do not proceed to the next page if any field is empty
      }
    } else if (_currentPageIndex == 1) {
      if (_selectedPackage.isEmpty) {
        _showDialog(
          title: 'Select Package',
          content: 'You must select a package before proceeding.',
        );
        return; // Do not proceed to the next page if the package is not selected
      }
    }

    if (_currentPageIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _currentPageIndex++;
      });
    }
  }

  void _showDialog({required String title, required String content}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _previousPage() {
    if (_currentPageIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
      setState(() {
        _currentPageIndex--;
      });
    }
  }

  Future<void> _postValues() async {
    // if(_passwordController.text.isNotEmpty || _emailController.text.isNotEmpty || _phoneController.text.isNotEmpty){
    //   try{
    //     var response = await dio.post("$ipcon/auth/register",
    //         data: {'firstname':_fNameController.text,'surename':_lNameController.text,'pass_word':_passwordController.text,'Email':_emailController.text,'phone':_phoneController});
          
    //     print(response.data);
    //     // await Flushbar(
    //     //   title: 'Register',
    //     //   message: "Saved",
    //     //   flushbarPosition: FlushbarPosition.TOP,
    //     //   duration: const Duration(seconds: 2),
    //     //   margin: EdgeInsets.all(8),
    //     //   borderRadius: BorderRadius.circular(8),
    //     // ).show(context);

    //     if(response.statusCode == 200){
    //       Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(builder: (BuildContext context) => const PageLogin()),
    //       (route) => false);
    //     }
    //   }catch (error) {
    //     // print("Error during login: $error");
    //     showFlushbar(
    //         'An error occurred during Register. Please try again.', Colors.red);
    //     }
    // }

    await Flushbar(
      title: 'Register',
      message: "Saved",
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
    ).show(context);

    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => const PageLogin()),
        (route) => false);
  }


  void showFlushbar(String message, Color color) {
    Flushbar(
      title: 'Register',
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
      backgroundColor: color, // Set background color based on success or error
    ).show(context);
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TestFlix'),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: height * 0.9,
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildStep1(),
                      _buildStep2(),
                      _buildStep3(),
                    ],
                  ),
                ),
                _buildNavigationButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStep1() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Step 1 of 3', style: TextStyle(fontSize: 14)),
          const Text('Register',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextField(
            controller: _fNameController,
            decoration: _buildInputDecoration('First Name'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _lNameController,
            decoration: _buildInputDecoration('Last Name'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            obscureText: true, // Use obscureText for password input
            decoration: _buildInputDecoration('Password'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress, // Use email keyboard type
            decoration: _buildInputDecoration('Email'),
          ),
          const SizedBox(height: 16),
          TextField(
            keyboardType: TextInputType.phone, // Use phone keyboard type
            controller: _phoneController,
            decoration: _buildInputDecoration('Phone'),
          ),
        ],
      ),
    );
  }

  Widget _buildStep2() {
    List<String> packages = ['99/30 วัน', '999/1 ปี', 'ทดลองใช้ 7 วัน'];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Step 2 of 3', style: TextStyle(fontSize: 14)),
          const Text('Select Package',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: packages.length,
              itemBuilder: (context, index) {
                final package = packages[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedPackage = package;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width * 0.2,
                          MediaQuery.of(context).size.height * 0.1),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: package == _selectedPackage
                          ? Theme.of(context).colorScheme.inversePrimary
                          : Theme.of(context).colorScheme.secondary,
                    ),
                    child: Text(
                      package,
                      style: TextStyle(
                        color: package == _selectedPackage
                            ? Theme.of(context).colorScheme.onBackground
                            : Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep3() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Step 3 of 3', style: TextStyle(fontSize: 14)),
          const Text('Payment',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          // Add your payment UI here
          Row(
            children: [
              Image.asset('assets/qrtest.jpg',
              width: 400,
              height: 400,
              fit: BoxFit.cover,)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: _currentPageIndex != 0 ? _previousPage : null,
            child: const Text('Previous'),
          ),
          ElevatedButton(
            onPressed: _currentPageIndex == 2 ? _postValues : _nextPage,
            child: Text(_currentPageIndex == 2 ? 'Finish' : 'Next'),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      // hintStyle: const TextStyle(color: Colors.white),
      filled: true,
      fillColor: Colors.grey[700],
      contentPadding: const EdgeInsets.all(8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}
