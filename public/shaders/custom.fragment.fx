#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

vec4 thermalColor(float intensity) {
    float t = intensity;
    vec4 color = vec4(0.0);

    // Map intensity to thermal color gradient
    if (t < 0.2) {
        // Black to Blue
        color = mix(vec4(0.0, 0.0, 0.0, 1.0), vec4(0.0, 0.0, 1.0, 1.0), t / 0.2);
    } else if (t < 0.4) {
        // Blue to Cyan
        color = mix(vec4(0.0, 0.0, 1.0, 1.0), vec4(0.0, 1.0, 1.0, 1.0), (t - 0.2) / 0.2);
    } else if (t < 0.6) {
        // Cyan to Green
        color = mix(vec4(0.0, 1.0, 1.0, 1.0), vec4(0.0, 1.0, 0.0, 1.0), (t - 0.4) / 0.2);
    } else if (t < 0.8) {
        // Green to Yellow
        color = mix(vec4(0.0, 1.0, 0.0, 1.0), vec4(1.0, 1.0, 0.0, 1.0), (t - 0.6) / 0.2);
    } else {
        // Yellow to Red
        color = mix(vec4(1.0, 1.0, 0.0, 1.0), vec4(1.0, 0.0, 0.0, 1.0), (t - 0.8) / 0.2);
    }
    return color;
}

void main() {
    // Get color from thermal texture and convert to black & white
    vec4 color = texture(image, model_uv);
    float intensity = 0.299 * color.r + 0.587 * color.g + 0.114 * color.b;

    // Apply thermal color map
    FragColor = thermalColor(intensity);
}
