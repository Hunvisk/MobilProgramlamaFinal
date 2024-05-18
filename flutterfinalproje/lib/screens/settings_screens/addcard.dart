// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/localizations.dart';
import '../../core/responsive.dart';
import '../../core/storage.dart';
import '../../desktopScreens/user/account/desktopAddCard.dart';
import '../../models/addcard_card.dart';
import '../../tabletscreens.dart/user/account/tabletaddcard.dart';
import '../../widgets/appbarwithsearchicon.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  List<AddCardPayment> cards = [];
  String cardNo = "";
  TextEditingController cardHolderCnt = TextEditingController();
  TextEditingController cvv2Cnt = TextEditingController();
  TextEditingController expMonthCnt = TextEditingController();
  TextEditingController expYearCnt = TextEditingController();
  TextEditingController titleCnt = TextEditingController();
  bool remember = false;
  String type = "";

  loadCards() async {
    final storage = Storage();
    var cards = await storage.loadCards();
    setState(() {
      this.cards = cards;
    });
  }

  saveCard() async {
    // kontroller sağlanacak
    final AddCardPayment newCard = AddCardPayment(
        title: titleCnt.text,
        cardHolder: cardHolderCnt.text,
        cardNo: cardNo,
        cvv2: cvv2Cnt.text,
        expMonth: int.parse(expMonthCnt.text),
        expYear: int.parse(expYearCnt.text));

    List<AddCardPayment> yeniKartListesi = [];

    yeniKartListesi.addAll(cards);

    yeniKartListesi.add(newCard);

    if (remember) {
      final storage = Storage();
      await storage.saveCards(yeniKartListesi);
    }
    setState(() {
      cards = yeniKartListesi;
    });

    context.pop();

    setState(() {
      remember = false;
      cardNo = "";
      cardHolderCnt.text = "";
      expMonthCnt.text = "";
      expYearCnt.text = "";
      cvv2Cnt.text = "";
    });
  }

  @override
  void initState() {
    super.initState();
    loadCards();
  }

  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  Screen device = Screen.mobile;

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return;
      case (Screen.tablet):
        return const TabletAddCard();
      case (Screen.desktop):
        return const desktopAddCard();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("add_new_card"),
          icon: const Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.tablet):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("add_new_card"),
          icon: const Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.desktop):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("add_new_card"),
          icon: const Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
    }
  }

  showAddCard() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text(
                AppLocalizations.of(context).getTranslate("add_new_card"),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              content: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context).getTranslate("card_title"),
                        labelText: AppLocalizations.of(context).getTranslate("card_title"),
                        alignLabelWithHint: true),
                    controller: titleCnt,
                  ),
                  const Gap(10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context).getTranslate("name_surname"),
                      labelText: AppLocalizations.of(context).getTranslate("name_surname"),
                    ),
                    controller: cardHolderCnt,
                  ),
                  const Gap(10),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context).getTranslate("card_number"),
                      labelText: AppLocalizations.of(context).getTranslate("card_number"),
                    ),
                    onChanged: (value) {
                      setState(() {});
                      cardNo = value;
                      if (value.startsWith("4")) {
                        setState(() {
                          type = "visa";
                        });
                      } else if (value.startsWith("5")) {
                        setState(() {
                          type = "master";
                        });
                      } else if (value.startsWith("9") ||
                          value.startsWith("6") ||
                          value.startsWith("3")) {
                        setState(() {
                          type = "troy";
                        });
                      } else {
                        type = "visa";
                      }
                    },
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                      _CardNumberInputFormatter(),
                    ],
                    maxLength: 19,
                  ),
                  const Gap(15),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context).getTranslate("cvv"),
                            labelText: AppLocalizations.of(context).getTranslate("cvv"),
                          ),
                          obscureText: true,
                          controller: cvv2Cnt,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          maxLength: 3,
                         onChanged: (value) {
                          if (value.length == 3) {
                          FocusScope.of(context).nextFocus();
                        }
                        },
                        ),
                      ),
                      const Gap(5),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context).getTranslate("end_month"),
                            labelText: AppLocalizations.of(context).getTranslate("end_month"),
                          ),
                          controller: expMonthCnt,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          maxLength: 2,
                          onChanged: (value) {
                          if (value.length == 2) {
                          FocusScope.of(context).nextFocus();
                        }
                        },
                        ),
                      ),
                      const Gap(5),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)
                                .getTranslate("end_year"),
                            labelText: AppLocalizations.of(context)
                                .getTranslate("end_year"),
                          ),
                          controller: expYearCnt,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          maxLength: 4,
                        ),
                      ),
                      const Gap(9),
                    ],
                  ),
                  SwitchListTile(
                      title: Text(
                          AppLocalizations.of(context).getTranslate("saved")),
                          value: remember,
                          onChanged: (value) => setState(() {
                            remember = value;
                          }))
                ],
              ),
              actions: [
                if (type.isNotEmpty)
                  Image.asset("assets/icons/${type}_card.png", height: 40),
                OutlinedButton(
                  onPressed: saveCard,
                  child: Text(
                      AppLocalizations.of(context).getTranslate("confirm")),
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 19.0, top: 20),
              child: IconButton(
                  onPressed: showAddCard, icon: const Icon(Icons.add)),
            ),
          ],
          title: Center(
              child: Text(
            AppLocalizations.of(context).getTranslate("add_card"),
            style: Theme.of(context).textTheme.headlineSmall,
          )),
        ),
        body: SafeArea(
          child: SizedBox.expand(
            child: cards.isEmpty
                ? Center(
                    child: Text(
                    AppLocalizations.of(context).getTranslate("not_found_card"),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ))
                : ListView.builder(
                    itemCount: cards.length,
                    itemBuilder: (context, index) => AspectRatio(
                          aspectRatio: 1.586,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context).secondaryHeaderColor,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: cards[index].cardNo.startsWith("4")
                                      ? Image.asset(
                                          "assets/icons/visa_card.png",
                                          height: 60,
                                        )
                                      : cards[index].cardNo.startsWith("5")
                                          ? Image.asset(
                                              "assets/icons/master_card.png",
                                              height: 60,
                                            )
                                          : cards[index].cardNo.startsWith("6")
                                              ? Image.asset(
                                                  "assets/icons/troy_card.png",
                                                  height: 60,
                                                )
                                              : const SizedBox(),
                                ),
                                Positioned(
                                    top: 20,
                                    left: 20,
                                    child: Text(cards[index].title)),
                                Positioned(
                                    left: 20,
                                    top: 50,
                                    child: Text(cards[index].cardNo)),
                                Positioned(
                                    left: 20,
                                    bottom: 20,
                                    child: Text(cards[index].cardHolder)),
                                Positioned(
                                  right: 20,
                                  bottom: 20,
                                  child: Text("${cards[index].expMonth}/${cards[index].expYear}"),
                                ),
                              ],
                            ),
                          ),
                        )),
          ),
        ),
      ),
    );
  }
}

class _CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = newValue.text.replaceAll(RegExp(r'\s'), '');
    if (formattedText.length > 4) {
      formattedText = '${formattedText.substring(0, 4)} ${formattedText.substring(4, formattedText.length)}';
    }
    if (formattedText.length > 9) {
      formattedText = '${formattedText.substring(0, 9)} ${formattedText.substring(9, formattedText.length)}';
    }
    if (formattedText.length > 14) {
      formattedText = '${formattedText.substring(0, 14)} ${formattedText.substring(14, formattedText.length)}';
    }
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
