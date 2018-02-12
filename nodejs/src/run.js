var getPixels = require('get-pixels');

for (q = 0; q < 100; q++) {
	getPixels("frame.jpg", function(err, pixels){
		const desired = 200;
		const directions = [
			{'x':1,'y':0},
			{'x':0,'y':1},
			{'x':-1,'y':0},
			{'x':0,'y':-1},
		];
		var out = [];
		directions.forEach(function(direction) {
			current = 0;
        	x = 300;
        	y = 700;
        	while (current < desired) {
        		r = pixels.get(x, y, 0);
				g = pixels.get(x, y, 1);
				b = pixels.get(x, y, 2);
				
				current = (256 * 3) - r - g - b;
				x += direction['x']
				y += direction['y']
        	}
        	if (x < 300) {
           		out['right'] = x;
        	}
        	if (x > 300) {
            	out['left'] = x;
        	}
        	if (y < 700 ) {
            	out['top'] = y;
        	}
        	if (y > 700 ) {
            	out['bottom'] = y;
        	}
        })
        console.log(out);
	});
}