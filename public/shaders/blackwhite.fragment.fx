#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Color
    vec4 color = texture(image, model_uv);
    
    // Calculate luminance
    float luminance = 0.299 * color.r + 0.587 * color.g + 0.114 * color.b;
    
    // Assign the luminance to all color components
    FragColor = vec4(vec3(luminance), color.a);
}
