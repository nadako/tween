package easing;

class Elastic {
    // Modeled after the damped sine wave y = sin(13pi/2*x)*pow(2, 10 * (x - 1))
    public static function easeIn(p:Float):Float {
        return Math.sin(13 * (Math.PI / 2) * p) * Math.pow(2, 10 * (p - 1));
    }

    // Modeled after the damped sine wave y = sin(-13pi/2*(x + 1))*pow(2, -10x) + 1
    public static function easeOut(p:Float):Float {
        return Math.sin(-13 * (Math.PI / 2) * (p + 1)) * Math.pow(2, -10 * p) + 1;
    }

    // Modeled after the piecewise exponentially-damped sine wave:
    // y = (1/2)*sin(13pi/2*(2*x))*pow(2, 10 * ((2*x) - 1))      ; [0,0.5)
    // y = (1/2)*(sin(-13pi/2*((2x-1)+1))*pow(2,-10(2*x-1)) + 2) ; [0.5, 1]
    public static function easeInOut(p:Float):Float {
        if (p < 0.5)
            return 0.5 * Math.sin(13 * (Math.PI / 2) * (2 * p)) * Math.pow(2, 10 * ((2 * p) - 1));
        else
            return 0.5 * (Math.sin(-13 * (Math.PI / 2) * ((2 * p - 1) + 1)) * Math.pow(2, -10 * (2 * p - 1)) + 2);
    }
}
