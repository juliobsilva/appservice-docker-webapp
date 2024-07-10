# Etapa 1: Construir a aplicação Python
FROM python:3.9-slim as build

WORKDIR /app

# Copiar o código fonte da aplicação
COPY . .

# Instalar dependências
RUN pip install -r requirements.txt

# Etapa 2: Configurar o servidor Nginx
FROM nginx:latest

COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Copiar os arquivos estáticos (ou dinâmicos) da aplicação Python para o diretório do Nginx
COPY --from=build /app /usr/src/app

# Expor a porta 80 (a porta padrão do Nginx)
EXPOSE 80

# Comando para iniciar o Nginx em primeiro plano
CMD ["nginx", "-g", "daemon off;", ";", "python", "my_app_pypi/main.py"]