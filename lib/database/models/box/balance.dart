// ignore_for_file: prefer_typing_uninitialized_variables
// FIREBASE DOC STORE
import 'package:cloud_firestore/cloud_firestore.dart';

class LBalance {
  // MODEL BALANCE
  final String lbId;
  final String balance;
  final String month;
  final lbdate;
  // METHODS LIST
  final String lId;
  final String lname;

  const LBalance({
    // MODEL BALANCE
    required this.lbId,
    required this.balance,
    required this.month,
    required this.lbdate,
    // METHODS LIST
    required this.lId,
    required this.lname,
  });

  Map<String, dynamic> toJson() => {
        // MODEL BALANCE
        'lbId': lbId,
        'balance': balance,
        'month': month,
        'lbdate': lbdate,
        // METHODS LIST
        'lId': lId,
        'lname': lname,
      };

  static LBalance fromSnap(DocumentSnapshot e) {
    var jn = e.data() as Map<String, dynamic>;

    return LBalance(
      // MODEL BALANCE
      lbId: jn['lbId'],
      balance: jn['balance'],
      month: jn['month'],
      lbdate: jn['lbdate'],
      // METHODS LIST
      lId: jn['lId'],
      lname: jn['lname'],
    );
  }
}

/*
  13 - BOXS
    - INGRESOS
      VENTAS EFECTIVO -> cash sales
      COBROS VENTAS ACTIVO FIJO -> fixed assets sales receipts

    - EGRESOS
      COMPRO MERCANCIA -> i buy merchandise
      PAGO SEGURIDAD SOCIAL -> social security payment
      PAGO PROVEERDORES -> payment provider
      PAGO IMPUESTOS -> pay taxes
      PAGO SERVICIOS PUBLICOS -> payment public services
      PAGO ALQUILER -> rent payment
      PAGO MANTENIMIENTO -> maintenance payment

    - FINANCIMIENTO
      PRESTAMO RECIBIDO -> received loan
      PAGO PRESTAMOS -> loan payment

    - FLUJO CAJA ECONOMICO -> economic cash flow
    - FLUJO CAJA FINANCIERO -> financial cash flow
*/