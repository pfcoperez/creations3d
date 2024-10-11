lBase = 300;

module negativeFractal(n, position, l) {
    for (x = [0:1:2]) {
        for (y = [0:1:2]) {
            for (z = [0:1:2]) {
                isCrux = ((x == 1 || y == 1) && z == 1) || ((x == 1 || z == 1) && y == 1);
                subPosition = position + [x*l, y*l, z*l];
                if (isCrux) {
                    translate(subPosition) {
                        cube([l, l, l]);
                    }
                } else if(n > 0) {
                    negativeFractal(n - 1, subPosition, l/3);
                }
            }
        }
    }
}

difference() {
    cube([lBase, lBase, lBase]);
    negativeFractal(2, [0, 0, 0], lBase/3);
}