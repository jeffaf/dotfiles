// Neutral Pass-Through Shader for Hyprland
// Does nothing - used to disable other shaders safely

#version 330 core

precision highp float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    // Simple pass-through - no modifications
    gl_FragColor = texture2D(tex, v_texcoord);
}