import requests

def inspect_request(req: requests.Request) -> None:
    session = requests.Session()
    prepped = session.prepare_request(req)

    # prepped has .method, .path_url, .headers and .body attribute to view the request
    encoding = 'utf8' or requests.utils.get_encoding_from_headers(prepped.headers)
    body = prepped.body.decode(encoding) if encoding else '<binary data>' 
    headers = '\n'.join(['{}: {}'.format(*hv) for hv in prepped.headers.items()])
    
    print(
        f"""
        {prepped.method} {prepped.path_url} HTTP/1.1
        {headers}

        {body}"""
    )
