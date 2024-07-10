from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Olá, este CI/CD foi desenvolvido por Júlio.O mais lindo da Avanade.!"

if __name__ == '__main__':
    app.run(debug=True)