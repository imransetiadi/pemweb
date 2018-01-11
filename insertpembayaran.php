<?php
include('koneksi/conn.php');
$no_pembayaran=$_POST['no_pembayaran'];
$no_tiket=$_POST['no_tiket'];
$tgl_pembayaran=$_POST['tgl_pembayaran'];
$hari_pembayaran=$_POST['hari_pembayaran'];
$jumlah_tiket=$_POST['jumlah_tiket'];
$harga_tiket=$_POST['harga_tiket'];
$total_pembayaran=$_POST['total_pembayaran'];

$query	= "INSERT INTO tbl_pembayaran values('$no_pembayaran','$no_tiket','$tgl_pembayaran','$hari_pembayaran','$jumlah_tiket','$harga_tiket','$total_pembayaran')";
$result = mysqli_query($conn,$query)or die(mysqli_error());
if($result){
	echo "<script type='text/javascript'>
	alert('Data Berhasil Disimpan..!');
</script>";
echo "<meta http-equiv='refresh' content='0; url=entry_pembayaran.php'>";
}else{
	echo "<script type='text/javascript'>
	onload =function(){
		alert('data gagal disimpan!');
	}
</script>";

var_dump($_FILES);
//KEMBALI KE LIST.PHP
echo "data berhasil dimasukkan";
echo "<meta http-equiv=refresh content=3;url=entry_pembayaran.php>";
}
?>


