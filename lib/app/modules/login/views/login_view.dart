import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.usernameController,
              decoration: InputDecoration(hintText: "Masukkan Username"),
              validator: (value) {
                //validasi, akan muncul pesan dibawah jika username kosong
                if (value!.isEmpty) {
                  return "Username tidak boleh kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.passwordController,
              decoration: InputDecoration(hintText: "Masukkan Password"),
              validator: (value) {
                //validasi, akan muncul pesan dibawah jika password kosong
                if (value!.isEmpty) {
                  return "Password tidak boleh kosong";
                }
                return null;
              },
            ),
            Obx(() => controller.loadingLogin.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                    //ketika ada perubahan value maka akan otomatis merubah value
                    onPressed: () {
                      controller.login();
                    },
                    child: Text("Login")))
          ],
        ),
      )),
    );
  }
}
