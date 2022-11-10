import 'package:flutter_test/flutter_test.dart';
import 'package:learn_flutter_automated_testing_dicoding/provider/done_module_provider.dart';

void main() {
  group('Provider Test', () {
    /// arrange
    /// Arrange adalah bagian di mana kita menyiapkan objek dan pengaturan yang akan diuji.
    var doneModuleProvider = DoneModuleProvider();
    var testModuleName = "Test Module";
    test('should contain new item when module completed', () {
      /// Skenario pengujian ditulis disini
      /// act
      /// Act adalah aksi yang ingin dijalankan. Di sini kita memanggil metode yang akan diuji.
      doneModuleProvider.complete(testModuleName);

      /// assert
      /// Assert adalah di mana kita memverifikasi nilai yang diekspektasikan dengan hasil pemanggilan metode ketika Act.
      var result = doneModuleProvider.doneModuleList.contains(testModuleName);

      expect(result, true);
    });

    test('should not contain item when module removed', () {
      /// act
      doneModuleProvider.deleteModule(testModuleName);
      var result = doneModuleProvider.doneModuleList.contains(testModuleName);

      /// assert
      expect(result, false);
    });
  });
}
