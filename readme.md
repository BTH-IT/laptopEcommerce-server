## PRODUCT (Hưng)
  # Database Struct
    string ma_san_pham
    string ten_san_pham
    string[] hinh_anh
    int bao_hanh
    double gia_goc
    int giam_gia
    string mo_ta_san_pham
    int ma_thuong_hieu
    timestamp created_at
    timestamp updated_at
    string the_he_cpu
    string cpu
    string series_cpu
    string chip_do_hoa_roi
    string ten_ram
    string man_hinh
    string luu_tru
    string so_cong_luu_tru_toi_da
    string kieu_khe_m2_ho_tro
    string cong_xuat_hinh
    string cong_ket_noi
    string ban_phim
    string he_dieu_hanh
    string kich_thuoc
    string pin
    string khoi_luong
    string series_laptop,
    string phu_kien_di_kem
    boolean den_led
    boolean man_hinh_cam_ung
    string dung_luong_ram
    boolean noi_bat
    boolean hien_thi

  # Method GET
  /products             (action: get list)
  /products/:productId  (action: get detail)

  # Method POST
  /products             (action: create)

  # Method PUT OR PATCH
  /products/:productId  (action: update)

  # Method DELETE
  /products/:productId  (action: delete)

========================================================

## Images (Hưng)
  # Database Struct
    int ma_hinh_anh
    string filename

  # Method GET
  /images/                (action: get list)
  /images/:imageId         (action: get detail)

  # Method POST
  /images       (action: create)

  # Method PUT OR PATCH
  /images/:imageId  (action: update)

  # Method DELETE
  /images/:imageId  (action: delete)

========================================================

## DETAIL PRODUCT (Hưng)
  # Database Struct
    string ma_chi_tiet_san_pham
    int ma_san_pham

  # Method GET
  /detail-products                    (action: get list)
  /detail-products/:detailProductId   (action: get detail)

  # Method POST
  /detail-products                    (action: create)

  # Method PUT OR PATCH
  /detail-products/:detailProductId   (action: update)

  # Method DELETE
  /detail-products/:detailProductId   (action: delete)

========================================================

## DETAIL PERMISSION (Hưng)
  # Database Struct
    int ma_nhom_quyen
    int ma_quyen_hang
    int ma_chuc_nang
    int trang_thai

  # Method GET
  /decentralization                                 (action: get list)
  /decentralization/:roleGroupId/:perId/:actionId   (action: get detail)

  # Method POST
  /decentralization                                 (action: create)

  # Method PUT OR PATCH
  /decentralization/:roleGroupId/:perId/:actionId   (action: update)

  # Method DELETE
  /decentralization/:roleGroupId/:perId/:actionId   (action: delete)

========================================================

## AUTH (Hưng)
  # Method POST
  /auth/login          (action: login)
  /auth/register       (action: register)

========================================================

## AUTH GROUP (Hưng)
  # Database Struct
    int ma_nhom_quyen
    string ten_nhom_quyen
    string mo_ta
    boolean trang_thai
    boolean mac_dinh

  # Method GET
  /auth-groups/:authGroupId         (action: get list)
  /auth-groups/:authGroupId         (action: get detail)

  # Method POST
  /auth-groups/:authGroupId         (action: create)

  # Method DELETE
  /auth-groups/:authGroupId         (action: delete)

========================================================

## ACCOUNT (Tân)
  # Method GET
  /accounts               (action: list)
  /accounts/:username     (action: get detail)

  # Method POST
  /accounts               (action: create)

  # Method PUT OR PATCH
  /accounts/:username     (action: update)

  # Method DELETE
  /accounts/:username     (action: delete)

========================================================

## BRAND (Tân)
  # Database Struct
    int ma_thuong_hieu
    string ten_thuong_hieu
    string icon
    string hinh_anh

  # Method GET
  /brands             (action: list)
  /brands/:brandId    (action: get detail)

  # Method POST
  /brands         (action: create)

  # Method PUT OR PATCH
  /brands/:brandId (action: update)

  # Method DELETE
  /brands/:brandId (action: delete)

========================================================

## CUSTOMER (Tân)
  # Database Struct
    int ma_khach_hang
    string ten_khach_hang
    timestamp ngay_sinh
    boolean gioi_tinh (1 là Nam và 0 là Nữ)
    string so_dien_thoai
    string dia_chi
    boolean hien_thi

  # Method GET
  /customers                 (action: get list)
  /customers/:customerId     (action: get detail)

  # Method POST
  /customers                 (action: create)

  # Method PUT OR PATCH
  /customers/:customerId     (action: update)

  # Method DELETE
  /customers/:customerId     (action: delete)

========================================================

## EMPLOYEE (Tân)
  # Database Struct
    int ma_nhan_vien
    string ten_nhan_vien
    string so_dien_thoai
    timestamp ngay_sinh
    boolean gioi_tinh (1 là Nam và 0 là Nữ)
    double muc_luong
    boolean hien_thi

  # Method GET
  /employees/:employeeId              (action: get list)

  # Method POST
  /employees                          (action: create)

  # Method PUT OR PATCH
  /employees/:employeeId/:productId   (action: update)

  # Method DELETE
  /employees/:employeeId/:productId   (action: delete)

========================================================

## ORDER (Huy)
  # Database Struct
    int ma_don_hang
    string ma_khach_hang
    string ma_nhan_vien
    array san_pham(CART)
    string hinh_thuc_thanh_toan
    timestamp thoi_gian_dat_mua
    string trang_thai
    boolean hien_thi

  # Method GET
  /orders           (action: get list)

  # Method POST
  /orders           (action: create)

  # Method PUT OR PATCH
  /orders/:orderId  (action: update)

  # Method DELETE
  /orders/:orderId  (action: delete)

========================================================

## IMPORT ORDER (Huy)
  # Database Struct
    int ma_phieu_nhap
    int ma_nha_cung_cap
    string ma_nhan_vien
    array san_pham(CART)
    timestamp ngay_lap
    boolean hien_thi

  # Method GET
  /import-orders                 (action: get list)

  # Method POST
  /import-orders                 (action: create)

  # Method PUT OR PATCH
  /import-orders/:importOrderId  (action: update)

  # Method DELETE
  /import-orders/:importOrderId  (action: delete)

========================================================

## SUPPLIER (Huy)
  # Database Struct
    int ma_nha_cung_cap
    string ten_nha_cung_cap
    string so_dien_thoai
    string dia_chi

  # Method GET
  /supliers                 (action: get list)
  /supliers/:suplierId      (action: get detail)

  # Method POST
  /supliers                 (action: create)

  # Method PUT OR PATCH
  /supliers/:suplierId      (action: update)

  # Method DELETE
  /supliers/:suplierId      (action: delete)

========================================================

## GUARANTEE (Huy)
  # Database Struct
    int ma_bao_hanh
    string ma_chi_tiet_san_pham
    string ma_khach_hang
    timestamp ngay_lap
    timestamp ngay_het_han

  # Method GET
  /guarantee                (action: get list)
  /guarantee/:guaranteeId   (action: get detail)

  # Method POST
  /guarantee                (action: create)

  # Method PUT OR PATCH
  /guarantee/:guaranteeId   (action: update)

  # Method DELETE
  /guarantee/:guaranteeId   (action: delete)