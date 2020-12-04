# Docker para PHP5

## Preparação

### Requisitos

O host onde será executado o docker deve ter instalado:

* Docker CE
* docker-compose
* SVN

### Arquivos Fontes

Os fontes da aplicação devem ficar numa pasta que será mapeada para /home/sistemas dentro do docker pelo docker-compose.yml.

Para o Portal seguir o seguinte procedimento:

_**Nota:** Lembrando que o Portal precisa estar dentro de uma pasta chamada portal_

1. Criar uma pasta onde vai ficar as branches feedback, portal e trunk (Ex.: d:/dev/Portal)
2. Criar dentro desta pasta pastas com os nomes feedback, portal e trunk (Ex.: d:/dev/Portal/feedback)
3. Criar dentro de cada uma das pastas acima a pasta portal (Ex.: d:/dev/Portal/feedback/portal)
4. Dentro das pastas portal fazer o checkout das respectivas branches do SVN
5. Fazer a copia do arquivo database.php.buonny para database.php dentro da pasta portal\app\config

### Build da Imagem

1. Abra um shell dentro da pasta do onde está o Dockerfile
2. Executar o comando de build da imagem:

$ docker build -t  server_php5:v1 . 

_**Nota 1:**  o v1 é a versão da imagem. Se já tiver uma imagem e quiser criar uma nova mude v1 para v2 por exemplo e atualize o item image docker-compose.yml_

_**Nota 2:**  Verifique se a build finalizou com sucesso. Caso ela termine com erros, tente executar o comando novamente. Normalmente na segunda vez funciona._

## Execução

Para subir o container...

Na pasta onde está o repositório dev_ambientes, entrar na pasta php5_server e siga os passos abaixo:

1. Copiar o arquivo docker-compose-MODELO.yml para docker-compose.yml
2. Atualizar o docker-compose.yml trocando PASTA/PARA/HOME para Ex.: d:/dev/Portal
3. Abra um shell dentro da pasta do onde está o docker-compose.yml
4. Execute o comando para criar e subir o container:

$ docker-compose up -d 

## Configuração dos hosts:

Uma vez que o portal somente funciona por resolução de nomes e SEM PORTA. Deve-se configurar o host local da maquina para reconhecer os nomes feedback, portal e trunk com o IP local (127.0.0.1). Para isso deve-se adionar os nomes do arquivo de hosts da maquina:

1. Localize e abra o arquivo de hosts da maquina (Windows fica em C:\Windows\System32\drivers\etc\hosts e no linux em /etc/hosts)
2. Adicione as seguintes linhas no final do arquivo:
  127.0.0.1 portal.localhost
  127.0.0.1 trunk.localhost
  127.0.0.1 feedback.localhost
3. Salve o arquivo

## Verificação

Para verificar o funcionamento abra um browser na URL: 

http://feedback.localhost/portal/

Isso deve entregar um o Portal.



