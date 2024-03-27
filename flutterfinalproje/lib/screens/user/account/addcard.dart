// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, prefer_const_constructors, prefer_final_fields, deprecated_member_use, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:go_router/go_router.dart';

class CreditCardInfo {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool iscvvFocused = false;

  CreditCardInfo({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  });
}

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CreditCardInfo _creditCardInfo = CreditCardInfo(
    cardNumber: '',
    expiryDate: '',
    cardHolderName: '',
    cvvCode: '',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: MyAppBar(title: 'Yeni Kart Ekle'),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CreditCardWidget(
                cardNumber: _creditCardInfo.cardNumber,
                expiryDate: _creditCardInfo.expiryDate,
                cardHolderName: _creditCardInfo.cardHolderName,
                cvvCode: _creditCardInfo.cvvCode,
                obscureCardNumber: true,
                obscureCardCvv: true,
                showBackView: false,
                cardBgColor: Theme.of(context).primaryColorLight,
                onCreditCardWidgetChange: (CreditCardBrand) {},
              ),
              SizedBox(height: 20),
              CreditCardForm(
                formKey: _formKey,
                onCreditCardModelChange: _onCreditCardModelChange,
                cardNumber: '',
                expiryDate: '',
                cardHolderName: '',
                cvvCode: '',
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _saveCreditCard,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), backgroundColor: Theme.of(context).primaryColor, // Buton rengini temaya uygun olarak ayarlama
                  ),
                  child: Text(
                    'Kartı Kaydet',
                    style: TextStyle(
                      color: Colors.white, // Temaya uygun olarak metin rengini ayarlama
                      fontWeight: FontWeight.bold, // Temaya uygun olarak font weight ayarlama
                      fontSize: 20, // Metin boyutunu ayarlama
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onCreditCardModelChange(CreditCardModel data) {
    setState(() {
      _creditCardInfo.cardNumber = data.cardNumber;
      _creditCardInfo.expiryDate = data.expiryDate;
      _creditCardInfo.cardHolderName = data.cardHolderName;
      _creditCardInfo.cvvCode = data.cvvCode;
    });
  }

  void _saveCreditCard() {
    if (_formKey.currentState!.validate()) {
      context.push('/CardsInfo');
      print('Kart bilgileri kaydedildi:');
      print('Kart Numarası: ${_creditCardInfo.cardNumber}');
      print('Son Kullanma Tarihi: ${_creditCardInfo.expiryDate}');
      print('Kart Sahibi Adı: ${_creditCardInfo.cardHolderName}');
      print('CVV Kodu: ${_creditCardInfo.cvvCode}');
    }
  }
}
