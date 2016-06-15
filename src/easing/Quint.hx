package easing;

class Quint {
    // Modeled after the quintic y = x^5
    public static function easeIn(p:Float):Float {
        return p * p * p * p * p;
    }

    // Modeled after the quintic y = (x - 1)^5 + 1
    public static function easeOut(p:Float):Float {
        var f = (p - 1);
        return f * f * f * f * f + 1;
    }

    // Modeled after the piecewise quintic
    // y = (1/2)((2x)^5)       ; [0, 0.5)
    // y = (1/2)((2x-2)^5 + 2) ; [0.5, 1]
    public static function easeInOut(p:Float):Float {
        if (p < 0.5) {
            return 16 * p * p * p * p * p;
        } else {
            var f = ((2 * p) - 2);
            return  0.5 * f * f * f * f * f + 1;
        }
    }
}
