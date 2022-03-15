# Desafio Flutter

## Passos para realizar o desafio

- Você deverá realizar o fork deste projeto e desenvolver o aplicativo conforme descrito abaixo
- Faça o checkout do fork e desenvolva sua aplicação localmente
- Após finalizar o desenvolvimento, realize um pull request para o nosso repositório

# Descritivo do desafio

## Aplicativo "Observador"

O desenvolvimento do aplicativo consiste em consumir uma API de dados de astronomia, esta API é pública e você podera obter a documentação e método de autenticação no endereço a seguir: https://docs.astronomyapi.com/.

Seu objetivo é realizar o consumo desta API, seguindo o escopo abaixo:

- Tela inicial deve exibir informações sobre a fase da lua, enviando os dados do observador (usuário) para API. Você deve obter a geolocalização do usuário para o envio. (https://docs.astronomyapi.com/endpoints/studio/moon-phase)

- A tela inicial deverá carregar as informações sobre a fase da lua naquele momento (com a data atual) e possibilitar que o usuário altere a data. Ao alterar a data, as informações sobre a fase da lua deverão ser reconsultadas e atualizadas em tela.

- Você deve desenvolver uma tela, onde será possivel obter os dados de um corpo celeste. Você deve permitir ao usuário filtrar pelos corpos celestes do sistema solar. (https://docs.astronomyapi.com/endpoints/bodies)

- Você deverá desenvolver uma tela, onde será possivel obter os dados de uma constelação, deverá ter a opção de filtro entre as constelações a seguir: Andrômeda, Pegasus e Órion. Ao realizar a consulta na API, você receberá uma imagem da constelação, esta imagem deverá ser exibida na tela. (https://docs.astronomyapi.com/endpoints/studio/star-chart)


# Observações
> Dica: Utililzar VS Code.

- Você deverá obter a geolocalização do usuário e enviar em cada requisição.

- Será considerado o tratamento de falhas da aplicação, então observar o cuidado na manipulação de erros da API.

- Está liberado utilização de bibliotecas. (Atualmente estamos utilizando GetX em nossos projetos).

- O programa pode ser minimalista, pode ter só o mínimo de funcionalidade necessária para realizar as operações pedidas e nada mais.
