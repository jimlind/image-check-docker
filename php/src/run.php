<?php

foreach (range(1, 100) as $q) {
    $im = imagecreatefromjpeg("frame.jpg");
    $desired = 200;
    $directions = [
        ['x'=>1,'y'=>0],
        ['x'=>0,'y'=>1],
        ['x'=>-1,'y'=>0],
        ['x'=>0,'y'=>-1],
    ];

    $out = [];
    foreach ($directions as $direction) {
        $current = 0;
        $x = 300;
        $y = 700;
        while ($current < $desired) {
            $rgb = imagecolorat($im, $x, $y);
            $colors = imagecolorsforindex($im, $rgb);
            $current = (256 * 3) - $colors['red'] - $colors['green'] - $colors['blue'];
            $x += $direction['x'];
            $y += $direction['y'];
        }
        if ($x < 300) {
           $out['right'] = $x;
        }
        if ($x > 300) {
            $out['left'] = $x;
        }
        if ($y < 700 ) {
            $out['top'] = $y;
        }
        if ($y > 700 ) {
            $out['bottom'] = $y;
        }
    }
    print_r($out);
    echo PHP_EOL;
}