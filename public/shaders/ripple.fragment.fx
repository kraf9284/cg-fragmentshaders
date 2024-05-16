#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;
uniform float time;

// Output
out vec4 FragColor;

void main() {
    // Scale and translate texture coord
    vec2 coord = model_uv * 2.0 - 1.0;

    // Calculate radius
    float radius = length(coord);

    // Calculate texture coord offset
    vec2 offset = coord * (sin(radius * 30.0 - time * 5.0) + 0.5) / 60.0;

    // Calculate final texture coord
    vec2 finalCoord = model_uv + offset;

    // Get color from texture using transformed coord
    vec4 color = texture(image, finalCoord);

    // Output color
    FragColor = color;
}
