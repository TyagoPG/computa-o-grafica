// Define a precisão dos números de ponto flutuante no WebGL.
precision mediump float;

// Uniforme que armazena a resolução da tela.
uniform vec2 u_resolution;

void main() {
    // Normalizamos a posição do pixel em relação à resolução da tela,
    // para que ambas as coordenadas fiquem na mesma faixa de valores
    //(entre 0 e 1).
    vec2 st = gl_FragCoord.xy / u_resolution.xy;
    // Define uma cor inicial (vermelho escuro) para o fragmento.
    vec3 color = vec3(0.6745, 0.3412, 0.3412);
    // Verifica se a coordenada x normalizada do fragmento está dentro
    //de um intervalo específico.
    // Se estiver, define a cor do fragmento como preto (0,0,0), caso
    //contrário, mantém a cor inicial.
    if(st.x > 0.900 && st.x < 0.903){
    color = vec3(0.0); // Define a cor como preto
    }
    // Define a cor final do fragmento com base na cor calculada e
    //define a transparência como 1.0 (completamente opaco).
    gl_FragColor = vec4(color, 1.0);
}