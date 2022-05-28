<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<body>
    <h2>FILM YANG SEDANG TAYANG</h2>
    <table>
        <thead>
            <tr>
                <th>Judul</th>
                <th>Jenis Film</th>
                <th>Produksi</th>
                <th>Sinopsis</th>
                <th>Tanggal Tayang</th>
                <th>Gambar</th>
            </tr>
        </thead>
        <tbody>
            @foreach($nowplaying as $item)
            <tr>
                <td>{{ $item->judul }}</td>
                <td>{{ $item->jenis_film }}</td>
                <td>{{ $item->produksi }}</td>
                <td>{{ $item->sinopsis }}</td>
                <td>{{ $item->tanggal_tayang }}</td>
                <td>{{ $item->gambar }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

    <h2>FILM YANG COMINGSOON</h2>
    <table>
        <thead>
            <tr>
                <th>Judul</th>
                <th>Jenis Film</th>
                <th>Produksi</th>
                <th>Sinopsis</th>
                <th>Tanggal Tayang</th>
                <th>Gambar</th>
            </tr>
        </thead>
        <tbody>
            @foreach($comingsoon as $items)
            <tr>
                <td>{{ $items->judul }}</td>
                <td>{{ $items->jenis_film }}</td>
                <td>{{ $items->produksi }}</td>
                <td>{{ $items->sinopsis }}</td>
                <td>{{ $items->tanggal_tayang }}</td>
                <td>{{ $items->gambar }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>
</body>

</html>
