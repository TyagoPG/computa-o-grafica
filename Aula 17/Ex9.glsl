// Define a precisão dos números de ponto flutuante no WebGL.
precision mediump float;

// Uniforme que armazena a resolução da tela.
uniform vec2 u_resolution;

// Função para plotar uma linha suave entre duas posições especificadas, usando shaping functions.

float plota(vec2 st, float pct) {
    // A função smoothstep cria uma transição suave entre dois valores.
    // v1 começa a transição de 0 para 1 à medida que st.y se aproxima de pct-0.02.
    float v1 = smoothstep(pct - 0.02, pct, st.y);
    // v2 começa a transição de 0 para 1 à medida que st.y se aproxima de pct+0.02.
    float v2 = smoothstep(pct, pct + 0.02, st.y);
    // Subtraindo v2 de v1, obtemos um valor que é 1 quando st.y está próximo de pct,
    // e uma transição suave de 0 para 1 ao redor dessa linha.
    return v1 - v2;
}
void main() {
    // Normalizamos a posição do pixel em relação à resolução da tela,
    // para que ambas as coordenadas fiquem na mesma faixa de valores (entre 0 e 1).
    vec2 st = gl_FragCoord.xy / u_resolution;
    // Define y como uma função linear da coordenada x (y = x).
    // Isso representa a função f(x) = x, ou seja, uma linha diagonal através da tela.
    float y = st.x;
    // Calcula o valor da linha suave em st utilizando a função plota.
    float valor = plota(st, y);
    // Define a cor da linha como verde (0.0, 1.0, 0.0).
    vec3 lineColor = vec3(0.0, 1.0, 0.0);
    // Define a cor do fundo como branco (1.0, 1.0, 1.0).
    vec3 backgroundColor = vec3(1.0, 1.0, 1.0);
    // A cor final do fragmento é uma interpolação entre a cor da linha e a cor de fundo.
    //Quando retorno for 0 Plota baclground, quando retorno for 1 plota a linha
    vec3 color = mix(backgroundColor, lineColor, valor);
    // Define a cor final do fragmento com base na cor calculada e define a transparência como 1.0 (completamente opaco).
    gl_FragColor = vec4(color, 1.0);
}