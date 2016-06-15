package easing;

class Quart {
    // Modeled after the quartic x^4
    public static function easeIn(p:Float):Float {
        return p * p * p * p;
    }

    // Modeled after the quartic y = 1 - (x - 1)^4
    public static function easeOut(p:Float):Float {
        var f = (p - 1);
        return f * f * f * (1 - p) + 1;
    }

    // Modeled after the piecewise quartic
    // y = (1/2)((2x)^4)        ; [0, 0.5)
    // y = -(1/2)((2x-2)^4 - 2) ; [0.5, 1]
    public static function easeInOut(p:Float):Float {
        if (p < 0.5) {
            return 8 * p * p * p * p;
        } else {
            var f = (p - 1);
            return -8 * f * f * f * f + 1;
        }
    }
}
