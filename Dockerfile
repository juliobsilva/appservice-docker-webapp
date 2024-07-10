# Usar uma imagem base do Python
FROM python:3.9-slim

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o arquivo requirements.txt e instalar as dependências
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copiar o restante do código do aplicativo
COPY . .

# Expor a porta que o Flask vai usar
EXPOSE 5000

# Definir a variável de ambiente para Flask
ENV FLASK_APP=main.py

# Comando para rodar o Flask
CMD ["flask", "run", "--host=0.0.0.0"]
