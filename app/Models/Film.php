<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Film extends Model
{
    use HasFactory;
    protected $fillable = [
        'judul', 'jenis_film', 'produksi', 'sinopsis',
        'tanggal_tayang', 'gambar'
    ];
}
