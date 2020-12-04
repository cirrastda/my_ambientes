# Docker para PHP7

## Preparação

### Requisitos

O host onde será executado o docker deve ter instalado:

* Docker CE
* docker-compose
* git 

### Arquivos Fontes

Os fontes da aplicação devem ficar numa pasta que será mapeada para /home/sistemas dentro do docker pelo docker-compose.yml.

Para o BtecApiCore seguir o seguinte procedimento:

1. Criar uma pasta onde vai ficar o BtecApiCore (Ex.: d:/dev/fontes)
2. Baixar o BtecApiCore para dentro dessa pasta via git (Ex.: d:/dev/fontes/BtecApiCore)
3. Copiar o arquivo docker-compose-MODELO.yml para docker-compose.yml
4. Atualizar o docker-compose.yml trocando PASTA/PARA/HOME para d:/dev/fontes

### Build da Imagem

1. Abra um shell dentro da pasta do onde está o Dockerfile
2. Executar o comando de build da imagem:

$ docker build -t  server_php7:v1 . 

Nota: o v1 é a versão da imagem. Se já tiver uma imagem e quiser criar uma nova mude v1 para v2 por exemplo e atualize o item image docker-compose.yml

Nota 2: Verifique se a build finalizou com sucesso. Caso ela termine com erros, tente executar o comando novamente. Normalmente na segunda vez funciona.

## Execução

Para subir o container:

1. Abra um shell dentro da pasta do onde está o docker-compose.yml
2. Execute o comando para criar e subir o container:

$ docker-compose up -d 

### Verificação

Para verificar o funcionamento abra um browser na URL: 

http://localhost:8087/api/v2/

Isso deve entregar um CakePHP

Caso não retorne nada siga o procedimento abaixo:

1. Verifique se o container está sendo executado com:

$ docker ps 

E veja se o container server_php7 está rodando. 

2. Entre no container usando:

$ docker exec -it server_php7 /bin/bash

3. Suba o Apache manualmente com:

$ service apache2 start 

