#include<iostream>
#include<SDL2/SDL.h>
#include<SDL2/SDL_image.h>

using namespace std;

Uint32 getPixel(SDL_Surface *surface, int x, int y) {
    int bpp = surface->format->BytesPerPixel;
    Uint8 *p = (Uint8 *)surface->pixels + y * surface->pitch + x * bpp;
    return *(Uint32*)p;
}

Uint32 getCurrent(SDL_Surface *surface, int x, int y) {
    Uint32 pixel;
    Uint8 r, g, b;

    pixel = getPixel(surface, x, y);    
    SDL_GetRGB(pixel, surface->format, &r, &g, &b);

    return (256 * 3) - r - g - b;
}

struct direction {
   int x;
   int y;
};

struct output {
   Uint32 top;
   Uint32 bottom;
   Uint32 left;
   Uint32 right;
};

int main(void) {
    struct direction d1;
    d1.x = 1;
    d1.y = 0;
    struct direction d2;
    d2.x = 0;
    d2.y = 1;
    struct direction d3;
    d3.x = -1;
    d3.y = 0;
    struct direction d4;
    d4.x = 0;
    d4.y = -1;

    struct direction directions[4];
    directions[0] = d1;
    directions[1] = d2;
    directions[2] = d3;
    directions[3] = d4;

    struct output out;

    IMG_Init(IMG_INIT_JPG);
    Uint8 a;
    for( a = 0; a < 100; a = a + 1 ) {
        SDL_Surface * image = IMG_Load("frame.jpg");
        int i = 0;
        for( i = 0; i < 4; i++ ) {
            Uint8 desired = 200;
            Uint8 current = 0;

            Uint32 x = 300;
            Uint32 y = 700;

            struct direction d = directions[i];
            while (desired > current) {
                x = x + d.x;
                y = y + d.y;
                current = getCurrent(image, x, y);
            }

            if (x < 300) {
                out.right = x;
            }
            if (x > 300) {
                out.left = x;
            }
            if (y < 700 ) {
                out.top = y;
            }
            if (y > 700 ) {
                out.bottom = y;
            }
        }
        printf("[right:%d, left:%d, top:%d, bottom:%d]\n", out.right, out.left, out.top, out.bottom);
    }
    IMG_Quit();
    return 0;
}