import socket

def start_server():
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind(('0.0.0.0', 12345))
    server_socket.listen()

    while True:
        client_socket, addr = server_socket.accept()
        data = client_socket.recv(1024)
        print(f"Received {data} from {addr}")
        client_socket.sendall(data)
        client_socket.close()

if __name__ == "__main__":
    start_server()
