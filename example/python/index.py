import ctypes

def main():
    print("Greetings from Python")
    lib = ctypes.cdll.LoadLibrary("./libquery.so")
    lib.DoQuery.argtypes = []
    lib.DoQuery.restype = ctypes.c_void_p
    lib.DoQuery()

if __name__ == "__main__":
    main()