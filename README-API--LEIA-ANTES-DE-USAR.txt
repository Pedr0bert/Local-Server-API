======================================================================
README: INSTALAÇÃO E USO DA API LOCAL (ESP32 -> MONGODB)
======================================================================
PARA ACESSAR A VERSÃO COM IMAGENS USE A VERSÃO PDF

Este pacote foi preparado para instalar e configurar um servidor local
que recebe dados de uma ESP32 e os envia para o banco de dados MongoDB.


Siga atentamente as etapas abaixo.


Leia tudo atentamente antes de começar a fazer a configuração.


----------------------------------------------------------------------
ANTES DE COMEÇAR: CONFIGURAÇÃO OBRIGATÓRIA
----------------------------------------------------------------------


A API NÃO FUNCIONARÁ SEM COMPLETAR ESTE PASSO.


Você precisa informar sua chave de conexão do banco de dados MongoDB.


1. Dentro desta pasta, abra o diretório chamado 'api'.


2. Localize e abra o arquivo chamado '.env.local' usando o Bloco de Notas
   ou outro editor de texto simples.


3. Você encontrará a seguinte linha no arquivo:


   MONGO_URI = '<SUA_MONGO_URI>'


4. Substitua o texto '<SUA_MONGO_URI>' pela sua chave de conexão real
   fornecida pelo MongoDB. Ela deve ser mantida entre aspas simples.


   Exemplo de como deve ficar:
   MONGO_URI = 'mongodb+srv://<meu_usuario>:<minha_senha_123>@cluster0.abcde.mongodb.net/<meuBancoDeDados>'


5. Salve o arquivo e feche o editor.


Após fazer isso, você pode seguir para a instalação.


----------------------------------------------------------------------
ESTRUTURA DE ARQUIVOS
----------------------------------------------------------------------


Esta pasta contém os seguintes arquivos e diretórios:


| Arquivo ou Pasta  | Descrição                                          |       
|-------------------|----------------------------------------------------|
| api/              | Diretorio com todo o código-fonte da API.          |           
| instalar-tudo.bat | Script de instalação automática (executar 1 vez).  |
| iniciar-api.bat   | Script para iniciar a API manualmente.             |        
| parar-api.bat     | Script para parar a API manualmente.               |     
| verificar-api.bat | Script de verificação de APIs cadastradas.         |    
| deletar-api.bat   | Script para DELETAR a API manualmente.             |
| reiniciar-api.bat | Script para reiniciar a API manualmente.           |     
| README.txt        | Este guia explicativo.                             |         




Dentro da pasta 'api/', você encontrará:


- api.js:
  O arquivo principal contém toda a lógica do servidor.


- .env.local:
  Arquivo de configuração onde você acabou de inserir sua chave MONGO_URI.


- package.json e package-lock.json:
  Arquivos que listam as dependências que a API precisa para funcionar.


- node_modules/ (será criada após a instalação):
  Pasta onde as dependências são baixadas. Não altere ou apague esta pasta.




----------------------------------------------------------------------
ETAPA 1: PRÉ-REQUISITOS DO SISTEMA
----------------------------------------------------------------------
1. Se você ainda não tem o Node.js instalado, acesse o site abaixo:
   https://nodejs.org


2. Baixe a versão "LTS" (versão estável recomendada) e instale em seu
   computador como qualquer outro programa.


3. Se a instalação pedir para reiniciar o computador, faça-o antes
   de prosseguir.




----------------------------------------------------------------------
ETAPA 2: INSTALAR A API (FAZER APENAS UMA VEZ)
----------------------------------------------------------------------
1. Extraia a pasta zip e mova a pasta extraída para C:\. ‘Ctrl + x’ para copiar e apagar ela de onde está e ‘Ctrl + v’ para colar a pasta no endereço desejado(no caso, C:\).


2. Localize o arquivo:
   'instalar-tudo.bat'


3. Clique com o botão direito do mouse sobre ele e selecione a opção:
   "Executar como administrador"


4. Uma tela preta do terminal irá abrir e começar a instalar tudo
   automaticamente.


5. Ao final do processo, você verá a mensagem de confirmação:
   "Tudo pronto! A API está rodando..."


Isso significa que a instalação foi um sucesso e a API já está funcionando.




----------------------------------------------------------------------
ETAPA 3: INICIAR AUTOMATICAMENTE COM O COMPUTADOR
----------------------------------------------------------------------
Este passo garante que a API ligue sozinha sempre que o computador for ligado.


1. Pressione as teclas 'Windows + R' para abrir a caixa "Executar".


2. Digite o comando abaixo e pressione Enter para abrir o Agendador de Tarefas:
   'taskschd.msc'


3. No menu à direita, clique em "Criar Tarefa..." (não use "Criar Tarefa Básica").
  





4. Na aba 'Geral':
   - Nome: Iniciar API ESP32
   - Marque a opcao: "Executar com privilegios mais altos"
   - Marque a opção: "Executar estando o usuário conectado ou não"
  



5. Na aba ‘Disparadores’:
   - Clique em "Novo...".
   - Em "Iniciar a tarefa", selecione: "Ao inicializar".
   - Verifique se "Ativado" está marcado e clique em OK.
  

  



6. Na aba 'Ações':
   - Clique em "Novo...".
   - Ação: "Iniciar um programa".
   - Em "Programa/script", clique em "Procurar..." e selecione o arquivo 'iniciar-api.bat'.
  



7. Na aba Condições, desmarque todas as opções.


8. Clique em OK para salvar a tarefa. Pronto!






----------------------------------------------------------------------
COMO VERIFICAR SE A API ESTÁ RODANDO
----------------------------------------------------------------------
1. Abra o Prompt de Comando (procure por 'cmd' no Menu Iniciar).


2. No terminal, digite o comando:
   'pm2 list' ou execute o arquivo ‘verificar-api.bat’ como administrador


3. Se o 'Status' da 'api-esp32' estiver como "online", tudo está funcionando.


   ┌────────────┬────────────┬────┬────┐
   │ Name       │ Status     │... │... │
   ├────────────┼────────────┼────┼────┤
   │ api-esp32  │ online     │... │... │
   └────────────┴────────────┴────┴────┘




----------------------------------------------------------------------
SCRIPTS ADICIONAIS
----------------------------------------------------------------------
- 'iniciar-api.bat' : Use para LIGAR a API manualmente.
- ‘reiniciar-api’ : Use para reiniciar a API caso ocorra algum problema.


- ‘verificar-api’ : Use para mostrar as APIs cadastradas no servidor.


- ‘deletar-api.bat’ : (CUIDADO)Use para DELETAR PERMANENTEMENTE a API manualmente


- 'parar-api.bat' :  Use para DESLIGAR a API manualmente. A API pode ser ligada com ‘iniciar-api.bat’.




Lembrete: Sempre execute os arquivos .bat como administrador.


----------------------------------------------------------------------
DICAS FINAIS
----------------------------------------------------------------------
* NUNCA ative os arquivos .bat antes de ter certeza do que está fazendo.
* NUNCA delete ou mova a pasta 'api' nem os arquivos '.bat'.
* Mantenha todos os arquivos juntos na mesma pasta para garantir o funcionamento.
* Se for instalar em outro computador, copie a pasta inteira e repita o processo.
