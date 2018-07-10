attribute vec4 inPosition;
attribute vec4 inColor;
attribute vec2 inTexCoord;

varying lowp vec4 vColor;
varying mediump vec2 vTexCoord;

uniform mat4 uMPMatrix;

void main()
{
    vColor = inColor;
    vTexCoord = inTexCoord;
    gl_Position = uMPMatrix * inPosition;
}
