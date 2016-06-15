package easing;

class Quad {
    // Modeled after the parabola y = x^2
    public static function easeIn(p:Float):Float {
        return p * p;
    }

    // Modeled after the parabola y = -x^2 + 2x
    public static function easeOut(p:Float):Float {
        return -(p * (p - 2));
    }

    // Modeled after the piecewise quadratic
    // y = (1/2)((2x)^2)             ; [0, 0.5)
    // y = -(1/2)((2x-1)*(2x-3) - 1) ; [0.5, 1]
    public static function easeInOut(p:Float):Float {
        if (p < 0.5)
            return 2 * p * p;
        else
            return (-2 * p * p) + (4 * p) - 1;
    }
}
