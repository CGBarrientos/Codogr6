const URL = "http://127.0.0.1:5000";

fetch(URL + '/peliculas')
    .then(function(response){
        if (response.ok) {
            return response.json();
        } else {
            throw new Error('Error al obtener las peliculas');
        }
    })
    .then(function(data) {
        for (let pelicula of data) {
            let fila = document.createElement('tr');
            fila.innerHTML = '<td>' + pelicula.Titulo + '</td>' + '<td align ="right">' + pelicula.Año + '</td>' + '<td align ="right">' + pelicula.Director + '</td>' + 
            '<td align ="right">' + pelicula.Clasificación + '</td>' + '<td align ="right">' + pelicula.Calificación + '</td>' + 
            '<td><img src="static/img/' + pelicula.Imagen_url + '" alt="miniatura de la pelicula" style="width: 150px;"></td>';
            document.getElementById('tablaPeliculas').appendChild(fila);
        }
    })
    .catch(function (error) {
        alert('Error al obtener las peliculas');
        console.error('Error', error);
    });