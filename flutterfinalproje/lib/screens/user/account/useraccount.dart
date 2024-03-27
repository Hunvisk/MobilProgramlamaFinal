// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart'; // Intl kütüphanesini ekliyoruz

class Transaction {
  final String title;
  final String subtitle;
  final double amount;
  final DateTime date; // Tarih bilgisi ekliyoruz

  Transaction({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
  });
}

class UserAccount extends StatelessWidget {
  const UserAccount({Key? key});

  @override
  Widget build(BuildContext context) {
    List<Transaction> transactions = [
      Transaction(
        title: 'Abonelik',
        subtitle: 'İşlem Detayı',
        amount: -100,
        date: DateTime.now(), // Şu anki tarih
      ),
      Transaction(
        title: 'Gezgin Çakmağı',
        subtitle: 'İşlem Detayı',
        amount: -50,
        date: DateTime.now(), // Şu anki tarih
      ),
      Transaction(
        title: 'Gezgin Çakmağı',
        subtitle: 'İşlem Detayı',
        amount: -50,
        date: DateTime.now(), // Şu anki tarih
      ),
      Transaction(
        title: 'Gezgin Çakmağı',
        subtitle: 'İşlem Detayı',
        amount: -50,
        date: DateTime.now(), // Şu anki tarih
      ),
      Transaction(
        title: 'Gezgin Çakmağı',
        subtitle: 'İşlem Detayı',
        amount: -50,
        date: DateTime.now(), // Şu anki tarih
      ),
      Transaction(
        title: 'Gezgin Çakmağı',
        subtitle: 'İşlem Detayı',
        amount: -50,
        date: DateTime.now(), // Şu anki tarih
      ),
      Transaction(
        title: 'Gezgin Çakmağı',
        subtitle: 'İşlem Detayı',
        amount: -50,
        date: DateTime.now(), // Şu anki tarih
      ),
      // İşlem yapılan tarihleri istediğiniz gibi ekleyebilirsiniz
    ];

    return Scaffold(
      appBar: MyAppBar(
        title: 'HESABIM',
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {},
              onSubmitted: (value) {},
              decoration: InputDecoration(
                hintText: "Ara...",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(4.0),
                prefixIcon: Icon(Icons.search), // Arama simgesi
              ),
            ),
            Gap(10), // Spacer
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20), // Butonun iç boşluğunu ayarla
                ),
                onPressed: () {
                  // Navigator.pushNamed(context, '/CardsInfo');
                  context.push('/CardsInfo');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "KAYITLI KARTLARIM",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(10), // Spacer
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final transaction = transactions[index];
                  return ListTile(
                    leading: Icon(Icons.payments), // İşlem ikonu
                    title: Text(transaction.title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(transaction.subtitle),
                        Text('Tarih: ${DateFormat('d MMMM y').format(transaction.date)}'), // Dinamik tarih
                      ],
                    ),
                    trailing: Text('${transaction.amount} ₺'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
