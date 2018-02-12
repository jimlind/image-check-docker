extern crate image;

use std::collections::HashMap;

// use std::f32;
// use std::fs::File;
use std::path::Path;

use image::GenericImage;
// use image::Pixels;
// use image::Pixel;

fn init(input_path: &str) {
    let img = image::open(&Path::new(input_path)).unwrap();
    let desired = 200;
    let mut out = HashMap::new();
    for direction in &directions() {
        let mut current = 0i16;
        let mut x = 300i32;
        let mut y = 700i32;
        
        while (current < desired) {
            let pixel = img.get_pixel(x as u32, y as u32);
            current = (256i16 * 3) - pixel[0] as i16 - pixel[1] as i16 - pixel[2] as i16;
            
            x += direction[&'x'];
            y += direction[&'y'];
        }

        if (x < 300) {
           out.insert("right", x);
        }
        if (x > 300) {
            out.insert("left", x);
        }
        if (y < 700 ) {
            out.insert("top", y);
        }
        if (y > 700 ) {
            out.insert("bottom", y);
        }
    }

    println!("top:{}, bottom:{}, left:{}, right:{}", out[&"top"], out[&"bottom"], out[&"left"], out[&"right"])
}

fn directions() -> [std::collections::HashMap<char, i32>; 4] {
    let mut direction_right = HashMap::new();
    direction_right.insert('x', 1i32);
    direction_right.insert('y', 0i32);

    let mut direction_top = HashMap::new();
    direction_top.insert('x', 0i32);
    direction_top.insert('y', 1i32);

    let mut direction_left = HashMap::new();
    direction_left.insert('x', -1i32);
    direction_left.insert('y', 0i32);

    let mut direction_bottom = HashMap::new();
    direction_bottom.insert('x', 0i32);
    direction_bottom.insert('y', -1i32);

    return [direction_right, direction_top, direction_left, direction_bottom];
}

fn main() {
    for _q in 1..100 {
        init("frame.jpg");
    }
}