#ifdef GL_ES
precision mediump float;
#endif
// Declaração da resolução da tela
uniform vec2 u_resolution;
void main() {
// Normaliza as coordenadas do fragmento para o intervalo [0, 1]
vec2 st = gl_FragCoord.xy / u_resolution;
float pct = 0.0;
// Calcula a distância entre o ponto atual e o ponto (0.5, 0.5)
pct = distance(st, vec2(0.5));
/*
// Calcula o tamanho do vetor do ponto atual até a origem (0,0)
vec2 centro = vec2(0.5) - st;
pct = length(centro);
*/
/*
// Usando a fórmula euclidiana para calcular a distância entre dois pontos no espaço 2D
vec2 centro = vec2(0.5) - st;
pct = sqrt(centro.x * centro.x + centro.y * centro.y);
*/
// Define a cor final do fragmento com base na distância calculada
vec3 color = vec3(pct);
gl_FragColor = vec4(color, 1.0);
}