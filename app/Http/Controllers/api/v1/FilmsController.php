<?php

namespace App\Http\Controllers\api\v1;

use App\Models\Film;
use App\Models\FilmFavorit;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Rating;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class FilmsController extends Controller
{

    public function index()
    {

        $film = Film::latest()->get();
        return response([
            'success' => true,
            'message' => 'List Semua Film!',
            'data' => $film
        ], 200);
    }


    public function nowplaying()
    {
        $nowplaying = Film::where('tanggal_tayang', '=',  '2022-05-29')->get();
        return response(
            [
                'success' => true,
                'message' => 'List Semua Film Yang Sedang Tayang',
                'data' => $nowplaying
            ],
            200
        );
    }

    public function comingsoon()
    {

        $comingsoon = Film::where('tanggal_tayang',  '>', Carbon::now()->isoformat('YYYY-M-DD'))->get();

        return response(
            [
                'success' => true,
                'message' => 'List Semua Film Yang Coming Soon',
                'data' => $comingsoon
            ],
            200
        );
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

    public function tambahfilmfavorit($id)
    {
        $film = Film::find($id);
        $user = Auth()->user()->id;


        $filmfavorit = FilmFavorit::create([
            'idfilm'     => $film->id,
            'iduser'   => $user,

        ]);

        if ($filmfavorit) {
            return response()->json([
                'success' => true,
                'message' => 'Film Berhasil Disimpan Di Daftar Film Favorit Anda!',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Film Gagal Disimpan!',
            ], 401);
        }
    }

    public function rating(Request $request, $id)
    {
        $film = Film::find($id);
        $user = Auth()->user()->id;


        $rating = Rating::create([
            'idfilm'     => $film->id,
            'iduser'   => $user,
            'rating'   => $request->input('rating'),

        ]);

        if ($rating) {
            return response()->json([
                'success' => true,
                'message' => 'Anda Telah Berhasil Memberi Rating Untuk Film!',
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Gagal Memberi Rating!',
            ], 401);
        }
    }
}
