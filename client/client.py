import socket
import time

def start_client():
    while True:
        client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        client_socket.connect(('echo-server', 12345))
        client_socket.sendall(b'Hello world')
        data = client_socket.recv(1024)
        print(f"Received {data} from server")
        client_socket.close()
        time.sleep(2)

if __name__ == "__main__":
    start_client()
