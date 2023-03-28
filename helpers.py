import requests

def inspect_request(req: requests.Request) -> None:
    session = requests.Session()
    prepped = session.prepare_request(req)

    # prepped has .method, .path_url, .headers and .body attribute to view the request
    body = prepped.body
    encoding = requests.utils.get_encoding_from_headers(prepped.headers)
    if encoding:
        body = body.decode(encoding) if encoding else '<binary data>'
    headers = '\n'.join(['{}: {}'.format(*hv) for hv in prepped.headers.items()])
    
    print(
        f"""\n{prepped.method}\n{prepped.path_url}\n{headers}\n{body}"""
    )
