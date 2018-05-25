// Porch and Roof
// © 2018 William Barkoff

cube([40, 20, 4]); //porch floor

translate([40,20,18]) {
    rotate([0,0,180]) {
        roof();    
    }
}

//translate([50, 0, 0]) 
//    roof();


postPositions = [
    [0,0,0],
    [0, 19, 0],
    [39, 19, 0],
    [39, 0, 0],
    [39, 9.5, 0],
    [0, 9.5, 0],
    [14.5, 19, 0],
    [25.5, 19, 0]
];

halfPostPositions = [
    [0,0,0],
    [0, 19, 0],
    [39, 19, 0],
    [39, 0, 0],
    [39, 9.5, 0],
    [0, 9.5, 0],
    [14.5, 19, 0],
    [25.5, 19, 0]
];

for (position = postPositions) {
    translate(position) {
        post();
    }
}

translate([39,0,9]) {
    cube([1, 20, 1]);
}
translate([0,0,9]) {
    cube([1, 20, 1]);
}

translate([0, 19, 9]) {
    cube([15,1,1]);
}

translate([26, 19, 9]) {
    cube([14,1,1]);
}

for(a = [0:2:15]) {
    translate([a, 19, 0]){
        halfPost();
    }
}

for(a = [26.5:2:39]) {
    translate([a, 19, 0]){
        halfPost();
    }
}

for(a = [0:2:19]) {
    translate([39, a, 0]){
        halfPost();
    }
    translate([0, a, 0]){
        halfPost();
    }
}

translate([15, 20, 0]){
    cube([10, 2, 4]);
    translate([0, 2, 0]) {
        cube([10, 2, (2/3)*4]);
    }
    translate([0,4,0]){
        cube([10, 2, (1/3)*4]);
    }
}

module post() {
    translate([0,0,4]) {
        cube([1, 1, 14]);
    }
}

module roof(l, w, h){
    triangularPrisim(40, 20, 5);
    for(x=[0:4:36]) {
        translate([x, 0, 0]) {
            rotate([14, 0, 0]) {
                cube([4,4, rands(0,0.5,1)[0]]);
            }
        }
        translate([x, 4, 0]) {
            rotate([14, 0, 0]) {
                cube([4,4, rands(1.2,1.7,1)[0]]);
            }
        }
        translate([x, 8, 0]) {
            rotate([14, 0, 0]) {
                cube([4,4, rands(2.4,2.9,1)[0]]);
            }
        }
        translate([x, 12, 0]) {
            rotate([14, 0, 0]) {
                cube([4,4, rands(3.6,4.1,1)[0]]);
            }
        }
        translate([x, 16, 0]) {
            rotate([14, 0, 0]) {
                cube([4,4, rands(4.8,5.3,1)[0]]);
            }
        }
    }
}

module triangularPrisim(l, w, h) {
    polyhedron(
        points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

module halfPost() {
    translate([0,0,4]) {
        cube([1,1,5]);
    }
}