import 'Baitapvenhaslide5.dart';  // Import các lớp cần thiết
import 'hoaDon.dart';
import 'cuaHang.dart';

void main() {
  // Tạo cửa hàng
  cuaHang myStore = cuaHang("Cửa hàng XYZ", "123 Đường ABC");

  // Thêm điện thoại vào cửa hàng
  myStore.themDienThoai(DienThoai("DT001", "iPhone 14", "Apple", 20000, 25000, 100, true));
  myStore.themDienThoai(DienThoai("DT002", "Samsung Galaxy S21", "Samsung", 15000, 18000, 50, true));
  myStore.themDienThoai(DienThoai("DT003", "Xiaomi Mi 12", "Xiaomi", 12000, 15000, 200, true));

  print("Danh sách điện thoại hiện tại:");
  myStore.outPutDSDT();

  // Thêm điện thoại mới vào cửa hàng
  print("\nThêm điện thoại mới:");
  myStore.themDienThoai(DienThoai("DT004", "Oppo F19", "Oppo", 10000, 13000, 75, true));
  myStore.outPutDSDT();

  // Cập nhật thông tin điện thoại
  print("\nCập nhật thông tin điện thoại DT001:");
  DienThoai newPhone = DienThoai("DT001", "iPhone 14 Pro", "Apple", 22000, 27000, 90, true);
  myStore.upDateDT("DT001", newPhone);
  myStore.outPutDSDT();


  // Doanh thu theo thời gian
  print("\nDoanh thu theo thời gian:");
  DateTime fromDate = DateTime(2024, 11, 1);
  DateTime toDate = DateTime(2024, 12, 1);
  double doanhThu = myStore.tinhTongDoanhThu(fromDate, toDate);
  print("Doanh thu từ $fromDate đến $toDate: $doanhThu");

  // Lợi nhuận theo thời gian
  print("\nLợi nhuận theo thời gian:");
  double loiNhuan = myStore.tinhTongLoiNhuan(fromDate, toDate);
  print("Lợi nhuận từ $fromDate đến $toDate: $loiNhuan");

  // Top điện thoại bán chạy
  print("\nTop điện thoại bán chạy:");
  myStore.topBanChay(); // Đảm bảo gọi đúng tên phương thức

  // Báo cáo tồn kho
  print("\nBáo cáo tồn kho:");
  myStore.thongKeTonKho();
}
