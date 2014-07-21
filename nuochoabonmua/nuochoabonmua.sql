CREATE TABLE AdminLevel1(MaAdminLevel1 INTEGER PRIMARY KEY, Ten VARCHAR(100));
CREATE TABLE AdminLevel2(MaAdminLevel2 INTEGER PRIMARY KEY, MaAdminLevel1 INT, Ten VARCHAR(100));
CREATE TABLE AdminLevel3(MaAdminLevel3 INTEGER PRIMARY KEY, MaAdminLevel2 INT, Ten VARCHAR(100));
CREATE TABLE AdminLevel4(MaAdminLevel4 INTEGER PRIMARY KEY, MaAdminLevel3 INT, Ten VARCHAR(100));
CREATE TABLE DiaChi(MaDiaChi INTEGER PRIMARY KEY, MaAdminLevel1 INT, MaAdminLevel2 INT, MaAdminLevel3 INT, MaAdminLevel4 INT, DiaChi TEXT);

CREATE TABLE HangSanXuat(MaHangSanXuat INTEGER PRIMARY KEY, Ten VARCHAR(50));
CREATE TABLE LoaiSanPham(MaLoaiSanPham INTEGER PRIMARY KEY, Ten VARCHAR(100));
CREATE TABLE Kho(MaKho INTEGER PRIMARY KEY, MaDiaChi INT, SoDienThoai VARCHAR(50), NguoiLienLac VARCHAR(50));
CREATE TABLE KhachHang(MaKhachHang INTEGER PRIMARY KEY, Ten VARCHAR(100), SoDienThoai VARCHAR(50), FacebookName VARCHAR(100), FacebookID VARCHAR(50), Dog TINYINT); /* 0 = NOT DOG, 1 = DOG */

CREATE TABLE PhanHoiKhachHang(MaPhanHoiKhachHang INTEGER PRIMARY KEY, MaKhachHang INT, NgayPhanHoi DATETIME, NoiDung TEXT, TotXau TINYINT); /*TotXau: 1 = tot; 2 = xau; 3 = tot + xau*/

CREATE TABLE SanPham(MaSanPham INTEGER PRIMARY KEY, TenSanPham VARCHAR(100), MaLoaiNuocHoa INT, NamNu TINYINT, DungTich SMALLINT, MaHangSanXuat INT, GhiChu VARCHAR(255)); /* Name = 1; Nu = 0 */
CREATE TABLE NguonHang(MaNguonHang INTEGER PRIMARY KEY, Ten VARCHAR(100), SoDienThoai VARCHAR(50));
CREATE TABLE DonNhapHang(MaDonNhapHang INTEGER PRIMARY KEY, MaNguonHang INT, NgayNhap DATETIME, SoTien INT, GiamGia INT, SoTienPhaiTra INT);
CREATE TABLE ChiTietDonNhapHang(MaChiTietDonNhapHang INTEGER PRIMARY KEY, MaDonNhapHang INT, MaSanPham INT, GiaNhap INT, KhuyenMai TINYINT, TrangThai TINYINY); /* KhuyenMai: 0 = MUA, 1 = KHUYEN MAI; TrangThai: 0 = DA BAN, 1 = CON HANG */
CREATE TABLE HangVanChuyen(MaHangVanChuyen INTEGER PRIMARY KEY, TenHang VARCHAR(50), TenNguoiLienLac VARCHAR(100), SoDienThoai VARCHAR(50));
CREATE TABLE DonHang(MaDonHang INTEGER PRIMARY KEY, MaVanDon VARCHAR(30), MaKho INT, MaKhachHang INT, MaHangVanChuyen INT, NgayDatHang DATETIME, NgayGuiHang DATETIME, NgayGiaoHang DATETIME, NgayGiaoHangDuTinh DATETIME, CachThuTien TINYINT, TrangThai INT, PhiVanChuyen INT, PhiChuyenHoan INT, PhiCOD INT, GiaVon INT, TienThuVe INT, LoiNhuan INT, GhiChu VARCHAR(255), DiaChiGuiHang INT, GiamGia INT); /*DiaChiGuiHang la MaKhachHangDiaChi trong bang KhachHang_DiaChi*/
/*Trang Thai: 1 = khach hang da confirm? ; 2 = da chon qua?; 4 = da goi? 8 = da gui di?; 16 = da den?; 32 = fail?; 64 = da chuyen hoang?; 128 = da doi soat? 256 = da ntin MDH; 512 = Thieu hang; 1024 = Don hang huy; 2048 = K/h chiu phi van chuyen; 4096 = K/h Cho hang*/
/*CachThuTien: 1 = COD; 2 = CK*/
/*TienThuVe: money collected from shipchung.vn. product price, PR fee and others have not yet been deducted*/
CREATE TABLE ChiTietDonHang(MaChiTietDonHang INTEGER PRIMARY KEY, MaDonHang INT, MaSanPham INT, MaGiaBan INT, QuaTang TINYINT, MaChiTietDonNhap INT);
CREATE TABLE GiaBan(MaGiaBan INTEGER PRIMARY KEY, MaSanPham INT, GiaBanRa INT, ApDungTuNgay DATETIME, ThuTuTao INT, GiaDangXai TINYINT);

CREATE TABLE KhachHang_DiaChi(MaKhachHangDiaChi INTEGER PRIMARY KEY, MaKhachHang INT, MaDiaChi INT);

INSERT INTO HangVanChuyen(TenHang, SoDienThoai, TenNguoiLienLac) VALUES("shipchung.vn", "0822284714", "Tổng đài");
INSERT INTO HangVanChuyen(TenHang, SoDienThoai, TenNguoiLienLac) VALUES("365Express", "0919979365", "c. Gọn");
INSERT INTO HangVanChuyen(TenHang, SoDienThoai, TenNguoiLienLac) VALUES("247Post", "0989762122", "Phúc Q3");
INSERT INTO HangVanChuyen(TenHang, SoDienThoai, TenNguoiLienLac) VALUES("giaohangso1.vn", "0862608476", "Tổng đài");
INSERT INTO HangVanChuyen(TenHang, SoDienThoai, TenNguoiLienLac) VALUES("giaohangnhanh.vn", "19006491", "Tổng đài");
INSERT INTO HangVanChuyen(TenHang, SoDienThoai, TenNguoiLienLac) VALUES("Cong Thanh Express", "0903053281", "Minh");
INSERT INTO HangVanChuyen(TenHang, SoDienThoai, TenNguoiLienLac) VALUES("a. Cường", "0906818773", "a. Cường");
