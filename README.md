# Persamaan Diferensial Parsial - MA 25-31018

Repositori materi Persamaan Diferensial Parsial, Program Studi Matematika, Institut Teknologi Sumatera, Semester Ganjil 2026/2027.

## Tim Pengajar

- Dear Michiko Mutiara Noor, M.Si. - Koordinator
- Dr. Dewi Suhika, M.Sc.
- Rifky Fauzi

## Materi yang tersedia

### Minggu 6 - Pendekatan Numerik PDP Orde 1

Folder: `slides/week-06-pendekatan-numerik-pdp-orde-1/`

Transport/adveksi, skema upwind, CFL singkat, kasus polutan sepanjang sungai, serta kepadatan mahasiswa pada koridor gedung.

### Pertemuan 9 - Persamaan Gelombang

Folder: `slides/week-09-persamaan-gelombang/`

**Catatan kalender:** Pertemuan 9 dilaksanakan pada Minggu 10 karena satu minggu perkuliahan sebelumnya kosong.

Materi meliputi pemodelan dawai bergetar, klasifikasi hiperbolik, transformasi karakteristik dan bentuk kanonik, formula d'Alembert, pemisahan variabel, fungsi eigen, serta linearisasi shallow-water equation.

### Pertemuan 12 - Metode Beda Hingga untuk PDP Parabolik dan Eliptik

Folder: `slides/week-12-metode-numerik-pdp-orde-2/`

Materi ini sengaja disusun sebagai kelanjutan langsung dari Deret Fourier I--III dan Persamaan Panas--Separasi Variabel. Alurnya:

1. solusi analitik sebagai benchmark numerik;
2. grid, notasi diskret, dan aproksimasi Taylor;
3. FTCS dan asal syarat kestabilan;
4. Backward Euler dan Crank--Nicolson;
5. konsistensi, stabilitas, konvergensi, serta Teorema Lax--Richtmyer dalam konteksnya;
6. verification vs validation;
7. Black--Scholes sebagai PDP parabolik yang direduksi ke heat equation;
8. pressure diffusion pada reservoir sebagai model difusi lain;
9. Poisson/Laplace, skema lima titik, manufactured solution, dan grid refinement;
10. prosedur pemilihan dan verifikasi metode numerik untuk Case 2.

Kode MATLAB terkait berada pada:

`matlab/week-12-metode-numerik-pdp-orde-2/`

## Struktur

```text
Persamaan-Diferensial-Parsial/
├── README.md
├── Makefile
├── matlab/
│   ├── week-09-wave-visualization.m
│   └── week-12-metode-numerik-pdp-orde-2/
├── slides/
│   ├── week-06-pendekatan-numerik-pdp-orde-1/
│   ├── week-09-persamaan-gelombang/
│   └── week-12-metode-numerik-pdp-orde-2/
└── template/
    └── pdp-beamer.sty
```

## Build PDF

Dengan MacTeX/TeX Live dan `latexmk`:

```bash
make week06
make week09
make week12
```

atau

```bash
make pdf
```

## Prinsip pedagogis numerik PDP orde dua

Metode numerik tidak dinilai benar hanya karena menghasilkan plot yang tampak masuk akal. Jika tersedia, kasus sederhana dengan solusi analitik digunakan sebagai benchmark. Implementasi diperiksa melalui konsistensi, kestabilan, galat terhadap solusi analitik, dan grid/time-step refinement sebelum solver diterapkan kembali pada model yang lebih kompleks.
