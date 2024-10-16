// Definir vida util do silo
// Tirar tempo utilizado e se limpa 

// Colocae o valor da cota da soja como uma variavel 

// Variavel para poder colocar o valor do seu silo 

// Deixar tudo mais intuitivo e responsivo com o CSS (Se DragEvent, colocar animação)

// Izinho pra entender de onde veio os valores de risco



function calcRisco() {
    // Definindo as variáveis dos inputs
    var qtdSilo = Number(input_qtdSilo.value);
    var capacidadeSilo = Number(input_capacidadeSilo.value);
    var conexaoSilo = input_conexaoSilo.value;
    var tempoSilo = Number(input_tempoSilo.value);
    var limpaSilo = input_limpaSilo.value;

    // Definição dos dados externos
    var cotacaoSojaSaca = 137.51; // número aproximado ao atual

    var riscoBaseAnualSilo = 0.10; // número 0,1%, de risco de explosão anual por silo. Sem esse monitoramento, sem uma rotina de limpeza, cuidado e manutenção (nosso serviços) as chances podem aumentar para 10%-15%.
    var custoEstruturaSiloTonelada = 700; // número Folha de São Paulo

    var prejuizoAnual = 0;


    // Cálculos das saídas do algoritmo
    var riscoAnualSilo = riscoBaseAnualSilo * (tempoSilo / 52); // considerando um total de 52 semanas num ano e que o silo é limpo após ser esvaziado, não havendo assim risco de explosão
    var cotacaoSojaTonelada = cotacaoSojaSaca * 1000 / 60;
    var custoEstruturaSiloTotal = capacidadeSilo * custoEstruturaSiloTonelada;

    var probUmNaoExplodir = 1 - riscoAnualSilo; // Probabilidade de um silo NÃO explodir
    var probDeNenhumExplodir = probUmNaoExplodir ** qtdSilo; // Probabilidade de nenhum silo do Usuário explodir
    var riscoUsuario = 1 - probDeNenhumExplodir; // Probabilidade de pelo menos um silo explodir
    var perda = custoEstruturaSiloTotal + (capacidadeSilo * cotacaoSojaTonelada);
    var riscoSujoUsuario = riscoBaseAnualSilo * ((52 - tempoSilo )/ 52); // considerando o tempo em que o silo sujo fica vazio;
    var perdaSujo = custoEstruturaSiloTotal;

    // Cálculos do custo da solução
    var custoInstalacao = capacidadeSilo * qtdSilo * 0.1 ; 
    var custoUtilizacaoSoftware = 3000; // previsão hipotética
    var custoSuporte = 300 + capacidadeSilo * qtdSilo * 0.008; // previsão hipotética
    var custoSolucao = custoInstalacao + custoUtilizacaoSoftware;
    var custoSolucaoAno = custoSolucao + custoSuporte * 12;

    
    div_mensagem3.innerHTML = ''; // Limpeza da mensagem, para mostrar novo cenário

    if (conexaoSilo == "Sim") {
        perda *= qtdSilo;
        perdaSujo *= qtdSilo;
        riscoSujoUsuario = (riscoUsuario * ((52 - tempoSilo )/ 52)) / (tempoSilo / 52);  // desfazendo o cálculo do fator do risco enquanto o silo está cheio, para então calcular o risco quando está vazio

        div_mensagem2.innerHTML = `<br> Devido os silos estarem próximos/interligados, uma possível explosão se propagaria a outros silos!`;
    } else {
        div_mensagem2.innerHTML = `<br> Devido os silos não estarem próximos/interligados, uma possível explosão se limitaria a apenas um silo.`;
    };

    if (limpaSilo == 'Não') {   
        if (tempoSilo < 52) {
            div_mensagem3.innerHTML = `<br> Por não limpar, ainda há o risco de <b>${((riscoSujoUsuario) * 100).toFixed(5)}%</b> de se explodir o(s) silo(s) vazio(s), gerando a perda infraestrutural de <b style="color:red"> R$${perdaSujo.toFixed(2)}</b> <br>`;
        } else {
            div_mensagem3.innerHTML = `<br> Devido os silos estarem sempre sendo utilizados, não há risco de explosão com eles vazios`;
        }
    };

    prejuizoAnual = perda * riscoUsuario;

    var economiaSolucao = prejuizoAnual - custoSolucaoAno;
    
    div_mensagem1.innerHTML = `
        <br> <b>Simulador do Risco de Explosão:</b> <br>

        Além de possíveis perdas humanas significativas e haver de lidar com uma situação catastrófica, há: <br> <br>

        Risco de explosão anual: <b>${(riscoUsuario * 100).toFixed(2)}%</b> <br>
        Possível perda numa explosão: <b style="color:red">R$ ${perda.toFixed(2)}</b> <br>
        Prejuízo segundo o risco de explosão anual: <b>R$ ${prejuizoAnual.toFixed(2)}</b>
    `;

    div_mensagem4.innerHTML = `
    <br> <b>Nossa Solução: </b> <br>
    Agora, com a utilização da solução <b> Silos Signal </b> seu custo seria apenas de: <br>
    Custo Instalação: <b>R$ ${custoSolucao} </b> <br>
    Custo Mensal(suporte e manuntenção) : R$ <b> ${custoSuporte.toFixed(2)} </b> <br>
    Representando apenas <b> ${(custoSolucaoAno/prejuizoAnual*100).toFixed(2)}% </b> do prejuízo de uma possível explosão. <br>
    Economizando um total de <b style="color:green">R$ ${economiaSolucao.toFixed(2)}<b> !
    `;


};