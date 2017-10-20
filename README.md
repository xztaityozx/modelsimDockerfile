# modelsimDockerfile

#Install
```
service docker status
```

やって
```
docker.service - Docker Application Container Engine
   Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2017-10-19 16:47:52 JST; 22h ago
     Docs: https://docs.docker.com
 Main PID: 1386 (dockerd)
    Tasks: 20
...
```

みたいなのがでればDockerはOK

`Dockerfile` があるところで
```
docker build -t xztaityozx/modelsim .
docker run --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix xztaityozx/modelsim
```
別の端末ひらいて

```
docker ps -a

CONTAINER ID        IMAGE                 COMMAND             CREATED             STATUS              PORTS               NAMES
d46a7064a6fa        xztaityozx/modelsim   "bash"              21 seconds ago      Up 19 seconds                           serene_curran
...
```

いま実行されているdockerコンテナが表示されるのでmodelsimのコンテナIDをコピーする

```
docker inspect -f "{{ .Config.Hostname }}" d46a7064a6fa
```
出力される謎の数字をコピーする

xhostに登録する
```
xhost +local:コピーした謎の数字
```

Dockerに戻って`vsim`が起動すればOK
だめならコンテナを再起動しちゃう

