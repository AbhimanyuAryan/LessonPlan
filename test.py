import os
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()

endpoint = os.getenv("ENDPOINT")
model_name = "gpt-4o-mini"
deployment_name = "gpt-4o-mini"

api_key = os.getenv("API_KEY") 

client = OpenAI(
    base_url=f"{endpoint}",
    api_key=api_key,
)

completion = client.chat.completions.create(
    model=deployment_name,
    messages=[
        {
            "role": "user",
            "content": "What is the capital of France?",
        }
    ],
)

print(completion.choices[0].message)