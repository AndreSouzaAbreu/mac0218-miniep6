# MAC0218 — Mini EP 6

Este repositório é meu trabalho referente ao Mini EP 6 da disciplina MAC0218.

O objetivo é criar um servidor de arquivos (ou site estatíco se preferir)
usando Docker.

## Uso

É possível rodar o servidor usando `docker` ou `docker-compose`.

## Docker

Para rodar o servidor usando `docker`, criei duas scripts para automatizar o processo:

`container-up.sh`:

```sh
#!/bin/sh
source ./.env
docker build -t $IMG_NAME .
docker container run --detach \
  --name $CONTAINER_NAME \
  -p $PORT:80 \
  -v $FILES:/usr/src/pages:ro \
  $IMG_NAME
```

`container-down.sh`

```sh
#!/bin/sh
source ./.env
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME
```

Elas dependem de um arquivo `.env`, que contém as variáveis de ambiente.
Por padrão, usei estas variáveis:

```sh
CONTAINER_NAME=caddy-server
IMG_NAME=custom-caddy
FILES=$PWD/website
PORT=8080
```

Os nomes das variáveis são auto explicativos. Algo importante de ressaltar é
que `FILES` deve ser um caminho absoluto, por isso foi necessário usar `PWD` em
vez de declarar um caminho relativo.

**Nota**: *Normalmente eu criaria um arquivo `.env.sample` em vez de adicionar o
arquivo `.env` ao repositório, porém não fiz isto desta vez porque o arquivo `.env`
não contém nenhuma informação confidencial (tais como senhas e API keys) e
porque este Mini EP é algo mais simples.*

## Docker Compose

Adicionei também um arquivo [docker-compose](./docker-compose.yml) para
facilitar o deployment do servidor. Neste caso basta rodar `docker-compose up -d`
e `docker-compose down` para inicializar ou parar o servidor.
