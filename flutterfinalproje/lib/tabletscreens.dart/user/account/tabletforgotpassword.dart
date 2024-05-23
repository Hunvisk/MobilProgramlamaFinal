
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class TabletForgotPassword extends StatefulWidget {
  const TabletForgotPassword({Key? key}) : super(key: key);

  @override
  State<TabletForgotPassword> createState() => _TabletForgotPasswordState();
}
class _TabletForgotPasswordState extends State<TabletForgotPassword> {
   

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: const TabletpasswordSayfa(),
      ),
    );
  }
}

class TabletpasswordSayfa extends StatelessWidget {
  const TabletpasswordSayfa({
    super.key,
  });

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Şifre Değiştirme Talebi'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Şifre değiştirme talebiniz alındı.'),
              SizedBox(height: 8),
              Text('Mail hesabınızı kontrol ediniz.'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                context.go('/Login');
              },
              child: const Text('Giriş Yap'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Şifreni mi Unuttun?',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(10),
          const Text(
            'Yeni Şifre Oluşturmak İçin E-posta Adresinizi Girebilirsiniz.  ',
            style: TextStyle(
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(10),
          Center(
            child: SizedBox(
              height: 45,
              width: 600, // TextField'ın yüksekliğini ayarını yaptım 
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
          ),
          const Gap(10),
          ElevatedButton(
            onPressed: () {
              _showSuccessDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor, // Tema rengi, // Buton rengi
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child:  Text(
              'Şifremi Sıfırla ',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}