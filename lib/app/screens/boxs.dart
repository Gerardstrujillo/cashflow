// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cashflow/app/widgets/boxcard.dart';
import 'package:cashflow/core/colors.dart';
import 'package:cashflow/database/backend/firestore.dart';
import 'package:cashflow/utils/message.dart';

class Boxs extends StatefulWidget {
  final lId;
  final ldescription;
  final lage;
  final lbalance;
  const Boxs({
    Key? key,
    required this.lId,
    required this.ldescription,
    required this.lage,
    required this.lbalance,
  }) : super(key: key);

  @override
  State<Boxs> createState() => _BoxsState();
}

class _BoxsState extends State<Boxs> {
  // LOADING
  bool iLoading = false;

  // iFORMS
  final TextEditingController iBalance = TextEditingController();
  final TextEditingController iMonth = TextEditingController();

  // UPLOADLIST
  void uploadBalance() async {
    // CHECK SUCCESS
    setState(() {
      iLoading = true;
    });

    // STORE
    try {
      String res = await FirestoreMethods().uploadBox(
        iBalance.text,
        iMonth.text,
        widget.lId,
        widget.ldescription,
        widget.lage,
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            InkWell(
              onTap: () => showModalBottomSheet(
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
                                    style: TextStyle(color: blue, fontSize: 14),
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Text(
                                '',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () => uploadBalance(),
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  alignment: Alignment.topRight,
                                  child: const Text(
                                    'Crear',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(fontSize: 14),
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
                              controller: iMonth,
                              autofocus: true,
                              decoration: const InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'Ingrese el mes correspondiente',
                                hintStyle: TextStyle(fontFamily: 'Poppins'),
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
                                hintText: 'Saldo inicial',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.ldescription,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('lists')
              .doc(widget.lId)
              .collection('balances')
              .snapshots(),
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
              itemBuilder: (ctx, index) => BalanceCard(
                snap: snapshot.data!.docs[index].data(),
              ),
            );
          },
        ));
  }
}
