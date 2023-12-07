const URL = "http://127.0.0.1:5000";

document.getElementById('formulario').addEventListener('submit', function(event) {
    event.preventDefault();


    var formData = new FormData();
    formData.append('IDpeli', document.getElementById('IDpeli').value);
    formData.append('Titulo', document.getElementById('Titulo').value);
    formData.append('Año', document.getElementById('Año').value);
    formData.append('Director', document.getElementById('Director').value);
    formData.append('Clasificación', document.getElementById('Clasificación').value);
    formData.append('Calificación', document.getElementById('Calificación').value);
    formData.append('Imagen_url', document.getElementById('Imagen_url').value);


    fetch(URL + 'peliculas', {
        method: 'POST',
        body: formData
    })

    .then(function(response) {
        if (response.ok){
            return response.json();
        } else {
            throw new Error('Error al agregar la pelicula')
    }
})

.then(function(){
    alert('Pelicula agregada correctamente');
})
.catch(function(error) {
    alert('Error al agregar la pelicula');
    console.error('Error', error);
})
.finally(function () {
    document.getElementById('IDpeli').value = "";
    document.getElementById('Titulo').value = "";
    document.getElementById('Año').value = "";
    document.getElementById('Director').value = "";
    document.getElementById('Clasificación').value = "";
    document.getElementById('Calificación').value = "";
    document.getElementById('Imagen_url').value = "";
});
})