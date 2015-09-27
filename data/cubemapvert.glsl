
uniform mat4 transform;
uniform mat4 projection;
uniform mat4 modelview;
uniform mat4 modelviewP;
uniform mat4 modelviewInv;

attribute vec4 position;

varying vec4 pos;

void main() {

	pos = position * modelviewInv;
	gl_Position = projection * position;

}