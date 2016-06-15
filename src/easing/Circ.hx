package easing;

class Circ {
    // Modeled after shifted quadrant IV of unit circle
    public static function easeIn(p:Float):Float {
        return 1 - Math.sqrt(1 - (p * p));
    }

    // Modeled after shifted quadrant II of unit circle
    public static function easeOut(p:Float):Float {
        return Math.sqrt((2 - p) * p);
    }

    // Modeled after the piecewise circular function
    // y = (1/2)(1 - sqrt(1 - 4x^2))           ; [0, 0.5)
    // y = (1/2)(sqrt(-(2x - 3)*(2x - 1)) + 1) ; [0.5, 1]
    public static function easeInOut(p:Float):Float {
        if (p < 0.5)
            return 0.5 * (1 - Math.sqrt(1 - 4 * (p * p)));
        else
            return 0.5 * (Math.sqrt(-((2 * p) - 3) * ((2 * p) - 1)) + 1);
    }
}
