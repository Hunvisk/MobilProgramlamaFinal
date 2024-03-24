// ignore_for_file: sort_child_properties_last, deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const MyAppBar(title: "Şifremi Unuttum"),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Şifreni mi Unuttun?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              const Text(
                'Olur Böyle Şeyler 😔 Yeni Şifre Oluşturmak İçin E-posta Adresinizi Girebilirsiniz.  ',
                style: TextStyle(
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
              const Gap(10),
              SizedBox(
                height: 40, // TextField'ın yüksekliğini ayarını yaptım 
                child: TextField(
                  style: const  TextStyle(fontSize: 14), // Metin boyutunu küçültmek için bu satır eklendi
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
                    filled: false,
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.only(
                      top: 10.0, 
                      bottom: 10.0, 
                      left: 10.0, 
                      right: 5.0
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    labelStyle: const TextStyle(
                      color: Color.fromRGBO(155, 154, 154, 1),
                    ),
                  ),
                  cursorColor: Colors.black, // Yazma imleci rengi
                ),
              ),
              const Gap(10),
              ElevatedButton(
                onPressed: () {
                  context.go('/');
                },
                child:  Text(
                  'Şifremi Sıfırla ',
                  style: Theme.of(context).textTheme.button!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor, // Tema rengi, // Buton rengi
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
