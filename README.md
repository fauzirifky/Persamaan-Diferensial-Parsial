# Persamaan Diferensial Parsial - MA 25-31018

Repositori materi Persamaan Diferensial Parsial, Program Studi Matematika, Institut Teknologi Sumatera, Semester Ganjil 2026/2027.

## Tim Pengajar

- Dear Michiko Mutiara Noor, M.Si. - Koordinator
- Dr. Dewi Suhika, M.Sc.
- Rifky Fauzi

## Materi yang tersedia

### Minggu 6 - Pendekatan Numerik PDP Orde 1

Folder: `slides/week-06-pendekatan-numerik-pdp-orde-1/`

Materi membahas transport/adveksi, skema upwind, CFL singkat, kasus polutan sepanjang sungai, serta kepadatan mahasiswa pada koridor gedung. PDF yang sebelumnya tersedia dipertahankan, dan source LaTeX direkonstruksi agar materi dapat diedit kembali.

### Pertemuan 9 - Persamaan Gelombang

Folder: `slides/week-09-persamaan-gelombang/`

**Catatan kalender:** Pertemuan 9 dilaksanakan pada Minggu 10 karena satu minggu perkuliahan sebelumnya kosong.

Alur materi:

1. Persamaan Diferensial Parsial dalam pemodelan matematis dan komputasi ilmiah.
2. Karakteristik pada PDP orde satu dan perluasannya ke PDP orde dua.
3. Peran solusi analitik dan simulasi numerik pada model nyata.
4. Klasifikasi berdasarkan linearitas, kehomogenan, dan tipe; principal part dan diskriminan.
5. Transformasi koordinat, persamaan karakteristik, dan reduksi ke bentuk kanonik.
6. Derivasi persamaan gelombang satu dimensi dari Hukum II Newton pada dawai.
7. Klasifikasi, koordinat karakteristik, dan canonical form persamaan gelombang.
8. Masalah Cauchy pada garis tak berhingga dan formula d'Alembert.
9. Masalah nilai awal-batas pada dawai berhingga, pemisahan variabel, dan eigenfungsi.
10. Linearisasi sistem air dangkal satu dimensi dan persamaan gelombang homogen/tak homogen.
11. Latihan individu tertulis tangan: klasifikasi-kanonik, IBVP dawai, dan forcing.

## Struktur

```text
Persamaan-Diferensial-Parsial/
├── README.md
├── Makefile
├── matlab/
│   └── week-09-wave-visualization.m
├── slides/
│   ├── week-06-pendekatan-numerik-pdp-orde-1/
│   └── week-09-persamaan-gelombang/
└── template/
    └── pdp-beamer.sty
```

## Build PDF

Dengan MacTeX/TeX Live dan `latexmk`:

```bash
make week06
make week09
```

atau

```bash
make pdf
```

## Catatan pedagogis

Pertemuan berikutnya dapat menggunakan solusi analitik persamaan gelombang sebagai benchmark sebelum metode numerik PDP orde dua diperkenalkan. Dengan demikian, solusi numerik tidak langsung dipercaya hanya karena menghasilkan grafik: mahasiswa terlebih dahulu mempunyai kasus yang dapat diverifikasi secara analitik.
