// ignore_for_file: prefer_typing_uninitialized_variables
// FIREBASE DOC STORE
import 'package:cloud_firestore/cloud_firestore.dart';

class List {
  // MODEL LIST
  final String lId;
  final String description;
  final String age;
  // FLUJO CAJA
  final String month;
  final String balance;
  // INCOME
  final String iCashsales;
  final String iFixedreceipts;
  // TOTAL INCOME
  final iTotalincome;
  // EXPENSES
  final String eBuymerchandise;
  final String ePaysecuritysocial;
  final String ePayprovider;
  final String ePaytaxes;
  final String ePayservices;
  final String ePayrent;
  // TOTAL EXPENSES
  final eTotalexpenses;
  // FLUJO DE CAJA ECONOMICO
  final cashflowEconomic;
  // FINACIAMIENTO
  final String fReceivedLoan;
  final String fLoanPay;
  final fTotalfinancing;

  // FLUJO DE CAJA DE FINANCIERO
  final cashflowFinancial;
  final ldate;
  // METHODS USER
  final String uid;
  final String username;

  const List({
    required this.uid,
    required this.username,
    required this.lId,
    required this.description,
    required this.month,
    required this.age,
    required this.balance,
    required this.iCashsales,
    required this.iFixedreceipts,
    required this.iTotalincome,
    required this.eBuymerchandise,
    required this.ePaysecuritysocial,
    required this.ePayprovider,
    required this.ePaytaxes,
    required this.ePayservices,
    required this.ePayrent,
    required this.eTotalexpenses,
    required this.cashflowEconomic,
    required this.fReceivedLoan,
    required this.fLoanPay,
    required this.fTotalfinancing,
    required this.cashflowFinancial,
    required this.ldate,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'username': username,
        'lId': lId,
        'description': description,
        'age': age,
        'month': month,
        'balance': balance,
        'iCashsales': iCashsales,
        'iFixedreceipts': iFixedreceipts,
        'iTotalincome': iTotalincome,
        'eBuymerchandise': eBuymerchandise,
        'ePaysecuritysocial': ePaysecuritysocial,
        'ePayprovider': ePayprovider,
        'ePaytaxes': ePaytaxes,
        'ePayservices': ePayservices,
        'ePayrent': ePayrent,
        'eTotalexpenses': eTotalexpenses,
        'cashflowEconomic': cashflowEconomic,
        'fReceivedLoan': fReceivedLoan,
        'fLoanPay': fLoanPay,
        'fTotalfinancing': fTotalfinancing,
        'cashflowFinancial': cashflowFinancial,
        'ldate': ldate,
      };

  static List fromSnap(DocumentSnapshot e) {
    var jn = e.data() as Map<String, dynamic>;

    return List(
      uid: jn['uid'],
      username: jn['username'],
      lId: jn['lId'],
      description: jn['description'],
      age: jn['age'],
      month: jn['month'],
      balance: jn['balance'],
      iCashsales: jn['iCashsales'],
      iFixedreceipts: jn['iFixedreceipts'],
      iTotalincome: jn['iTotalincome'],
      eBuymerchandise: jn['eBuymerchandise'],
      ePaysecuritysocial: jn['ePaysecuritysocial'],
      ePayprovider: jn['ePayprovider'],
      ePaytaxes: jn['ePaytaxes'],
      ePayservices: jn['ePayservices'],
      ePayrent: jn['ePayrent'],
      eTotalexpenses: jn['eTotalexpenses'],
      cashflowEconomic: jn['cashflowEconomic'],
      fReceivedLoan: jn['fReceivedLoan'],
      fLoanPay: jn['fLoanPay'],
      fTotalfinancing: jn['fTotalfinancing'],
      cashflowFinancial: jn['cashflowFinancial'],
      ldate: jn['ldate'],
    );
  }
}
