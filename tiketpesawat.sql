/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     12/13/2017 1:30:46 PM                        */
/*==============================================================*/


/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   admin_id             int not null,
   account_name         varchar(30),
   email                varchar(30) not null,
   nomor_hp             int,
   alamat               varchar(30),
   tgl_lahir            date,
   tempat_lahir         varchar(30),
   username             varchar(30) not null,
   password             varchar(30) not null,
   status               bool not null,
   primary key (admin_id)
);

/*==============================================================*/
/* Table: customer                                              */
/*==============================================================*/
create table customer
(
   customer_id          int not null,
   account_name         varchar(30),
   email                varchar(30) not null,
   nomor_hp             int,
   alamat               varchar(30),
   tgl_lahir            date,
   tempat_lahir         varchar(30),
   username             varchar(30) not null,
   password             varchar(30) not null,
   status               bool not null,
   primary key (customer_id)
);

/*==============================================================*/
/* Table: reservasi                                             */
/*==============================================================*/
create table reservasi
(
   kode_reservasi       int not null,
   customer_id          int not null,
   tgl_keberangkatan    date not null,
   harga_tiket          float not null,
   kelas_tiket          varchar(30) not null,
   tujuan               varchar(30) not null,
   primary key (kode_reservasi)
);

/*==============================================================*/
/* Table: tiket                                                 */
/*==============================================================*/
create table tiket
(
   nomor_tiket          int not null,
   kode_pembayaran      int,
   primary key (nomor_tiket)
);

/*==============================================================*/
/* Table: transaksi_pemesanan                                   */
/*==============================================================*/
create table transaksi_pemesanan
(
   kode_pembayaran      int not null,
   admin_id             int,
   kode_reservasi       int,
   total_pembayaran     float not null,
   tgl_pembayaran       date not null,
   tgl_keberangkatan    date not null,
   primary key (kode_pembayaran)
);

alter table reservasi add constraint FK_melakukan foreign key (customer_id)
      references customer (customer_id) on delete restrict on update restrict;

alter table tiket add constraint FK_mencetak foreign key (kode_pembayaran)
      references transaksi_pemesanan (kode_pembayaran) on delete restrict on update restrict;

alter table transaksi_pemesanan add constraint FK_membayar foreign key (kode_reservasi)
      references reservasi (kode_reservasi) on delete restrict on update restrict;

alter table transaksi_pemesanan add constraint FK_verifikasi foreign key (admin_id)
      references admin (admin_id) on delete restrict on update restrict;

