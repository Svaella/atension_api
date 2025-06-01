FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Instala gdown primero para que esté disponible
RUN pip install --no-cache-dir gdown

# Copia todo al contenedor
COPY . /app

# Descarga el modelo desde Google Drive
RUN gdown --id 1PkVX6n29-hgDcjUxpzWhkLMV4tSBdD5x -O Modelo1.pkl

# Instala el resto de dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Exponer el puerto usado por Uvicorn
EXPOSE 8080

# Comando para correr el servidor FastAPI
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8080"]
