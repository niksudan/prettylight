/// @description  Example object that moves around

if (keyboard_check(vk_left)) {
    x -= 13;
} else if (keyboard_check(vk_right)) {
    x += 13;
}

if (keyboard_check(vk_up)) {
    y -= 13;
} else if (keyboard_check(vk_down)) {
    y += 13;
}

