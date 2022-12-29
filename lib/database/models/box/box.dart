// ignore_for_file: prefer_typing_uninitialized_variables
// FIRESTORE
import 'package:cloud_firestore/cloud_firestore.dart';

class LBBoxs {
  // MODEL BOXS
  final String lbbId;
  final lbbdate;
  // INCOME
  final int iCashsales;
  final int iFixedreceipts;
  // TOTAL INCOME
  final int iTotalincome;

  // EXPENSES
  final int eBuymerchandise;
  final int ePaysecuritysocial;
  final int ePayprovider;
  final int ePaytaxes;
  final int ePayservices;
  final int ePayrent;
  // TOTAL EXPRENSES
  final int eTotalexpenses;

  // FLUJO DE CAJA ECONOMICO
  final int cashflowEconomic;

  // FINANCING
  final int fReceivedLoan;
  final int fLoanPay;

  // FLUJO DE CAJA DE FINANCIERO
  final int cashflowFinancial;

  // METHODS LBALANCE
  final String lbId;
  final int balance;

  const LBBoxs({
    // PRIMARY
    required this.lbbId,
    required this.lbbdate,

    // INCOME
    required this.iCashsales,
    required this.iFixedreceipts,
    // TOTAL INCOME
    required this.iTotalincome,

    // EXPENSES
    required this.eBuymerchandise,
    required this.ePaysecuritysocial,
    required this.ePayprovider,
    required this.ePaytaxes,
    required this.ePayservices,
    required this.ePayrent,
    // TOTAL EXPENSES
    required this.eTotalexpenses,

    // FLUJO DE CAJA ECONOMICO
    required this.cashflowEconomic,

    // FINANCING
    required this.fReceivedLoan,
    required this.fLoanPay,

    // FLUJO DE CAJA DE FINANCIERO
    required this.cashflowFinancial,

    // METHODS LBALANCE
    required this.lbId,
    required this.balance,
  });

  Map<String, dynamic> toJson() => {
        // PRIMARY
        'lbbId': lbbId,
        'lbbdate': lbbdate,

        // INCOME
        'iCashsales': iCashsales,
        'iFixedreceipts': iFixedreceipts,
        // TOTAL INCOME -> TOTAL INGRESOS -> iCashsales+iFixedreceipts
        'iTotalincome': iTotalincome,

        // EXPENSES
        'eBuymerchandise': eBuymerchandise,
        'ePaysecuritysocial': ePaysecuritysocial,
        'ePayprovider': ePayprovider,
        'ePaytaxes': ePaytaxes,
        'ePayservices': ePayservices,
        'ePayrent': ePayrent,
        // TOTAL EXPENSES -> TOTAL EGRESOS -> eBuymerchandise+ePaysecuritysocial+ePayprovider+ePaytaxes+ePayservices+ePayrent
        'eTotalexpenses': eTotalexpenses,

        // FLUJO DE CAJA ECONOMICO
        'cashflowEconomic': cashflowEconomic,

        // FINANCING
        'fReceivedLoan': fReceivedLoan,
        'fLoanPay': fLoanPay,

        // FLUJO DE CAJA DE FINANCIERO
        'cashflowFinancial': cashflowFinancial,

        // METHODS LBALANCE
        'lbId': lbId,
        'balance': balance,
      };

  static LBBoxs fromSnap(DocumentSnapshot e) {
    var jn = e.data() as Map<String, dynamic>;
    return LBBoxs(
      lbbId: jn['lbbId'],
      lbbdate: jn['lbbdate'],
      iCashsales: jn['iCashsales'],
      iFixedreceipts: jn['iFixedreceipts'],
      // TOTAL INCOME
      iTotalincome: jn['iTotalincome'],
      //
      eBuymerchandise: jn['eBuymerchandise'],
      ePaysecuritysocial: jn['ePaysecuritysocial'],
      ePayprovider: jn['ePayprovider'],
      ePaytaxes: jn['ePaytaxes'],
      ePayservices: jn['ePayservices'],
      ePayrent: jn['ePayrent'],
      // TOTAL EXPENSES
      eTotalexpenses: jn['eTotalexpenses'],
      // FLUJO DE CAJA ECONOMICO
      cashflowEconomic: jn['cashflowEconomic'],

      // FLUJO DE CAJA DE FINANCIERO
      cashflowFinancial: jn['cashflowFinancial'],
      // FINANCING
      fReceivedLoan: jn['fReceivedLoan'],
      fLoanPay: jn['fLoanPay'],
      lbId: jn['lbId'],
      balance: jn['balance'],
    );
  }
}
