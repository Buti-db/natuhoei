shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

// HSV → RGB 変換
vec3 hsv2rgb(vec3 c) {
    vec4 K = vec4(1.0, 2.0/3.0, 1.0/3.0, 3.0);
    vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
    return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void fragment() {
    float hue = UV.x;          // 左→右で色相が変化
    float sat = 1.0;           // 彩度
    float val = 1.0;           // 明るさ

    vec3 rgb = hsv2rgb(vec3(hue, sat, val));
    COLOR = vec4(rgb, 1.0);
}


//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
