// ignore_for_file: prefer_const_constructors,

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicOrderScreen extends StatefulWidget {
  const MusicOrderScreen({super.key, required this.order});
  final String order;
  
  @override
  State<MusicOrderScreen> createState() => _MusicOrderScreenState();
}

class _MusicOrderScreenState extends State<MusicOrderScreen> {
  String? selectedPaymentMethod;
  final List<String> existingPaymentMethods = ['Visa **** 1234', 'MasterCard **** 5678'];
  final TextEditingController newPaymentController = TextEditingController();

  @override
  void dispose() {
    newPaymentController.dispose();
    super.dispose();
  }

  void _processOrder() async{
    await showDialog(context: context, builder:(context) {
      return AlertDialog(
        title: Text('Order Processed'),
        content: Text('Thank you for your order!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              },
              child: Text('OK'),
              ),
              ],
              );
    },);
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Заказ ${widget.order}', style: GoogleFonts.lobster(fontSize: 24)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Вы заказали: ${widget.order}',
              style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Выберите способ оплаты:',
              style: GoogleFonts.roboto(fontSize: 18),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              hint: Text('Выберите существующий метод оплаты'),
              value: selectedPaymentMethod,
              items: existingPaymentMethods.map((method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Или добавьте новый метод оплаты:',
              style: GoogleFonts.roboto(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextField(
              controller: newPaymentController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Введите реквизиты',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _processOrder,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Подтвердить заказ', style: GoogleFonts.roboto(fontSize: 16)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Вернуться на главную', style: GoogleFonts.roboto(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
