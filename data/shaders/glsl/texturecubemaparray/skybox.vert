#version 450

layout (location = 0) in vec3 inPos;

layout (binding = 0) uniform UBO 
{
	mat4 projection;
	mat4 model;
	mat4 invModel;
	float lodBias;
	int cubeMapIndex;
} ubo;

layout (location = 0) out vec3 outUVW;

void main() 
{
	outUVW = inPos;
	outUVW.yz *= -1.0f;
	gl_Position = ubo.projection * ubo.model * vec4(inPos.xyz, 1.0);
}
