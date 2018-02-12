#!/usr/bin/python

from PIL import Image

desired = 200
directions = [
    {'x':1,'y':0},
    {'x':0,'y':1},
    {'x':-1,'y':0},
    {'x':0,'y':-1},
]

out = {}
for q in range(100):
    img = Image.open('frame.jpg')

    for direction in directions:
        current = 0
        x = 300
        y = 700

        while current < desired:
            r,g,b = img.getpixel((x,y))
            x = x + direction['x']
            y = y + direction['y']

            current = (256 * 3) - r - g - b;

        if x < 300:
           out['right'] = x
        if x > 300:
            out['left'] = x
        if y < 700:
            out['top'] = y
        if y > 700:
            out['bottom'] = y
        
    print(out)

