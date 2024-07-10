# Use a imagem base do Python
FROM python:3.8-slim

# Define o diretório de trabalho
WORKDIR /app

# Copia os arquivos necessários para o contêiner
COPY requirements.txt requirements.txt
COPY app.py app.py

# Instala as dependências
RUN pip install -r requirements.txt

# Define o comando para executar a aplicação
CMD ["python", "app.py"]