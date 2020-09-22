var context = document.getElementById("chart").getContext("2d");
var configuration = {
    type: 'line',
    // Estilização das linhas
    // Data = Dados gerais
    data: {
        //Dataset = Conjunto de dados, que nesse caso engloba as linhas e as legendas.
        datasets: [{
                //Legenda 1 
                label: "Temperatura (machos)", //Nome da legenda
                fontColor: 'White', // Cor da letra da legenda
                borderColor: '#1EC1C4', // Cor da linha
                backgroundColor: '#1EC1C4', // Muda a cor do fundo do quadrado da legenda
                fill: false, // A linha fica sem um fundo, sem uma cor embaixo dela
                borderWidth: 4, //Espessura da linha do gráfico 
                
            },
            //Legenda 2
            {
                label: "Temperatura (fêmeas)", //Nome da legenda
                fontColor: 'White', //Cor da fonte 
                borderColor: '#8ECA18', //Cor da borda tanto da linha quanto do quadrado da legenda 
                backgroundColor: '#8ECA18', //Cor do fundo do quadrado da legenda e do fundo das bolinhas
                fill: false, //Sem fundo
                borderWidth: 4, //Expessura da linha 
            }
        ]
    },
    // Estilizações que não são padrão, "um plus"
    options: {
        // Estilização do título
        title: {
            text: 'Análise de dados (Temperatura)',
            fullWidth: true, //Pega todo o tamanho da 'div' que ele está 
            display: true,  //Aqui define se o título irá aparecer ou não
            position: 'top', //Posição do titulo
            fontColor: '#FFFFFF', // Cor da fonte
            fontSize: 21, //Tamanho da fonte
        },

        //Configurações a mais da legenda
        legend: {
            display: 'true', //Se ele vai aparecer
            position: 'right', //Posição dele
            
            labels: {
                fontColor: '#FFFFFF', //Cor das fontes
                boxWidth: 50, 
            }
        },
        scales: {
            /* Estilização do Eixo X*/
            xAxes: [{
                //type: 'value',
                distribution: 'series',
            // números do lado do eixo x 
                ticks: {
                    fontColor: '#FFFFFF', //cor da fonte 
                    beginAtZero: true, //deve-se começar do 0? Sim!
                },
                //texto no eixo x
                scaleLabel: {
                    display: true, //Deve aparecer? Sim!
                    fontColor: 'white', //Cor da fonte 
                    labelString: 'Tempo', //texto 
                    fontSize: 15, //tamanho da fonte 
                },
            }],
            /* Estilização do Eixo Y*/
            yAxes: [{
                gridLines: true,
               // números do lado do eixo y
                ticks: {
                    fontColor: '#FFFFFF', // cor da fonte 
                    max: 35, //tamanho da fonte 
                    beginAtZero: true, //aqui indica que os números vão começar do 0
                },
                //escrita do lado dos números 
                scaleLabel: {
                    display: true, //Aqui indica se o texto deve aparecer ou não, 'true' representa sim
                    fontColor: 'white', //Cor da fonte
                    labelString: 'Temperatura', //texto que será mostrado
                    fontSize: 15, //tamanho da fonte
                },
            }]
        },
        animation: {
            duration: 0 //animação de entrada das linhas dos gráficos
        }
    }
};

var chart = new Chart(context, configuration);

//Função para obter os dados de temperatura do server
//Seria mais interessante fazer isso com WebSocket, porém para fins academicos, os dados serão atualizados via HTTP

//Esse atributo dentro do contexto serve para saber qual foi o último índice processado, assim eliminado os outros elementos na
//hora de montar/atualizar o gráfico
this.lastIndexTemp = 0;
this.time = 0;

function get_data() {

    var http = new XMLHttpRequest();
    http.open('GET', 'http://localhost:3000/api', false);
    http.send(null);

    var obj = JSON.parse(http.responseText);
    console.log(obj)
    if (obj.data.length == 0) {
        return;
    }

    var _lastIndexTemp = this.lastIndexTemp;
    this.lastIndexTemp = obj.data.length;
    listTemp = obj.data.slice(_lastIndexTemp);

    listTemp.forEach(data => {
        //Máximo de 60 itens exibidos no gráfico
        // Essa parte do if mostra que quando chega a 10 dados, ele renova as informações
        if (chart.data.labels.length == 10 && chart.data.datasets[0].data.length == 10) {
            chart.data.labels.shift();


            //Cada chart representa uma linha
            chart.data.datasets[0].data.shift();
            chart.data.datasets[1].data.shift();
        }

        chart.data.labels.push(this.time++);
        /*
            Vamos começar com palavra por palavra:
            O 'var n_aleatorios' é uma váriavel que calcula um valor 
            específico que será usado mais pra frente
            o 'Math' é um objeto embutido que tem propriedades e funções matemáticas.
            o 'Random' é uma dessas propriedades/funções matemáticas que são disponibilizadas pelo Math.
            
            Nesse caso, estamos fazendo a equação feita no 'sensors.js', para trabalharmos os 'limites da 2a linha' 
            que é essa abaixo:
            Math.random() * (max - min) + min;
            
            Em que o número 8 é o número máximo que essa segunda linha pode chegar de diferença em comparação a primeira, 
            sem ter nenhum risco de superar o limite de 33 graus.
            E o número 7 é o número mínimo que essa 2ª linha pode chegar de diferença em comparação a 1ª, também pra
            não ficar abaixo do limite de 30 graus, não ficar 29.alguma coisa sabe? 
            */
        var n_aleatorios = Math.random() * (8 - 7) + 7;
        chart.data.datasets[0].data.push(parseFloat(data));
        chart.data.datasets[1].data.push(parseFloat(data) + n_aleatorios);
        chart.update();
    });
    // Esses dois comentários não são necessários no gráfico, então não precisa mexer neles.
    // document.getElementById('average').textContent = obj.average;
    // document.getElementById('averageHour').textContent = obj.averageHour;
}

get_data();
// Intervalo entre as atualizações de dados
// Setei para 5 segundos
setInterval(() => {
    get_data();
}, 5000);