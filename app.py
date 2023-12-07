from flask import Flask, render_template, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)


# Conectar a la base de datos MySQL
import mysql.connector
conn = mysql.connector.connect(
    host='localhost',
    user='codogrupo6',
    password='12344',
    database='catalogodepelis'
)

try:
    # Crear cursor para interactuar con la base de datos
    cursor = conn.cursor()

    # Crear tabla
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS peliculas (
            IDpeli INT AUTO_INCREMENT PRIMARY KEY,
            Titulo VARCHAR(100) NOT NULL,
            Anio INT(4) NOT NULL,
            Director VARCHAR(50) NOT NULL,
            Clasificacion VARCHAR(20) NOT NULL,
            Calificacion DECIMAL(3, 1),
            Imagen_url VARCHAR(255)
        )
    ''')

    # Insertar datos en la tabla
    datos_pelicula = ('Titanic', 1997, 'James Cameron', 'PG-13', 8.5, 'titanic.jpg')
    cursor.execute('''
        INSERT INTO peliculas (Titulo, Año, Director, Clasificación, Calificación, Imagen_url)
        VALUES (%s, %s, %s, %s, %s, %s)
    ''', datos_pelicula)

    # Guardar (commit) los cambios en la base de datos
    conn.commit()

    # Consultar todas las películas en la base de datos
    cursor.execute('SELECT * FROM peliculas')
    peliculas = cursor.fetchall()

    # Imprimir las películas
    for pelicula in peliculas:
        print(pelicula)

finally:
    # Cerrar el cursor y la conexión en el bloque finally
    cursor.close()
    conn.close()







#SISTEMA CRUD
class CatalogoPeliculas:
    def __init__(self):
        self.peliculas = []

    def agregar_pelicula(self, pelicula):
        self.peliculas.append(pelicula)
        return "Película agregada con éxito."

    def listar_peliculas(self):
        return self.peliculas

    def buscar_pelicula(self, titulo):
        for pelicula in self.peliculas:
            if pelicula['Titulo'] == titulo:
                return pelicula
        return None

    def actualizar_pelicula(self, titulo, nueva_informacion):
        for pelicula in self.peliculas:
            if pelicula['Titulo'] == titulo:
                pelicula.update(nueva_informacion)
                return "Película actualizada con éxito."
        return "Película no encontrada."

    def eliminar_pelicula(self, titulo):
        for pelicula in self.peliculas:
            if pelicula['Titulo'] == titulo:
                self.peliculas.remove(pelicula)
                return "Película eliminada con éxito."
        return "Película no encontrada."


# Ejemplo de uso
if __name__ == "__main__":
    catalogo = CatalogoPeliculas()

    # Agregar películas
    print(catalogo.agregar_pelicula({
        'Titulo': 'Titanic',
        'Año': 1997,
        'Director': 'James Cameron',
        'Clasificación': 'PG-13',
        'Calificación': 8.5,
        'Imagen_url': 'titanic.jpg'
    }))

    print(catalogo.agregar_pelicula({
        'Titulo': 'El Padrino',
        'Año': 1972,
        'Director': 'Francis Ford Coppola',
        'Clasificación': 'R',
        'Calificación': 9.2,
        'Imagen_url': 'elpadrino.jpg'
    }))

    # Listar películas
    print("Catálogo completo:")
    print(catalogo.listar_peliculas())

    # Buscar y mostrar información de una película
    titulo_buscar = 'Titanic'
    print(f"Información de la película '{titulo_buscar}':")
    pelicula_encontrada = catalogo.buscar_pelicula(titulo_buscar)
    if pelicula_encontrada:
        print(pelicula_encontrada)
    else:
        print(f"No se encontró la película '{titulo_buscar}'.")

    # Actualizar información de una película
    titulo_actualizar = 'Titanic'
    nueva_informacion = {'Calificación': 9.0}
    print(catalogo.actualizar_pelicula(titulo_actualizar, nueva_informacion))

    # Listar películas después de la actualización
    print("Catálogo después de la actualización:")
    print(catalogo.listar_peliculas())

    # Eliminar una película
    titulo_eliminar = 'El Padrino'
    print(catalogo.eliminar_pelicula(titulo_eliminar))




#Ruta para código formato JSON
@app.route('/api/catalogo', methods=['GET'])
def api_listar_peliculas():
    return jsonify(catalogo.listar_peliculas())




# Ruta para mostrar el catálogo en una página HTML
@app.route('/catalogo', methods=['GET'])
def mostrar_catalogo():
    return render_template('catalogo.html', peliculas=catalogo.listar_peliculas())

if __name__ == '__main__':
    app.run(debug=True)
