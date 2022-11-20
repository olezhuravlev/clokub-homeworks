import json
import hvac
import os


def main():
    env_url = os.environ['url']
    env_token = os.environ['token']
    env_write = os.getenv('write', 'False').lower() in ('true', '1', 't')

    print("Authenticating client to URL(token): " + env_url + "('" + env_token + "') for "
          + ("writing" if env_write else "reading"))

    client = hvac.Client(
        url=env_url,
        token=env_token
    )

    is_authenticated = client.is_authenticated()
    if not is_authenticated:
        print("Client is not authenticated!")
        return

    print("Client is authenticated: " + str(client.is_authenticated()))

    # Write secret
    if env_write:
        print("Writing secret...")
        client.secrets.kv.v2.create_or_update_secret(
            path='hvac',
            secret=dict(netology='Big secret!!!'),
        )

    print("Reading secret...")
    secret = client.secrets.kv.v2.read_secret_version(
        path='hvac',
    )
    print("Secret is: " + json.dumps(secret, indent=2))


if __name__ == "__main__":
    main()
