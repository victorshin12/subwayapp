from flask import Flask, request, jsonify
import random

app = Flask(__name__)

@app.route("/")
def home():
    return "Home"

@app.route("/get_random")
def get_random():
    random_number = random.randint(1, 100)
    num = {
        "random": random_number
    }
    return jsonify(num), 200

if __name__ == "__main__":
    app.run(debug=True)




# @app.route("/get-user/<user_id>")
# def get_user(user_id):
#     user_data = {
#         "user_id": user_id,
#         "name": "John Doe",
#         "email": "victorshin1230@gmail.com"
#     }

#     extra = request.args.get("extra")
#     if extra:
#         user_data["extra"] = extra

#     return jsonify(user_data), 200
