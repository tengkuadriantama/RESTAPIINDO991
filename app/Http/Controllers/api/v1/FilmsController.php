<?php

namespace App\Http\Controllers\api\v1;

use App\Models\Film;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class FilmsController extends Controller
{

    public function index()
    {
        $film = Film::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Posts',
            'data' => $film
        ], 200);
    }

    public function store(Request $request)
    {

        $validator = Validator::make(
            $request->all(),
            [
                'judul'     => 'required',
                'jenis_film'   => 'required',
                'produksi'   => 'required',
                'sinopsis'   => 'required',
                'tanggal_tayang'   => 'required',
                'gambar'   => 'required',

            ],
            [
                'judul.required' => 'Harap Lengkapi Data!',
                'jenis_film.required' => 'Harap Lengkapi Data!',
                'produksi.required' => 'Harap Lengkapi Data!',
                'sinopsis.required' => 'Harap Lengkapi Data!',
                'tanggal_tayang.required' => 'Harap Lengkapi Data!',
                'gambar.required' => 'Harap Lengkapi Data!',

            ]
        );

        if ($validator->fails()) {

            return response()->json([
                'success' => false,
                'message' => 'Silahkan Isi Bidang Yang Kosong',
                'data'    => $validator->errors()
            ], 401);
        } else {

            $Film = Film::create([
                'judul'     => $request->input('judul'),
                'jenis_film'   => $request->input('jenis_film'),
                'produksi'   => $request->input('produksi'),
                'sinopsis'   => $request->input('sinopsis'),
                'tanggal_tayang'   => $request->input('tanggal_tayang'),
                'gambar'   => $request->input('gambar')
            ]);

            if ($Film) {
                return response()->json([
                    'success' => true,
                    'message' => 'Film Berhasil Disimpan!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Film Gagal Disimpan!',
                ], 401);
            }
        }
    }

    public function show($id)
    {
        $film = Film::find($id);

        if ($film) {
            return response()->json([
                'success' => true,
                'message' => 'Detail Film!',
                'data'    => $film
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Film Tidak Ditemukan!',
                'data'    => ''
            ], 401);
        }
    }

    public function update(Request $request)
    {

        $validator = Validator::make(
            $request->all(),
            [
                'judul'     => 'required',
                'jenis_film'   => 'required',
                'produksi'   => 'required',
                'sinopsis'   => 'required',
                'tanggal_tayang'   => 'required',
                'gambar'   => 'required',

            ],
            [
                'judul.required' => 'Harap Lengkapi Data!',
                'jenis_film.required' => 'Harap Lengkapi Data!',
                'produksi.required' => 'Harap Lengkapi Data!',
                'sinopsis.required' => 'Harap Lengkapi Data!',
                'tanggal_tayang.required' => 'Harap Lengkapi Data!',
                'gambar.required' => 'Harap Lengkapi Data!',

            ]
        );

        if ($validator->fails()) {

            return response()->json([
                'success' => false,
                'message' => 'Silahkan Isi Bidang Yang Kosong',
                'data'    => $validator->errors()
            ], 401);
        } else {

            $film = Film::find($request->input('id'))->update([
                'judul'     => $request->input('judul'),
                'jenis_film'   => $request->input('jenis_film'),
                'produksi'   => $request->input('produksi'),
                'sinopsis'   => $request->input('sinopsis'),
                'tanggal_tayang'   => $request->input('tanggal_tayang'),
                'gambar'   => $request->input('gambar')
            ]);

            if ($film) {
                return response()->json([
                    'success' => true,
                    'message' => 'Film Berhasil Diupdate!',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Film Gagal Diupdate!',
                ], 401);
            }
        }
    }

    public function delete($id)
    {
        $film = Film::findOrFail($id);
        $film->delete();

        if ($film) {
            return response()->json([
                'success' => true,
                'message' => 'Film Berhasil Dihapus!',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Film Gagal Dihapus!',
            ], 400);
        }
    }
}
