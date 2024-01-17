import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:petugas_perpustakaan_app/app/data/constant/endpoint.dart';
import 'package:petugas_perpustakaan_app/app/data/model/response_book.dart';
import 'package:petugas_perpustakaan_app/app/data/provider/api_provider.dart';

class BookController extends GetxController with StateMixin<List<DataBook>> {
  //TODO: Implement BookController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> getData() async {
    //kalau pke void ada nilai baliknya, jadi ngga perlu return
    // getData(){ kalo ngga pakai void type nya dinamic, di kasih return boleh, tdk juga boleh
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint
          .book); //fungsi await, baris code di bawah menunggu proses await ini selesai. jika tdk pakai, maka codingan di bawah ini dieksekusi barengan
      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);
        if (responseBook.data!.isEmpty) {
          //apakah data dari response diatas kosong?
          //jika kosong kita change status nya ke empty
          change(null, status: RxStatus.empty());
        } else {
          // jika ada kita ubah statusnya menjadi success
          change(responseBook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      //catch di try artinya apakah errornya ada di dio?
      //jika iya data dibawah ini akan dieksekusi
      change(null, status: RxStatus.error("Error ${e.message}"));
    } catch (e) {
      //jika tidak, maka perintah di bawah ini yg akan dieksekusi
      change(null, status: RxStatus.error("Error $e"));
    }
  }
}
