varying vec4 pos;

void main() { 
	if(pos.x > 0.0){ 
		gl_FragColor = vec4(1,0,0,1); 
	} 
	else{ 
		gl_FragColor = vec4(0,0,1,1); 
	} 
}