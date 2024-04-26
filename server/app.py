from flask import Flask, request, jsonify
from gemini import chat_with_gemini

app = Flask(__name__)

@app.route('/chatwithbot', methods=['POST'])
def chat_with_bot():
    prompt_part = request.data
    gemini_response = chat_with_gemini(prompt_part)
    return jsonify(gemini_response.text)

if __name__ == '__main__':
    app.run(debug=True)
