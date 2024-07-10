FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

EXPOSE 80

COPY . .

CMD ["python", "my_app_pypi/main.py"]
