# Etapa 1: Construir a aplicação Python com Flask
FROM python:3.9-slim as build

WORKDIR /app

# Copiar os arquivos necessários
COPY app/my_app_pypi/requirements.txt .
COPY app/my_app_pypi/main.py .

# Instalar dependências
RUN pip install -r requirements.txt

# Etapa 2: Configurar o servidor Nginx
FROM nginx:latest

# Copiar o arquivo de configuração do Nginx
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Copiar a aplicação Flask para o diretório padrão do Nginx
COPY --from=build /app /usr/share/nginx/html

# Expor a porta 80 (a porta padrão do Nginx)
EXPOSE 80

# Comando para iniciar o Nginx em primeiro plano
CMD ["nginx", "-g", "daemon off;"]
