// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:cashflow/app/screens/lists.dart';
import 'package:cashflow/core/colors.dart';
import 'package:cashflow/database/backend/firestore.dart';
import 'package:cashflow/database/providers/user.dart';
import 'package:cashflow/utils/message.dart';

import 'package:cashflow/database/models/user.dart' as model;
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // LOADING
  bool iLoading = false;

  // iFORMS
  final TextEditingController iDescription = TextEditingController();
  final TextEditingController iAge = TextEditingController();
  // FLUJO CAJA ENERO
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
        eBuymerchandise.text,
        ePaysecuritysocial.text,
        ePayprovider.text,
        ePaytaxes.text,
        ePayservices.text,
        ePayrent.text,
        fReceivedLoan.text,
        fLoanPay.text,
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

  // ROUTER PAGE
  void navigateToLists() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Lists(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    model.User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromRadius(15.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            InkWell(
              onTap: () => showModalBottomSheet(
                isScrollControlled:false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                context: context,
                builder: (context) {
                  return Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: border, width: 1.5),
                          ),
                        ),
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
                                'Complete ',
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
                                hintStyle: TextStyle(fontFamily: 'Dosis'),
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
                              controller: month,
                              autofocus: true,
                              decoration: const InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'Ingrese el mes de Enero',
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
                                hintText: 'Saldo Incial',
                                fillColor: Colors.transparent,
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
                            TextField(
                              controller: iCashsales,
                              autofocus: true,
                              decoration: const InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'Ventas en Efectivo',
                                fillColor: Colors.transparent,
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
                            TextField(
                              controller: iFixedreceipts,
                              autofocus: true,
                              decoration: const InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'Cobros por ventas de activo fijo',
                                fillColor: Colors.transparent,
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
                            TextField(
                              controller: eBuymerchandise,
                              autofocus: true,
                              decoration: const InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'Compra de mercancia',
                                fillColor: Colors.transparent,
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
                            TextField(
                              controller: ePaysecuritysocial,
                              autofocus: true,
                              decoration: const InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'P. Seguridad Social',
                                fillColor: Colors.transparent,
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
                            TextField(
                              controller: ePayprovider,
                              autofocus: true,
                              decoration: const InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'P. Proveedores',
                                fillColor: Colors.transparent,
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
                            TextField(
                              controller: ePaytaxes,
                              autofocus: true,
                              decoration: const InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'P. Impuestos',
                                fillColor: Colors.transparent,
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
                            TextField(
                              controller: ePayservices,
                              autofocus: true,
                              decoration: const InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'P. Servicios Publicos',
                                fillColor: Colors.transparent,
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
                            TextField(
                              controller: ePayrent,
                              autofocus: true,
                              decoration: const InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'P. Alquiler',
                                fillColor: Colors.transparent,
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
                            TextField(
                              controller: fReceivedLoan,
                              autofocus: true,
                              decoration: const InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'Prestamo Recibido',
                                fillColor: Colors.transparent,
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
                            TextField(
                              controller: fLoanPay,
                              autofocus: true,
                              decoration: const InputDecoration(
                                hoverColor: Colors.transparent,
                                hintText: 'Pago Prestamos',
                                fillColor: Colors.transparent,
                                filled: true,
                                border: InputBorder.none,
                              ),
                            ),
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
              child: const Icon(
                Icons.add_circle_outline_outlined,
                color: blue,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  user.business,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: border, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                color: card,
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: navigateToLists, // USER METHODS
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: border,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Card(
                              color: green,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 3),
                                child: const Icon(
                                  IconData(0xe760, fontFamily: 'MaterialIcons'),
                                  size: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Expanded(
                              child: Expanded(child: Text('Tus Listas')),
                            ),
                            const Icon(
                              Icons.chevron_right_sharp,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {}, // USER METHODS
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: border,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Card(
                              color: blue,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 3),
                                child: const Icon(
                                  IconData(0xe760, fontFamily: 'MaterialIcons'),
                                  size: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Expanded(
                              child: Expanded(child: Text('Tus Favoritos')),
                            ),
                            const Icon(
                              Icons.chevron_right_sharp,
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {}, // USER METHODS
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        child: Row(
                          children: [
                            Card(
                              color: purple,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 3),
                                child: const Icon(
                                  IconData(0xe760, fontFamily: 'MaterialIcons'),
                                  size: 15,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Expanded(
                              child: Expanded(
                                  child: Text('Solicitudes de cambios')),
                            ),
                            const Icon(
                              Icons.chevron_right_sharp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
