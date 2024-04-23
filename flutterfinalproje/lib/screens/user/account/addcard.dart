// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, prefer_const_constructors, prefer_final_fields, deprecated_member_use, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:go_router/go_router.dart';

import '../../../core/responsive.dart';
import '../../../desktopScreens/user/account/desktopAddCard.dart';
import '../../../tabletscreens.dart/user/account/tabletaddcard.dart';

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
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  Screen device = Screen.mobile;

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return;
      case (Screen.tablet):
        return tabletAddCard();
      case (Screen.desktop):
        return desktopAddCard();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return AppBarWithSearchIcon(
          title: " YENİ KART EKLE",
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.tablet):
        return AppBarWithSearchIcon(
          title: "YENİ KART EKLE",
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.desktop):
        return AppBarWithSearchIcon(
          title: " YENİ KART EKLE",
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CreditCardInfo _creditCardInfo = CreditCardInfo(
    cardNumber: '',
    expiryDate: '',
    cardHolderName: '',
    cvvCode: '',
  );

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: drawAppar(),
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
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Theme.of(context)
                        .primaryColor, // Buton rengini temaya uygun olarak ayarlama
                  ),
                  child: Text(
                    'Kartı Kaydet',
                    style: TextStyle(
                      color: Colors
                          .white, // Temaya uygun olarak metin rengini ayarlama
                      fontWeight: FontWeight
                          .bold, // Temaya uygun olarak font weight ayarlama
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
