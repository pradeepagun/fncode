# hello_world_function.py

def handler(context, request):
    """
    Entry point for the function. Receives a request object and returns a response.
    """
    return {
        "status": 200,
        "headers": {"Content-Type": "text/plain"},
        "body": "Hello, World!"
    }
