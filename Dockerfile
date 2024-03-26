FROM python:3.9

# Setam directorul de lucru in container
WORKDIR /app

# Copiem fisierele sursa in container
COPY . /app

# Instalam dependentele
RUN pip install -r requirements.txt

# Definim comanda de pornire a aplicatiei
CMD ["python", "app.py"]
