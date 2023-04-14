IDENTIFICATION DIVISION.
PROGRAM-ID. HR-MANAGEMENT-SYSTEM.

DATA DIVISION.
FILE SECTION.
FD EMPLOYEE-FILE.
01 EMPLOYEE-RECORD.
   05 EMPLOYEE-ID PIC 9(6).
   05 EMPLOYEE-NAME PIC X(30).
   05 EMPLOYEE-DEPT PIC X(10).
   05 EMPLOYEE-POSITION PIC X(15).
   05 EMPLOYEE-SALARY PIC 9(6)V99.
   05 EMPLOYEE-LEAVE-BALANCE PIC 9(3).

WORKING-STORAGE SECTION.
01 WS-CURRENT-DATE.
   05 WS-YEAR PIC 9(4).
   05 WS-MONTH PIC 99.
   05 WS-DAY PIC 99.
01 WS-EMP-ID PIC 9(6).
01 WS-EMP-NAME PIC X(30).
01 WS-EMP-DEPT PIC X(10).
01 WS-EMP-POSITION PIC X(15).
01 WS-EMP-SALARY PIC 9(6)V99.
01 WS-EMP-LEAVE-BALANCE PIC 9(3).
01 WS-CHOICE PIC X.
01 WS-EXIT PIC X(3) VALUE 'NO '.

PROCEDURE DIVISION.
MAIN-PROGRAM.
   PERFORM INITIALIZATION.
   PERFORM DISPLAY-MENU UNTIL WS-EXIT = 'YES'.
   PERFORM TERMINATION.
   STOP RUN.

INITIALIZATION.
   OPEN I-O EMPLOYEE-FILE.
   DISPLAY 'HR MANAGEMENT SYSTEM'.
   DISPLAY '---------------------'.
   DISPLAY 'TANGGAL SEKARANG: ' WS-DAY '-' WS-MONTH '-' WS-YEAR.
   ACCEPT WS-CHOICE.

DISPLAY-MENU.
   DISPLAY '1. Tambah Karyawan'.
   DISPLAY '2. Lihat Informasi Karyawan'.
   DISPLAY '3. Perbarui Informasi Karyawan'.
   DISPLAY '4. Hapus Karyawan'.
   DISPLAY '5. Keluar'.
   ACCEPT WS-CHOICE.
   IF WS-CHOICE = '1' THEN PERFORM TAMBAH-KARYAWAN.
   IF WS-CHOICE = '2' THEN PERFORM LIHAT-INFORMASI-KARYAWAN.
   IF WS-CHOICE = '3' THEN PERFORM PERBARUI-INFORMASI-KARYAWAN.
   IF WS-CHOICE = '4' THEN PERFORM HAPUS-KARYAWAN.
   IF WS-CHOICE = '5' THEN MOVE 'YES' TO WS-EXIT.

