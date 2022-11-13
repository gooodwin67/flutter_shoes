import 'package:flutter/material.dart';
import 'package:flutter_re/constants/constants.dart';
import 'package:flutter_re/providers/provider.dart';
import 'package:provider/provider.dart';

class StartScreenWidget extends StatelessWidget {
  const StartScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<Products>().getProdList();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/start-back.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Live Your\nPerfect',
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Smart, gorgeous & fashionable colection makes you cool',
                style: TextStyle(
                  color: Color.fromARGB(255, 216, 216, 216),
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/main');
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Constants.mainColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    child: const Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
