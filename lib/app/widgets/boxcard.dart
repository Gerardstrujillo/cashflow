// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cashflow/core/colors.dart';
import 'package:cashflow/utils/message.dart';

class BalanceCard extends StatefulWidget {
  final snap;
  const BalanceCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }

  fetchCommentLen() async {
    try {
      QuerySnapshot snap = await FirebaseFirestore.instance
          .collection('balances')
          .doc(widget.snap['lbId'])
          .collection('boxs')
          .get();
    } catch (err) {
      warningMessage(
        context,
        err.toString(),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.snap['lbId'].toString() == widget.snap['lbId']
        ? SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: border, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: card,
                      child: InkWell(
                        onTap: () {}, // USER METHODS
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        widget.snap['month'].toString(),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        widget.snap['balance'].toString(),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.chevron_right_sharp,
                              )
                            ],
                          ),
                        ),
                      )
                      // : const Center()
                      ),
                ],
              ),
            ),
          )
        : const Center();
  }
}