TAMBAH-KARYAWAN.
   DISPLAY 'MASUKKAN DETAIL KARYAWAN:'.
   DISPLAY 'ID Karyawan: '.
   ACCEPT WS-EMP-ID.
   DISPLAY 'Nama Karyawan: '.
   ACCEPT WS-EMP-NAME.
   DISPLAY 'Departemen Karyawan: '.
   ACCEPT WS-EMP-DEPT.
   DISPLAY 'Posisi Karyawan: '.
   ACCEPT WS-EMP-POSITION.
   DISPLAY 'Gaji Karyawan: '.
   ACCEPT WS-EMP-SALARY.
   DISPLAY 'Saldo Cuti Karyawan: '.
   ACCEPT WS-EMP-LEAVE-BALANCE.
   MOVE WS-EMP-ID TO EMPLOYEE-ID.
   MOVE WS-EMP-NAME TO EMPLOYEE-NAME.
   MOVE WS-EMP-DEPT TO EMPLOYEE-DEPT.
   MOVE WS-EMP-POSITION TO EMPLOYEE-POSITION.
   MOVE WS-EMP-S
   MOVE WS-EMP-SALARY TO EMPLOYEE-SALARY.
   MOVE WS-EMP-LEAVE-BALANCE TO EMPLOYEE-LEAVE-BALANCE.
   WRITE EMPLOYEE-RECORD.
   DISPLAY 'Karyawan berhasil ditambahkan.'.
   
   LIHAT-INFORMASI-KARYAWAN.
   DISPLAY 'MASUKKAN ID KARYAWAN:'.
   ACCEPT WS-EMP-ID.
   READ EMPLOYEE-FILE INTO EMPLOYEE-RECORD
       AT END
           DISPLAY 'Karyawan tidak ditemukan.'
       NOT AT END
           IF EMPLOYEE-ID = WS-EMP-ID
               DISPLAY 'ID Karyawan: ' EMPLOYEE-ID
               DISPLAY 'Nama Karyawan: ' EMPLOYEE-NAME
               DISPLAY 'Departemen Karyawan: ' EMPLOYEE-DEPT
               DISPLAY 'Posisi Karyawan: ' EMPLOYEE-POSITION
               DISPLAY 'Gaji Karyawan: ' EMPLOYEE-SALARY
               DISPLAY 'Saldo Cuti Karyawan: ' EMPLOYEE-LEAVE-BALANCE
           END-IF
       END-READ.
   
   PERBARUI-INFORMASI-KARYAWAN.
   DISPLAY 'MASUKKAN ID KARYAWAN:'.
   ACCEPT WS-EMP-ID.
   READ EMPLOYEE-FILE INTO EMPLOYEE-RECORD
       AT END
           DISPLAY 'Karyawan tidak ditemukan.'
       NOT AT END
           IF EMPLOYEE-ID = WS-EMP-ID
               DISPLAY 'Masukkan informasi baru untuk karyawan dengan ID ' EMPLOYEE-ID ':'.
               DISPLAY 'Nama Karyawan: ' EMPLOYEE-NAME.
               ACCEPT WS-EMP-NAME.
               DISPLAY 'Departemen Karyawan: ' EMPLOYEE-DEPT.
               ACCEPT WS-EMP-DEPT.
               DISPLAY 'Posisi Karyawan: ' EMPLOYEE-POSITION.
               ACCEPT WS-EMP-POSITION.
               DISPLAY 'Gaji Karyawan: ' EMPLOYEE-SALARY.
               ACCEPT WS-EMP-SALARY.
               DISPLAY 'Saldo Cuti Karyawan: ' EMPLOYEE-LEAVE-BALANCE.
               ACCEPT WS-EMP-LEAVE-BALANCE.
               MOVE WS-EMP-NAME TO EMPLOYEE-NAME.
               MOVE WS-EMP-DEPT TO EMPLOYEE-DEPT.
               MOVE WS-EMP-POSITION TO EMPLOYEE-POSITION.
               MOVE WS-EMP-SALARY TO EMPLOYEE-SALARY.
               MOVE WS-EMP-LEAVE-BALANCE TO EMPLOYEE-LEAVE-BALANCE.
               REWRITE EMPLOYEE-RECORD.
               DISPLAY 'Informasi karyawan berhasil diperbarui.'
           END-IF
       END-READ.
   
   HAPUS-KARYAWAN.
   DISPLAY 'MASUKKAN ID KARYAWAN:'.
   ACCEPT WS-EMP-ID.
   DISPLAY 'Apakah Anda yakin ingin menghapus karyawan dengan ID ' WS-EMP-ID '? (Y/N)'.
   ACCEPT WS-CHOICE.
   IF WS-CHOICE = 'Y' OR WS-CHOICE = 'y'
       THEN
           READ EMPLOYEE-FILE INTO EMPLOYEE-RECORD
               AT END
                   DISPLAY 'Karyawan tidak ditemukan.'
               NOT AT END
                   IF EMPLOYEE-ID = WS-EMP-ID
                       DELETE EMPLOYEE-RECORD
                       DISPLAY 'Karyawan berhasil dihapus.'
                   END-IF
           END-READ
   END-IF.
   
   TERMINATION.
   CLOSE EMPLOYEE-FILE.
   DISPLAY 'PROGRAM SELESAI'.
   
