// Constante para definição da entrada analógica 2
const int PINO_SENSOR_MQ2 = A2;

// Constante para a definição do valor mínimo de voltagem
const int VALOR_MINIMO = 100;

// Constante para a definição do valor máximo de voltagem    
const int VALOR_MAXIMO = 1000;

// Definição da configuração partindo do serial 9600
void setup() {
    Serial.begin(9600);
}

// Definição da função responsável pelo loop
void loop() {
    // Definição da variável do valor do sensor que será o valor lido da const PINO_SENSOR_MQ2 
    int valorSensor = analogRead(PINO_SENSOR_MQ2);

    // Definição da porcentagem, por meio da conversão dos valores 
    float porcentagem = (
        (float)(valorSensor - VALOR_MINIMO) / 
        (VALOR_MAXIMO - VALOR_MINIMO)) * 100;

    // Caso a porcentagem seja menor que zero, será definida como zero para não permitir valores negativos
    if (porcentagem < 0) {
        porcentagem = 0;
    } else if (porcentagem > 100) {
        porcentagem = 100;
    }

    // Mostrando na tela os valores do sensor e a porcentagem calculada
    Serial.print("porcentagem:");
    Serial.print(porcentagem);
    Serial.print(" ");
    Serial.print("Perigo:");
    Serial.println(15);

    // Definição de um delay de 500 milissegundos para a coleta de novos dados
    delay(500);
}
