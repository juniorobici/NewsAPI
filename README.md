NewsAPI
===================

### Descrição   

##### Teste para processo seletivo da Bornlogic   
Construa um App para iOS com a API: https://newsapi.org   
- O App deverá conter duas telas
- Na primeira tela, exibir do artigo as imagens, autores, títulos e as descrições utilizando UITableView ou UICollectionView
- Ao clicar numa célula, respectivamente, exibir na segunda tela a imagem, a data de publicação do artigo e o conteúdo do artigo selecionado   

 [Para mais informações](https://www.linkedin.com/dms/C4E06AQGXrEs5KyNdcA/messaging-attachmentFile/0/1648063484385?m=AQIXJ9bA6a1uhgAAAX_IO9pqGwvIsOt_ptxsOXszpiFJ1z1sqJIkm2q0bA&ne=1&v=beta&t=TAwTc5WZ34yY-2zfwWImm96sa4zlWLAqq4n7dMT1n6E&lipi=urn%3Ali%3Apage%3Amessaging_thread%3B2700ebde-a71d-4296-ad40-cb7a900d11c7)

### Imagens :national_park:
<table>
  <tr>
    <td>Notícias</td>
     <td>Notícia selecionada</td>
     <td>Filtro</td>
  </tr>
  <tr>
    <td><img src="https://github.com/juniorobici/NewsAPI/blob/master/Imagens/Tela1.png" width=270 height=480></td>
    <td><img src="https://github.com/juniorobici/NewsAPI/blob/master/Imagens/Tela2.png" width=270 height=480></td>
    <td><img src="https://github.com/juniorobici/NewsAPI/blob/master/Imagens/Tela3.png" width=270 height=480></td>
  </tr>
 </table>

#### Informações :apple:   
- XCode: 13.3   
- Swift: 5.0   
- iOS: 14.0+    

#### Passo a passo para testar o projeto :sassy_man: :   

##### Configuração   
Navegue até o arquivo: **NewsAPI/Network/NetworkManager.swift**
Altere a variável **APIKEY** para o valor da sua própria chave.
Caso não tenha uma APIKEY, você poderá criar uma aqui :point_right: https://newsapi.org

##### Executando   
- 1. Após clonar o projeto abra um terminal na pasta principal "NewsAPI".   
- 2. Abra o arquivo "NewsAPI.xcodeproj".   
- 3. Na "Project navigator" selecionar o arquivo principal do projeto "NewsAPI" :arrow_right: Na aba "Signing & Capabilities" :arrow_right: "Signing" :arrow_right: "Team" Selecionar o time configurado no XCode.   
- 4. Utilize o botão "Build & Run" ou as teclas "(Command)⌘+B e (Command)⌘+R" para executar o projeto no simulador.  
- 5. Caso opte por executar em um dispositivo físico :iphone: :   
Após o "Build & Run" no XCode, no dispositivo entrar em Ajustes :arrow_right: Geral :arrow_right: Gerenciamento de Dispositivo :arrow_right: Selecione a conta de Desenvolvedor :arrow_right: e agora o "NewsAPI" vai estar disponível na lista dos app e basta utilizar o botão "Confiar em:" para poder utiliza-lo no dispositivo.  

### Tests :test_tube: :   
UnitTests: :six:   
UITests: :three:   

### Observações :wave:   
 - Não foram utilizados pods   
 - A propriedade ***"content"*** do objeto ***"News.Article"*** vem com a informação truncada em 200 caracteres conforme documentação.
