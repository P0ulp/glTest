
uniform mat4 transform;
uniform mat4 projection;
uniform mat4 modelview;
attribute vec4 position;

uniform mat4 matShader;

varying vec4 pos;

void main() {

	pos = position * modelview * matShader;
	//gl_Position = transform * position;
	gl_Position = projection * modelview * position;
	//gl_Position = matShader * modelview * transform * position;

}