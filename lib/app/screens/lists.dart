// ignore_for_file: use_build_context_synchronously
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cashflow/app/widgets/listcard.dart';
import 'package:cashflow/core/colors.dart';
import 'package:cashflow/database/backend/firestore.dart';
import 'package:cashflow/database/providers/user.dart';
import 'package:cashflow/utils/message.dart';

import 'package:cashflow/database/models/user.dart' as model;
import 'package:provider/provider.dart';

class Lists extends StatefulWidget {
  const Lists({
    Key? key,
  }) : super(key: key);

  @override
  State<Lists> createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  // LOADING
  bool iLoading = false;

  // iFORMS
  final TextEditingController iDescription = TextEditingController();
  final TextEditingController iAge = TextEditingController();
  // 
  final TextEditingController month = TextEditingController();
  final TextEditingController iBalance = TextEditingController();
  final TextEditingController iCashsales = TextEditingController();
  final TextEditingController iFixedreceipts = TextEditingController();
  final TextEditingController eBuymerchandise = TextEditingController();
  final TextEditingController ePaysecuritysocial = TextEditingController();
  final TextEditingController ePayprovider = TextEditingController();
  final TextEditingController ePaytaxes = TextEditingController();
  final TextEditingController ePayservices = TextEditingController();
  final TextEditingController ePayrent = TextEditingController();
  final TextEditingController fReceivedLoan = TextEditingController();
  final TextEditingController fLoanPay = TextEditingController();

  // UPLOADLIST
  void uploadList(
    String uid,
    String username,
  ) async {
    // CHECK SUCCESS
    setState(() {
      iLoading = true;
    });

    // STORE
    try {
      String res = await FirestoreMethods().uploadList(
        iDescription.text,
        iAge.text,
        month.text,
        //
        iBalance.text,
        iCashsales.text,
        iFixedreceipts.text,
        // iTotalincome,
        eBuymerchandise.text,
        ePaysecuritysocial.text,
        ePayprovider.text,
        ePaytaxes.text,
        ePayservices.text,
        ePayrent.text,
        // eTotalexpenses,
        // cashflowEconomic,
        fReceivedLoan.text,
        fLoanPay.text,
        // cashflowFinancial,
        // fTotalfinancing,
        //
        uid,
        username,
      );

      if (res == 'success') {
        // CHECK PROCESS
        setState(() {
          iLoading = false;
          isCheck();
        });
        // MESSAGE
        warningMessage(
          context,
          'Correcto',
        );
      } else {
        warningMessage(context, res);
      }
    } catch (e) {
      setState(() {
        iLoading = false;
      });
      warningMessage(
        context,
        e.toString(),
      );
    }
  }

  // MODAL CHECK
  String check = '';
  void isCheck() {
    Navigator.pop(context);
    setState(() {
      check;
    });
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () => showModalBottomSheet(
              isScrollControlled:true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              context: context,
              builder: (context) {
                return Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => isCheck(),
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: const Text(
                                  'Cancelar',
                                  style: TextStyle(color: blue, fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'Crear lista',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () => uploadList(
                                user.uid,
                                user.username,
                              ),
                              splashColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Container(
                                alignment: Alignment.topRight,
                                child: const Text(
                                  'Crear',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          TextField(
                            controller: iDescription,
                            autofocus: true,
                            decoration: const InputDecoration(
                              hoverColor: Colors.transparent,
                              hintText: 'Nombre de la lista',
                              hintStyle: TextStyle(fontFamily: 'Poppins'),
                              fillColor: Colors.transparent,
                              filled: true,
                              border: InputBorder.none,
                            ),
                          ),
                          TextField(
                            controller: iAge,
                            autofocus: true,
                            decoration: const InputDecoration(
                              hoverColor: Colors.transparent,
                              hintText: 'Año',
                              fillColor: Colors.transparent,
                              filled: true,
                              border: InputBorder.none,
                            ),
                          ),
                          TextField(
                            controller: iBalance,
                            autofocus: true,
                            decoration: const InputDecoration(
                              hoverColor: Colors.transparent,
                              hintText: 'Saldo Inicial',
                              fillColor: Colors.transparent,
                              filled: true,
                              border: InputBorder.none,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
              backgroundColor: modal,
            ),
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: const Icon(
                Icons.add_circle_outline_outlined,
                color: blue,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromRadius(10.0),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Tus Listas',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body:
          // // FIREBASE QUERY API
          StreamBuilder(
        stream: FirebaseFirestore.instance.collection('lists').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              // Stack()
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) => ListCard(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
    );
  }
}
