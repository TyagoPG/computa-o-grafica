#ifdef GL_ES
precision mediump float;
#endif

// Declaração da resolução da tela
uniform vec2 u_resolution;

// Função para plotar a curva
float plota(vec2 st, float pct){

    // Calcula a primeira parte da curva
    float v1 = smoothstep( pct-0.02, pct, st.y);
    // Calcula a segunda parte da curva
    float v2 = smoothstep( pct, pct+0.02, st.y);
    // Retorna a diferença entre as duas partes, resultando na curva
    return v1 - v2;
}
void main() {
    // Normaliza as coordenadas do fragmento para o intervalo [0, 1]
    vec2 st = gl_FragCoord.xy / u_resolution;
    // Calcula o valor da função para o eixo y (seno de 10 vezes x)
    float y = sin(10.0 * st.x);
    // Calcula o valor plotado da função
    float valor = plota(st, y);
    // Define a cor com base no valor plotado da função
    vec3 color = valor * vec3(0.0, 1.0, 0.0);
    // Define a cor final do fragmento
    gl_FragColor = vec4(color, 1.0);
}