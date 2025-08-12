// Conservative Cyberpunk Tint Shader for Hyprland
// Enhances purple/blue cyberpunk aesthetic very subtly
// Compatible with OpenGL 3.3 Core

#version 330 core

precision highp float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {
    // Get the original pixel color
    vec4 pixColor = texture2D(tex, v_texcoord);
    
    // Define subtle cyberpunk enhancement factors
    float purpleBoost = 1.05;   // Very subtle purple enhancement
    float blueBoost = 1.08;     // Slightly more blue enhancement
    float warmthReduction = 0.98; // Slightly reduce warm tones
    
    // Apply conservative color adjustments
    vec3 enhanced = pixColor.rgb;
    
    // Enhance blue channel slightly
    enhanced.b *= blueBoost;
    
    // Enhance purple tones (combination of red and blue)
    if (enhanced.r > 0.3 && enhanced.b > 0.3) {
        enhanced.r *= purpleBoost;
        enhanced.b *= purpleBoost;
    }
    
    // Slightly reduce warm tones for cooler cyberpunk feel
    enhanced.r *= warmthReduction;
    enhanced.g *= warmthReduction;
    
    // Ensure we don't exceed color bounds
    enhanced = clamp(enhanced, 0.0, 1.0);
    
    // Output final color with original alpha
    gl_FragColor = vec4(enhanced, pixColor.a);
}