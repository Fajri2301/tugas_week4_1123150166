import 'package:flutter/material.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Masukkan kode OTP yang telah dikirimkan ke email Anda',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildOTPTextField(),
                _buildOTPTextField(),
                _buildOTPTextField(),
                _buildOTPTextField(),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Verifikasi'),
            ),
            const SizedBox(height: 16.0),
            const Text('Kirim ulang dalam 00:30'),
          ],
        ),
      ),
    );
  }

  Widget _buildOTPTextField() {
    return SizedBox(
      width: 50.0,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
