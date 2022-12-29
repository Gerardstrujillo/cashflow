// FIREBASE DOC STORE
import 'package:cloud_firestore/cloud_firestore.dart';

// MODEL LIST
import 'package:cashflow/database/models/list.dart';

// PLUGGIN UUID
import 'package:uuid/uuid.dart';

class FirestoreMethods { 
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // 1.1 LIST
  Future<String> uploadList(
    // MODEL LIST
    String description,
    String age,
    String month,
    // FLUJO CAJA
    String balance,
      // INCOME
      String iCashsales,
      String iFixedreceipts,
        // TOTAL INCOME
        // String iTotalincome,
      // EXPENSES
      String eBuymerchandise,
      String ePaysecuritysocial,
      String ePayprovider,
      String ePaytaxes,
      String ePayservices,
      String ePayrent,
        // TOTAL EXPENSES
        // String eTotalexpenses,
      // FLUJO DE CAJA ECONOMICO
      // String cashflowEconomic,
      // FINACIAMIENTO
      String fReceivedLoan,
      String fLoanPay,
      // String fTotalfinancing,
      // FLUJO DE CAJA DE FINANCIERO
      // String cashflowFinancial,
    // METHODS USER
    String uid,
    String username,
  ) async {
    // TEST
    String res = "¡Oh no! Ocurrió algún error";

    // CONTROLLER
    try {
      // UUID PLUGIN
      String lId = const Uuid().v1();

      // 
      dynamic a = balance;
      dynamic ia = iCashsales;
      dynamic ib = iFixedreceipts;
      dynamic ec = eBuymerchandise;
      dynamic ed = ePaysecuritysocial;
      dynamic ee = ePayprovider;
      dynamic ei = ePaytaxes;
      dynamic ef = ePayservices;
      dynamic eg = ePayrent;
      dynamic fh = fReceivedLoan;
      dynamic fj = fLoanPay;

      a = num.parse(a);
      ia = num.parse(ia);
      ib = num.parse(ib);
      ec = num.parse(ec);
      ed = num.parse(ed);
      ee = num.parse(ee);
      ei = num.parse(ei);
      ef = num.parse(ef);
      eg = num.parse(eg);
      fh = num.parse(fh);
      fj = num.parse(fj);

      // TOTAL
      dynamic itt = ia+ib;
      dynamic ett = ec+ed+ee+ei+ef+eg;
      dynamic cfe = (itt+a)-ett;
      dynamic ftf = fh+fj;
      dynamic cff = cfe-ftf;

      // JSON STORE
      List list = List(
        // MODEL LIST
        lId: lId,
        description: description,
        age: age,
        // FLUJO CAJA
        month: month,
        balance: balance,
        // INCOME
        iCashsales: iCashsales,
        iFixedreceipts: iFixedreceipts,
        // TOTAL INCOME -> TOTAL INGRESOS -> iCashsales+iFixedreceipts
        iTotalincome: itt,
        // EXPENSES
        eBuymerchandise: eBuymerchandise,
        ePaysecuritysocial: ePaysecuritysocial,
        ePayprovider: ePayprovider,
        ePaytaxes: ePaytaxes,
        ePayservices: ePayservices,
        ePayrent: ePayrent,
        // TOTAL EXPENSES -> TOTAL EGRESOS -> eBuymerchandise+ePaysecuritysocial+ePayprovider+ePaytaxes+ePayservices+ePayrent
        eTotalexpenses: ett,

        // FLUJO DE CAJA ECONOMICO
        cashflowEconomic: cfe,

        // FINANCING
        fReceivedLoan: fReceivedLoan,
        fLoanPay: fLoanPay,
        fTotalfinancing:ftf,

        // FLUJO DE CAJA DE FINANCIERO
        cashflowFinancial: cff,
        // DATE
        ldate: DateTime.now(),
        // METHODS USER
        uid: uid,
        username: username,
      );

      // STORE
      firestore.collection('lists').doc(lId).set(list.toJson());

      // CHECK
      res = 'success';
    } catch (err) {
      // ERROR LOG
      res = err.toString();
    }

    // MESSAGE TEST
    return res;
  }

  // 1.1.1 LIST({ BALANCE }) - COLLECTION
  Future<String> uploadBox(
    // MODEL BALANCE
    String balance,
    String month,
    // METHODS LIST
    String lId,
    String ldescription,
    String lage,
  ) async {
    // TEST
    String res = "Ocurrió algún error";

    // CONTROLLER
    try {
      if (balance.isNotEmpty || month.isNotEmpty) {
        // UUID
        String lbId = const Uuid().v1();

        // STORE
        firestore
            .collection('lists')
            .doc(lId)
            .collection('balances')
            .doc(lbId)
            .set({
          'lbId': lbId,
          'balance': balance,
          'month': month,
          'lbdate': DateTime.now(),
          'lId': lId,
          'ldescription': ldescription,
          'lage': lage,
        });
        // SUCCESS
        res = 'success';
      } else {
        res = 'Complete los campos';
      }
    } catch (err) {
      // ERROR LOG
      res = err.toString();
    }

    // MESSAGE TEST
    return res;
  }

  // 1.1.2 BALANCE ({ BOX }) - COLLECTION

}
