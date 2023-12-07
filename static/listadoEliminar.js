const URL = "http://127.0.0.1:5000";
const app = Vue.createApp({
    data() {
        return {
            peliculas: []
        };
    },
    methods: {
        obtenerPeliculas() {
            fetch(URL + '/peliculas')
                .then(response => {
                    if (response.ok) {
                        return response.json();
                    } else {
                        throw new Error('Error al obtener las peliculas');
                    }
                })
                .then(data => {
                    this.peliculas = data;
                })
                .catch(error => {
                    console.error('Error', error);
                    alert('Error al obtener las peliculas');
                });
        },
        eliminarPelicula(IDpeli) {
            if (confirm('¿Estás seguro que deseas eliminar este ítem?')) {
                fetch(`${URL}peliculas/${IDpeli}`, { method: 'DELETE' })
                    .then(response => {
                        if (response.ok) {
                            this.peliculas = this.peliculas.filter(pelicula => pelicula.IDpeli !== IDpeli);
                            alert('Película eliminada correctamente');
                        }
                    })
                    .catch(error => {
                        alert(error.message);
                    });
            }
        }
    },
    mounted() {
        this.obtenerPeliculas();
    }
});

app.mount('body');