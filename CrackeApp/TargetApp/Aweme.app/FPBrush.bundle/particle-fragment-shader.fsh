precision mediump float;

varying vec4 vColor;
varying vec2 vTexCoord;

uniform sampler2D uTexture;

void main()
{
    vec4 tex = texture2D(uTexture, vTexCoord);
    gl_FragColor = vec4(vColor.rgb * tex.rgb * vColor.a, vColor.a * tex.a);
}
