
# LuisaLabs

## Modelagem dos dados

  Segue abaixo a modelagem do banco de dados:

![image info](https://i.imgur.com/d0oA9ZE.png)

## Subindo o Servidor

* Para inciar o servidor basta executar o comando abaixo:

  ```console
    docker-compose build
    docker-compose up

    PS: Caso seja o primeiro uso, rode os seguintes comandos:
    
    docker-compose run web rake db:create && rake db:migrate (caso seja a primeira vez)
    docker-compose run web rails c

    user = User.create(name: 'nome', email:email)
    user.credential.api_key (utilizado para autenticação da API)
  ```

## Executando Testes

* Para executar os testes do projeto:

  ```console
    docker-compose run --rm api bundle exec rspec .
  ```

## Request

### Autenticação

 *A api utliza como autenticação o padrão Bearer Token. Onde é criado um token único por usuário*
 *EX:*
 ![image info](https://i.imgur.com/BJw2faR.png)

### Users

*endpoint*
  Mostra todos os usuários cadastrados
 `GET /api/v1/users`

 *parametros*
![image info](https://i.imgur.com/rDuNkmM.png)
*retorno*

```
{
 "pagination": {
  "found": 1,
  "pages": 1,
  "current_page": 1,
  "per_page": 30
 },
 "entries": [
  {
   "name": "Diego",
   "email": "diego@email.com"
  }
 ]
}
```

 ------
 *endpoint*
 `GET /api/v1/users/:id`

```
{
 "result": "success",
 "request_id": "fccf2e89-141e-4e97-82e4-7472b59a25ef",
 "messages": [],
 "data": {
  "name": "Diego",
  "email": "diego@email.com"
 }
}
```

------
endpoint

 `post /api/v1/users`
*parametros*
![image info](https://i.imgur.com/iiu6QeP.png)
*retorno*

```
{
 "result": "success",
 "request_id": "9f9eb365-d4a0-4378-8646-e6f79db2196f",
 "messages": [],
 "data": {
  "name": "name",
  "email": "novo@email.com"
 }
}
```

------
endpoint

 `PUT /api/v1/users/:id`
*parametros*
 ![image info](https://i.imgur.com/iiu6QeP.png)
*retorno*

```{
 "result": "success",
 "request_id": "9f9eb365-d4a0-4378-8646-e6f79db2196f",
 "messages": [],
 "data": {
  "name": "name",
  "email": "name@email.com"
 }
}
```

------

### Favorite list

* criação de nova lista de favoritos e adição de itens na lista existente
 *endpoint*
 `POST /api/v1/favorited_products/add_to_fav_list`
 *parametros*
 ![image info](https://i.imgur.com/FmMbTWR.png)
*retorno*

```{
    "result": "success",
    "request_id": "074418c0-ca3b-417f-9de3-75eda303852b",
    "messages": [],
    "data": {
        "products": [
            {
                "id": 8,
                "name": null,
                "brand": "bébé confort",
                "image": "http://challenge-api.luizalabs.com/images/1bf0f365-fbdd-4e21-9786-da459d78dd1f.jpg",
                "external_id": "1bf0f365-fbdd-4e21-9786-da459d78dd1q",
                "title": "Cadeira para Auto Iseos Bébé Confort Earth Brown",
                "price": 1699,
                "created_at": "2021-02-22T06:16:39.766Z",
                "updated_at": "2021-02-22T06:16:39.766Z"
            },
            {
                "id": 7,
                "name": null,
                "brand": "bébé confort",
                "image": "http://challenge-api.luizalabs.com/images/1bf0f365-fbdd-4e21-9786-da459d78dd1f.jpg",
                "external_id": "1bf0f365-fbdd-4e21-9786-da459d78dd1x",
                "title": "Cadeira para Auto Iseos Bébé Confort Earth Brown",
                "price": 1699,
                "created_at": "2021-02-22T06:10:25.496Z",
                "updated_at": "2021-02-22T06:10:25.496Z"
            }
        ]
    }
}
```

------

* criação de nova lista de favoritos e adição de itens na lista existente
 *endpoint*
 `PUT api/v1/favorited_products/remove_product`
 *parametros*
 ![image info](https://i.imgur.com/fbyQ1je.png)
 *retorno*

```{
    "result": "success",
    "request_id": "074418c0-ca3b-417f-9de3-75eda303852b",
    "messages": [],
    "data": {
        "products": [
            {
                "id": 8,
                "name": null,
                "brand": "bébé confort",
                "image": "http://challenge-api.luizalabs.com/images/1bf0f365-fbdd-4e21-9786-da459d78dd1f.jpg",
                "external_id": "1bf0f365-fbdd-4e21-9786-da459d78dd1q",
                "title": "Cadeira para Auto Iseos Bébé Confort Earth Brown",
                "price": 1699,
                "created_at": "2021-02-22T06:16:39.766Z",
                "updated_at": "2021-02-22T06:16:39.766Z"
            },
            {
                "id": 7,
                "name": null,
                "brand": "bébé confort",
                "image": "http://challenge-api.luizalabs.com/images/1bf0f365-fbdd-4e21-9786-da459d78dd1f.jpg",
                "external_id": "1bf0f365-fbdd-4e21-9786-da459d78dd1x",
                "title": "Cadeira para Auto Iseos Bébé Confort Earth Brown",
                "price": 1699,
                "created_at": "2021-02-22T06:10:25.496Z",
                "updated_at": "2021-02-22T06:10:25.496Z"
            }
        ]
    }
}
```

------
