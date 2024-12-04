import 'Baitapvenhaslide5.dart';
import 'HoaDon.dart';

class cuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<hoaDon> _danhSachHoaDon = [];

  cuaHang(this._tenCuaHang, this._diaChi);
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;
  List<DienThoai> get danhSachDienThoai => _danhSachDienThoai;

  set tenCuaHang(String tenCuaHang) {
    if (tenCuaHang.isNotEmpty) {
      _tenCuaHang = tenCuaHang;
    }
  }

  set diaChi(String diaChi) {
    if (diaChi.isNotEmpty) {
      _diaChi = diaChi;
    }
  }

  void themDienThoai(DienThoai dt) => _danhSachDienThoai.add(dt);
  void findDT(
      {String? maDienThoai, String? tenDienThoai, String? hangSanXuat}) {
    var find = _danhSachDienThoai.where((DienThoai) {
      return (maDienThoai != null && DienThoai.maDienThoai == maDienThoai) ||
          (tenDienThoai != null &&
              DienThoai.tenDienThoai.contains(tenDienThoai)) ||
          (hangSanXuat != null && DienThoai.hangSanXuat.contains(hangSanXuat));
    }).toList();
    if (find.isEmpty) {
      print('khong tim thay');
    } else {
      find.forEach((DienThoai) => print(DienThoai));
    }
  }

  void upDateDT(String maDienThoai, DienThoai newDT) {
    for (var DienThoai in _danhSachDienThoai) {
      if (DienThoai.maDienThoai == maDienThoai) {
        DienThoai.tenDienThoai = newDT.tenDienThoai;
        DienThoai.hangSanXuat = newDT.hangSanXuat;
        DienThoai.giaNhap = newDT.giaNhap;
        DienThoai.giaBan = newDT.giaBan;
        DienThoai.soLuongTonKho = newDT.soLuongTonKho;
        DienThoai.trangThai = newDT.trangThai;
        print('Cap Nhat Thanh Cong Cho Ma DT: $maDienThoai');
      }
    }
    print('Khong Tim Thay Dien Thoai Voi Ma: $maDienThoai');
  }

  void stopKinhDoanhDT(String maDienThoai) {
    for (var DienThoai in _danhSachDienThoai) {
      if (DienThoai.maDienThoai == maDienThoai) {
        DienThoai.trangThai = false;
        print('Dien Thoai $maDienThoai Da Ngung Kinh Doanh');
        return;
      }
    }
    print('Khong Tim Thay Dien Thoai Voi Ma: $maDienThoai');
  }

  void outPutDSDT() {
    for (var DienThoai in _danhSachDienThoai) {
      DienThoai.output();
    }
  }

  void taoHoaDon(
      String maHoaDon,
      DateTime ngayBan,
      DienThoai dienThoai,
      int soLuongMua,
      double giaBanThucTe,
      String tenKhachHang,
      String soDienThoai) {
    // Kiểm tra số lượng trong kho có đủ không
    if (dienThoai.soLuongTonKho >= soLuongMua) {
      // Tạo hóa đơn mới
      hoaDon hoaDonMoi = hoaDon(maHoaDon, ngayBan, dienThoai, soLuongMua,
          giaBanThucTe, tenKhachHang, soDienThoai);

      // Cập nhật số lượng tồn kho
      dienThoai.soLuongTonKho -= soLuongMua;

      // Thêm hóa đơn vào danh sách hóa đơn của cửa hàng
      _danhSachHoaDon.add(hoaDonMoi);

      // In ra thông tin hóa đơn vừa tạo
      print("Hóa đơn đã được tạo thành công:");
      hoaDonMoi.output();
    } else {
      print("Không đủ số lượng trong kho để bán.");
    }
  }

  void findHoaDon({String? maHoaDon, DateTime? ngayBan, String? tenKhachHang}) {
    var find = _danhSachHoaDon.where((hoaDon) {
      return (maHoaDon != null && hoaDon.maHoaDon == maHoaDon) ||
          (ngayBan != null && hoaDon.ngayBan == ngayBan) ||
          (tenKhachHang != null && hoaDon.tenKhachHang.contains(tenKhachHang));
    }).toList();

    if (find.isEmpty) {
      print('Không tìm thấy hóa đơn phù hợp.');
    } else {
      print('Tìm thấy các hóa đơn:');
      find.forEach((hoaDon) => hoaDon.output());
    }
  }

  void hienThiDanhSachHoaDon() {
    if (_danhSachHoaDon.isEmpty) {
      print('Danh sách hóa đơn trống.');
    } else {
      print('------Danh Sách Hóa Đơn------');
      for (var hoaDon in _danhSachHoaDon) {
        hoaDon
            .output(); // Gọi phương thức output của lớp hoaDon để hiển thị thông tin hóa đơn
      }
    }
  }

  double tinhTongDoanhThu(DateTime fromDate, DateTime toDate) {
    double tongDoanhThu = 0.0;

    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.ngayBan.isAfter(fromDate) && hoaDon.ngayBan.isBefore(toDate)) {
        tongDoanhThu += hoaDon
            .tongTien(); // Sử dụng phương thức tongTien() đã có trong lớp hoaDon
      }
    }

    return tongDoanhThu;
  }

 

  double tinhTongLoiNhuan(DateTime fromDate, DateTime toDate) {
    double tongLoiNhuan = 0.0;

    for (var hoaDon in _danhSachHoaDon) {
      if (hoaDon.ngayBan.isAfter(fromDate) && hoaDon.ngayBan.isBefore(toDate)) {
        tongLoiNhuan += hoaDon
            .tinhLoiNhuan(); // Sử dụng phương thức tinhLoiNhuan() đã có trong lớp hoaDon
      }
    }

    return tongLoiNhuan;
  }

  void topBanChay() {
    // Tạo một map để lưu trữ tổng số lượng bán cho từng điện thoại
    Map<String, int> tongSoLuongBan = {};

    // Duyệt qua tất cả các hóa đơn trong danh sách
    for (var hoaDon in _danhSachHoaDon) {
      var dienThoai = hoaDon.dienThoaiDuocBan;

      // Kiểm tra xem điện thoại đã có trong map chưa
      if (tongSoLuongBan.containsKey(dienThoai.maDienThoai)) {
        tongSoLuongBan[dienThoai.maDienThoai] =
            tongSoLuongBan[dienThoai.maDienThoai]! + hoaDon.soLuongMua;
      } else {
        tongSoLuongBan[dienThoai.maDienThoai] = hoaDon.soLuongMua;
      }
    }

    // Sắp xếp các điện thoại theo số lượng bán giảm dần
    var sorted = tongSoLuongBan.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value)); // So sánh theo số lượng bán

    // In ra các điện thoại bán chạy
    print("Top điện thoại bán chạy:");
    for (var entry in sorted) {
      var maDienThoai = entry.key;
      var soLuongBan = entry.value;

      // Tìm thông tin điện thoại từ mã điện thoại (maDienThoai)
      var dienThoai =
          _danhSachDienThoai.firstWhere((dt) => dt.maDienThoai == maDienThoai);

      print(
          "Mã Điện Thoại: ${dienThoai.maDienThoai}, Tên: ${dienThoai.tenDienThoai}, Số Lượng Bán: $soLuongBan");
    }
  }

  void thongKeTonKho() {
    print("------ Thống Kê Tồn Kho ------");

    // Duyệt qua danh sách điện thoại và in thông tin tồn kho của từng điện thoại
    for (var dienThoai in _danhSachDienThoai) {
      print("Mã Điện Thoại: ${dienThoai.maDienThoai}");
      print("Tên Điện Thoại: ${dienThoai.tenDienThoai}");
      print("Hãng Sản Xuất: ${dienThoai.hangSanXuat}");
      print("Số Lượng Tồn Kho: ${dienThoai.soLuongTonKho}");
      print("--------------------------------");
    }
  }
}
