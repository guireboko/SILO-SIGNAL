// Constante para definição da entrada analogica 2
const int PINO_SENSOR_MQ2 = A2;


// Constante para a definição do valor minimo de voltagem
const int VALOR_MINIMO = 100;

// Constante para a definição do valor maximo de voltagem    
const int VALOR_MAXIMO = 1000;


// Definição da configuração partindo do serial 9600
void setup(){

    Serial.begin(9600);

}


// Definição da função responsavel pelo loop
void loop(){    


    // Definição da variavel do valor do sensor que sera o valor lido da const PINO_SENSOR_MQ2 
    int valorSensor = analogRead(PINO_SENSOR_MQ2);


    // Definição da porcentagem, por meio da conversão dos valores 
    float porcentagem = (
        (float)(valorSensor - VALOR_MINIMO) / 
        (VALOR_MAXIMO - VALOR_MINIMO)) * 100;

    // Caso a porcentagem seja menor que zero automaticamente sera definida como zero, afim de não permitir definições de dados negativo
    if(porcentagem < 0){

        porcentagem = 0;

    // Caso a porcentagem seja maior que cem automaticamente sera definida como cem, afim de manter dados maximos como 100%
    }else if(porcentagem > 100){


        porcentagem = 100;

    }

    // Mostrando na tela os valores do sensor e a porcentagem calculada 
    Serial.println(porcentagem);
    

    // Definição de um delay de 2000 milisegundos(2 segundos) para a efetuação da coleta de dados de novo
    delay(500);
    

}