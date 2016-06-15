package easing;

class Expo {
    // Modeled after the exponential function y = 2^(10(x - 1))
    public static function easeIn(p:Float):Float {
        return (p == 0.0) ? p : Math.pow(2, 10 * (p - 1));
    }

    // Modeled after the exponential function y = -2^(-10x) + 1
    public static function easeOut(p:Float):Float {
        return (p == 1.0) ? p : 1 - Math.pow(2, -10 * p);
    }

    // Modeled after the piecewise exponential
    // y = (1/2)2^(10(2x - 1))         ; [0,0.5)
    // y = -(1/2)*2^(-10(2x - 1))) + 1 ; [0.5,1]
    public static function easeInOut(p:Float):Float {
        if (p == 0.0 || p == 1.0)
            return p;

        if (p < 0.5)
            return 0.5 * Math.pow(2, (20 * p) - 10);
        else
            return -0.5 * Math.pow(2, (-20 * p) + 10) + 1;
    }
}
