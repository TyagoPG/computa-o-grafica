#ifdef GL_ES
precision mediump float;
#endif
// Declaração da resolução da tela
uniform vec2 u_resolution;
// Posição do mouse
uniform vec2 u_mouse;
// Tempo
uniform float u_time;
// Função para gerar números pseudoaleatórios com base em uma posição
float random(vec2 st) {
return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) *
43758.5453123);
}
void main() {
// Normaliza as coordenadas do fragmento para o intervalo [0, 1]
vec2 st = gl_FragCoord.xy / u_resolution.xy;
// Aplica uma escala de 10x no sistema de coordenadas
st *= 10.0;
// Pega a parte inteira das coordenadas
vec2 ipos = floor(st);
// Atribui um valor aleatório com base na coordenada inteira
vec3 color = vec3(random(ipos));
// Define a cor final do fragmento
gl_FragColor = vec4(color, 1.0);
}