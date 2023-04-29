# osc_server

```sh
cp .env.example .env # Then edit the `.env` file.
```

private ipの取得(Mac)

```sh
ifconfig | grep "inet 192.168." | awk '{print $2}'
# 直接.envファイルに書き込みたい場合
echo -n REACT_APP_PRIVATE_IP= > .env && ifconfig | grep "inet 192.168." | awk '{print $2}' >> .env
```

Dev

```sh
pipenv sync
```

```sh
pipenv run python websocket-osc.py
```
