
FROM python:3.14-slim

# Configuración de Python
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1 \
    PYTHONPATH=/app/src

WORKDIR /app

# Crear usuario y grupo sin privilegios
RUN addgroup --system --gid 10001 app && \
    adduser --system --uid 10001 \
    --ingroup app --no-create-home app

# Instalar dependencias
COPY requirements.txt .

RUN python -m pip install --no-cache-dir -r requirements.txt

# Copiar aplicación
COPY --chown=10001:10001 src/ ./src/

# Ejecutar como usuario no privilegiado
USER 10001:10001

# Puerto de la API
EXPOSE 8000

# Comprobación de salud
HEALTHCHECK --interval=30s \
    --timeout=3s \
    --start-period=10s \
    --retries=3 \
    CMD ["python", "-c", "import urllib.request; urllib.request.urlopen('http://127.0.0.1:8000/health', timeout=2)"]

# Arranque de FastAPI
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
