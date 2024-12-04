import 'Baitapvenhaslide5.dart';

class hoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoaiDuocBan;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoai;

  hoaDon(
    this._maHoaDon,
    this._ngayBan,
    this._dienThoaiDuocBan,
    this._soLuongMua,
    this._giaBanThucTe,
    this._tenKhachHang,
    this._soDienThoai
  );

  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoaiDuocBan => _dienThoaiDuocBan;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get soDienThoai => _soDienThoai;

  set maHoaDon(String maHoaDon) {
    if (maHoaDon.isNotEmpty) {
      _maHoaDon = maHoaDon;
    }
  }

  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isAfter(DateTime.now())) {
      throw ArgumentError('Ngày bán không được sau ngày hiện tại');
    }
    _ngayBan = ngayBan;
  }
  
  set soLuongMua(int soLuongMua){
    if(soLuongMua > 0 && soLuongMua <= dienThoaiDuocBan.soLuongTonKho){
   _soLuongMua = soLuongMua;     
  }
}
    set giaBanThucTe(double giaBanThucTe){
        if(giaBanThucTe>0){
            _giaBanThucTe = giaBanThucTe;
        }
    }
    set tenKhachHang(String tenKhachHang){
        if (tenKhachHang.isNotEmpty){
            _tenKhachHang = tenKhachHang;
        }
    }
    set soDienThoai(String soDienThoai){
        if (soDienThoai.isNotEmpty){
            _soDienThoai = soDienThoai;
        }
    }
    double tongTien(){
        return _giaBanThucTe*_soLuongMua;
    }

    double tinhLoiNhuan(){
        return (_giaBanThucTe - dienThoaiDuocBan.giaNhap)*soLuongMua;
    }
    void output(){
        print("------Thông Tin Hóa Đơn------");
        print("Mã Hóa Đơn: $_maHoaDon");
        print("Điện Thoại Được Bán: $_dienThoaiDuocBan");
        print("Số Lượng Mua: $_soLuongMua");
        print("Giá Bán Thực Tế: $_giaBanThucTe");
        print("Tên Khách Hàng: $_tenKhachHang");
        print("Số Điện Thoại Khách Hàng: _$soDienThoai");
    }
}