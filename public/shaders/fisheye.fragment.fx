#version 300 es
precision mediump float;

// Input
in vec2 model_uv;

// Uniforms
uniform sampler2D image;

// Output
out vec4 FragColor;

void main() {
    // Scale and translate texture coord
    vec2 coord = model_uv * 2.0 - 1.0;

    // Calculate theta and radius
    float theta = atan(coord.y, coord.x);
    float radius = pow(length(coord), 1.5);

    // Calculate fish eye texture coord
    vec2 fishEyeCoord = radius * vec2(cos(theta), sin(theta));

    // Re-scale final texture coord
    vec2 finalCoord = 0.5 * (fishEyeCoord + 1.0);

    // Get the color texture using transformed coords
    vec4 color = texture(image, finalCoord);

    // Output color
    FragColor = color;
}
