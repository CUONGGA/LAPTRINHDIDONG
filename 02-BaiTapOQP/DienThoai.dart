class DienThoai{
    String _maDienThoai;
    String _tenDienThoai;
    String _hangSanXuat;
    double _giaNhap;
    double _giaBan;
    int _soLuongTonKho;
    bool _trangThai;


    DienThoai(
        this._maDienThoai,
        this._tenDienThoai,
        this._hangSanXuat,
        this._giaNhap,
        this._giaBan,
        this._soLuongTonKho,
        this._trangThai
    );
    
    String get maDienThoai => _maDienThoai;
    String get tenDienThoai => _tenDienThoai;
    String get hangSanXuat => _hangSanXuat;
    double get giaNhap => _giaNhap;
    double get giaBan => _giaBan;
    int get soLuongTonKho => _soLuongTonKho;
    bool get trangThai => _trangThai;

    set maDienThoai(String maDienThoai){
        if(maDienThoai.isNotEmpty){
            _maDienThoai = maDienThoai;
        }
    }
    set tenDienThoai(String tenDienThoai){
        if(tenDienThoai.isNotEmpty){
            _tenDienThoai = tenDienThoai;
        }
    }
    set hangSanXuat(String hangSanXuat){
        if(hangSanXuat.isNotEmpty){
            _hangSanXuat = hangSanXuat;
        }
    }
    set giaNhap(double giaNhap){
        if(giaNhap > 0){
            _giaNhap = giaNhap;
        }
    }
    set giaBan(double giaBan){
        if(giaBan > 0 && giaBan>giaNhap){
            _giaBan = giaBan;
        }
    }
    set soLuongTonKho(int soLuongTonKho){
        if(soLuongTonKho >= 0){
            _soLuongTonKho = soLuongTonKho;
        }
    }
    set trangThai(bool trangThai){
        _trangThai = trangThai;
    }
    double loiNhuanDuKien(){
        return (_giaBan-_giaNhap)*_soLuongTonKho;
    }
    void output(){
        print("------Thông Tin Điện Thoại------");
        print("Mã Điện Thoại: $_maDienThoai");
        print("Tên Điện Thoại: $_tenDienThoai");
        print("Hãng Sản Xuất: $_hangSanXuat");
        print("Giá Nhập: $_giaNhap");
        print("Giá Bán: $_giaBan");
        print("Số Lượng Tồn Kho: $_soLuongTonKho");
    }
    bool kiemTraCoTheBan(){
        return _soLuongTonKho > 0 && _trangThai;
    }
}