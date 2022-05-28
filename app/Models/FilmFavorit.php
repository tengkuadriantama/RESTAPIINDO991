<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FilmFavorit extends Model
{
    use HasFactory;
    public $primaryKey  = 'id';
    protected $table = "daftarfilmfavorits";
    protected $fillable = [
        'id',
        'idfilm',
        'iduser',

    ];

    public function pemasukans()
    {
        return $this->belongsTo(Film::class, 'idfilm', 'id');
    }

    public function pengeluarans()
    {
        return $this->belongsTo(User::class, 'iduser', 'id');
    }
}
