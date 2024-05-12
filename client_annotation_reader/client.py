import socket
import time
from kubernetes import client, config
import os

def read_own_annotation():
    cipher = os.getenv("CIPHER")
    return cipher

def start_client(my_annotation):
    while True:
        try:
            client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            client_socket.connect(('echo-server.test', 12345))
            client_socket.sendall(my_annotation.encode())
            print(f"send {my_annotation}") 
            data = client_socket.recv(1024)
            print(f"Received {data} from server")
            client_socket.close()
        except ConnectionRefusedError:
            print("Server is not available, retrying in 2 seconds...")
        except (ConnectionResetError, BrokenPipeError):
            print("Connection was reset, retrying in 2 seconds...")
        time.sleep(2)

if __name__ == "__main__":
    annos = read_own_annotation()
    start_client(annos)
