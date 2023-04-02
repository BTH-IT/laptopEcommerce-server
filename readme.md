## PRODUCT (Hưng)
  #### Database Struct
  - string ma_san_pham
  - string ten_san_pham
  - JSON hinh_anh
  - int bao_hanh
  - double gia_goc,
  - int giam_gia
  - string mo_ta_san_pham
  - string thuong_hieu
  - timestamp created_at
  - timestamp updated_at
  - string the_he_cpu
  - string cpu
  - string series_cpu
  - string chip_do_hoa_roi
  - string ten_ram
  - string man_hinh
  - string luu_tru
  - string so_cong_luu_tru_toi_da
  - string kieu_khe_m2_ho_tro
  - string cong_xuat_hinh
  - string cong_ket_noi
  - string ban_phim
  - string he_dieu_hanh
  - string kich_thuoc
  - string pin
  - float khoi_luong
  - string series_laptop,
  - string phu_kien_di_kem
  - boolean den_led
  - boolean man_hinh_cam_ung
  - int dung_luong_ram
  - int so_luong
  - int so_luong_da_ban
  - boolean noi_bat

  #### Method GET
  - /products             (action: get list without params)
  - /products             (action: get list with params)
  - /products/:productId  (action: get detail)

  #### Method POST
  - /products             (action: create)

  #### Method PUT OR PATCH
  - /products/:productId  (action: update)

  #### Method DELETE
  - /products/:productId  (action: delete)

========================================================

## BRAND (Tân)
  #### Database Struct
  - int ma_thuong_hieu
  - string ten_thuong_hieu
  - string icon
  - string hinh_anh

  #### Method GET
  - /brands              (action: list)
  - /brands/:brandId     (action: get detail)

  #### Method POST
  - /brands              (action: create)

  #### Method PUT OR PATCH
  - /brands/:brandId     (action: update)

  #### Method DELETE
  - /brands/:brandId      (action: delete)

========================================================

## USER (Tân)
  #### Database Struct
  - int ma_nguoi_dung
  - string ten_nguoi_dung
  - string mat_khau
  - string vai_tro

  #### Method GET
  - /users            (action: get list)
  - /users/:userId    (action: get detail)

  #### Method POST
  - /users             (action: create)

  #### Method PUT OR PATCH
  - /users/:userId     (action: update)

  #### Method DELETE
  - /users/:userId     (action: delete)

========================================================

## ORDER (Huy)
  #### Database Struct
  - int ma_don_hang
  - string ma_khach_hang
  - string ma_nhan_vien
  - string hinh_thuc_thanh_toan
  - date thoi_gian_dat_mua
  - string trang_thai
  - boolean hien_thi
  - array danh_sach_san_pham_da_mua

  #### Method GET
  - /orders           (action: get list)

  #### Method POST
  - /orders           (action: create)

  #### Method PUT OR PATCH
  - /orders/:orderId  (action: update)

  #### Method DELETE
  - /orders/:orderId  (action: delete)

========================================================

## IMPORT (Huy)
  #### Database Struct
  - int ma_phieu_nhap
  - int ma_nha_cung_cap
  - string ma_nhan_vien
  - date ngay_lap
  - boolean hien_thi
  - array danh_sach_san_pham_da_nhap

  #### Method GET
  - /import-orders           (action: get list)

  #### Method POST
  - /import-orders           (action: create)

  #### Method PUT OR PATCH
  - /import-orders/:importId  (action: update)

  #### Method DELETE
  - /import-orders/:importId  (action: delete)

========================================================

## SUPPLIER (Huy)
  #### Database Struct
  - int ma_nha_cung_cap
  - string ten_nha_cung_cap
  - string so_dien_thoai
  - string dia_chi

  #### Method GET
  - /suppliers           (action: get list)

  #### Method POST
  - /suppliers           (action: create)

  #### Method PUT OR PATCH
  - /suppliers/:supplierId  (action: update)

  #### Method DELETE
  - /suppliers/:supplierId  (action: delete)
  
========================================================

## Images (Huy)
  #### Database Struct
  - int ma_hinh_anh
  - string filename

  #### Method GET
  - /images/            (action: get list)
  - /images/:imageId    (action: get detail)

  #### Method POST
  - /images             (action: create)

  #### Method PUT OR PATCH
  - /images/:imageId    (action: update)

  #### Method DELETE
  - /images/:imageId    (action: delete)

========================================================

## Auth (Hưng)
  #### Method POST
  - /auth/login          (action: login)
  - /auth/register       (action: register)