from fp.fp import FreeProxy
from g4f.client import Client
from g4f.Provider import Liaobots
import os

def set_proxy():
  proxy = FreeProxy().get()
  os.environ["G4F_PROXY"] = proxy

client = Client()
response = client.chat.completions.create(
  provider=Liaobots,
  model="gpt-4o",
  messages=[{"role": "user", "content": "Hello"}],
)

print(response.choices[0].message.content)
