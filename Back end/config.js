var context = document.getElementById("chart").getContext("2d");
			var configuration = {
				type: 'line',
                // Estilização das linhas
                data: {
					datasets: [{
						label: "Temperatura (machos)" ,
                        borderColor:'#1EC1C4',
                        fill: false,
                        borderWidth: 4,
                        backgroundColor:'#1EC1C4',
                        fontColor: 'White',
                    },
                    
                    {
                        label: "Temperatura (fêmeas)",
                        borderColor:'#8ECA18',
                        fill: false,
                        borderWidth: 4,
                        backgroundColor:'#8ECA18',
                        fontColor:'White',
                    }]
                },
                // Estilizações que não são padrão, "um plus"
				options: {
                    title:{
                        text:'Análise de dados (Temperatura)',
                        fullWidth: true,
                        display: true,
                        position: 'top',
                        fontColor: '#FFFFFF',
                        fontSize: 21,
                    },

                    legend:{
                        display:'true',
                        position:'right',
                        labels:{
                            fontColor:'#FFFFFF',
                            boxWidth:50,
                        }
                    },
					scales: {
                    /* Estilização do Eixo X*/
						xAxes: [{
							//type: 'value',
							distribution: 'series',
							ticks: {
                                fontColor:'#FFFFFF',
                                beginAtZero:true,
                                label:'Teste',
                            },
                            scaleLabel:{
                                display: true,
                                fontColor: 'white',
                                labelString:'Tempo',
                                fontSize:15,
                            },
                        }],
                        /* Estilização do Eixo Y*/
						yAxes: [{
                            gridLines: true,
                            ticks:{
                                fontColor:'#FFFFFF',
                                max: 40,
                            },
                            scaleLabel: {
                                display: true,
                                fontColor: 'white',
                                labelString: 'Temperatura',
                                fontSize: 15,
							},
						}]
					},
					animation: {
						duration: 0
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
	
			function get_data(){
	
				var http = new XMLHttpRequest();
				http.open('GET', 'http://localhost:3000/api', false);
				http.send(null);        
				
				var obj = JSON.parse(http.responseText);
				console.log(obj)
				if (obj.data.length == 0){
					return;
				}
	
				var _lastIndexTemp = this.lastIndexTemp;
				this.lastIndexTemp = obj.data.length;
				listTemp = obj.data.slice(_lastIndexTemp);
	
				listTemp.forEach(data => {
					//Máximo de 60 itens exibidos no gráfico
					if (chart.data.labels.length == 10 && chart.data.datasets[0].data.length == 10){
                        chart.data.labels.shift();
                    // Ao chegar a 10 ele renova os dados, cada um deles representa cada linha

						chart.data.datasets[0].data.shift();
						chart.data.datasets[1].data.shift();
					}
	
                    chart.data.labels.push(this.time++);
                    /*
                    Essa parte coloca os dados no gráfico.
                    Sendo: chart.data.datasets[0].data.push(parseFloat(data)); Os dados da 
                    primeira linha
                    E
                    chart.data.datasets[1].data.push(parseFloat(data)+2.0); Os da segunda.
                    */
					chart.data.datasets[0].data.push(parseFloat(data));
					chart.data.datasets[1].data.push(parseFloat(data)+5);
					chart.update();
				});
				
				// document.getElementById('average').textContent = obj.average;
				// document.getElementById('averageHour').textContent = obj.averageHour;
			} 
			
			get_data();
            // Intervalo entre as atualizações de dados
            // Setei para 10 segundos
			setInterval(() => {
				get_data();
			}, 10000);
	