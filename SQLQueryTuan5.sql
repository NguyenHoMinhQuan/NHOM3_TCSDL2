USE Tuan5;

CREATE TABLE KHACHHANG (
    MAKHACHHANG CHAR(10) PRIMARY KEY,
    TENCONGTY NVARCHAR(100),
    TENGIAODICH NVARCHAR(100),
    DIACHI NVARCHAR(255),
    EMAIL NVARCHAR(100),
    DIENTHOAI NVARCHAR(20),
    FAX NVARCHAR(20)
);

CREATE TABLE NHACUNGCAP (
    MACONGTY CHAR(10) PRIMARY KEY,
    TENCONGTY NVARCHAR(100),
    TENGIAODICH NVARCHAR(100),
    DIACHI NVARCHAR(255),
    DIENTHOAI NVARCHAR(20),
    FAX NVARCHAR(20),
    EMAIL NVARCHAR(100)
);

CREATE TABLE NHANVIEN (
    MANHANVIEN CHAR(10) PRIMARY KEY,
    HO NVARCHAR(50),
    TEN NVARCHAR(50),
    NGAYSINH DATE,
    NGAYLAMVIEC DATE,
    DIACHI NVARCHAR(255),
    DIENTHOAI NVARCHAR(20),
    LUONGCOBAN DECIMAL(18, 2),
    PHUCAP DECIMAL(18, 2)
);

CREATE TABLE LOAIHANG (
    MALOAISANG CHAR(10) PRIMARY KEY,
    TENLOAISANG NVARCHAR(100)
);

CREATE TABLE MATHANG (
    MAHANG CHAR(10) PRIMARY KEY,
    TENHANG NVARCHAR(100),
    MACONGTY CHAR(10),
    MALOAISANG CHAR(10),
    SOLUONG INT,
    DONVITINH NVARCHAR(20),
    GIAHANG DECIMAL(18, 2),
    FOREIGN KEY (MACONGTY) REFERENCES NHACUNGCAP(MACONGTY),
    FOREIGN KEY (MALOAISANG) REFERENCES LOAIHANG(MALOAISANG)
);

CREATE TABLE DONHANG (
    SOHOADON CHAR(10) PRIMARY KEY,
    MAKHACHHANG CHAR(10),
    MANHANVIEN CHAR(10),
    NGAYDATHANG DATE,
    NGAYGIAOHANG DATE,
    NGAYCHUYENHANG DATE,
    NOIGIAOHANG NVARCHAR(255),
    FOREIGN KEY (MAKHACHHANG) REFERENCES KHACHHANG(MAKHACHHANG),
    FOREIGN KEY (MANHANVIEN) REFERENCES NHANVIEN(MANHANVIEN)
);

CREATE TABLE CHITIETDATHANG (
    SOHOADON CHAR(10),
    MAHANG CHAR(10),
    GIABAN DECIMAL(18, 2),
    SOLUONG INT,
    MUCGIAMGIA DECIMAL(5, 2),
    PRIMARY KEY (SOHOADON, MAHANG),
    FOREIGN KEY (SOHOADON) REFERENCES DONHANG(SOHOADON),
    FOREIGN KEY (MAHANG) REFERENCES MATHANG(MAHANG)
);