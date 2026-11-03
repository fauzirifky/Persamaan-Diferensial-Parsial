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

1. PDP sebagai model medan ruang-waktu dalam sains komputasi dan digital twin.
2. Hubungan konsep karakteristik PDP orde satu dengan transfer informasi.
3. Kebutuhan simulasi numerik pada geometri, parameter, forcing, dan coupling yang kompleks.
4. Perbedaan klasifikasi eliptik/parabolik/hiperbolik dengan linear/nonlinear dan homogen/nonhomogen.
5. Geometri diskriminan dan asal persamaan karakteristik.
6. Penurunan persamaan gelombang dari vibrating string beserta asumsi model.
7. Klasifikasi dan bentuk kanonik persamaan gelombang.
8. Solusi d'Alembert, pemisahan variabel, fungsi eigen, dan visualisasi solusi.
9. Linearisasi shallow-water nonlinear hingga persamaan gelombang linear.
10. Latihan individu tertulis tangan: klasifikasi, bentuk kanonik, solusi analitik, dan visualisasi.

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
