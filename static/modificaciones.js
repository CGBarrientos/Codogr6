const URL = "http://127.0.0.1:5000";

const app = Vue.createApp({
    data() {
        return {
            IDpeli: '',
            Año: '',
            Director: '',
            Clasificación: '',
            Calificación: '',
            Imagen_url: '',
            imagenSeleccionada: null,
            imagenUrlTemp: null,
            mostrarDatosPelicula: false,
        };
    },
    methods: {
        obtenerPelicula() {
            fetch(URL + '/peliculas/' + this.IDpeli)
                .then(response => {
                    if (response.ok) {
                        return response.json();
                    } else {
                        throw new Error('Error al obtener los datos de la pelicula');
                    }
                })
                .then(data => {
                    this.Titulo = data.Titulo;
                    this.Año = data.Año;
                    this.Director = data.Director;
                    this.Clasificación = data.Clasificación;
                    this.Calificación = data.Calificación;
                    this.Imagen_url = data.Imagen_url;
                    this.mostrarDatosPelicula = true;
                })
                .catch(error => {
                    console.log(error);
                    alert('Código no encontrado');
                });
        },
        seleccionarImagen(event) {
            const file = event.target.files[0];
            this.imagenSeleccionada = file;
            this.imagenUrlTemp = URL.createObjectURL(file);
        },
        guardarCambios() {
            const formData = new FormData();
            formData.append('IDpeli', this.IDpeli);
            formData.append('Titulo', this.Titulo);
            formData.append('Año', this.Año);
            formData.append('Director', this.Director);
            formData.append('Clasificación', this.Clasificación);
            formData.append('Calificación', this.Calificación);

            if (this.imagenSeleccionada) {
                formData.append('imagen', this.imagenSeleccionada, this.imagenSeleccionada.name);
            }

            fetch(URL + 'peliculas/' + this.IDpeli, {
                method: 'PUT',
                body: formData,
            })
                .then(response => {
                    if (response.ok) {
                        return response.json();
                    } else {
                        throw new Error('Error al guardar los cambios en la pelicula');
                    }
                })
                .then(data => {
                    alert('Pelicula actualizada');
                    this.limpiarFormulario();
                })
                .catch(error => {
                    console.error('Error', error);
                    alert('Error al actualizar el producto');
                });
        },
        limpiarFormulario() {
            this.IDpeli = '';
            this.Año = '';
            this.Director = '';
            this.Clasificación = '';
            this.Calificación = '';
            this.Imagen_url = '';
            this.imagenSeleccionada = null;
            this.imagenUrlTemp = null;
            this.mostrarDatosPelicula = false;
        },
    },
});

app.mount('#app');