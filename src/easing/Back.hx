package easing;

class Back {
    // Modeled after the overshooting cubic y = x^3-x*Math.sin(x*pi)
    public static function easeIn(p:Float):Float {
        return p * p * p - p * Math.sin(p * Math.PI);
    }

    // Modeled after overshooting cubic y = 1-((1-x)^3-(1-x)*Math.sin((1-x)*pi))
    public static function easeOut(p:Float):Float {
        var f = (1 - p);
        return 1 - (f * f * f - f * Math.sin(f * Math.PI));
    }

    // Modeled after the piecewise overshooting cubic function:
    // y = (1/2)*((2x)^3-(2x)*sin(2*x*pi))           ; [0, 0.5)
    // y = (1/2)*(1-((1-x)^3-(1-x)*sin((1-x)*pi))+1) ; [0.5, 1]
    public static function easeInOut(p:Float):Float {
        if (p < 0.5) {
            var f = 2 * p;
            return 0.5 * (f * f * f - f * Math.sin(f * Math.PI));
        } else {
            var f = (1 - (2 * p - 1));
            return 0.5 * (1 - (f * f * f - f * Math.sin(f * Math.PI))) + 0.5;
        }
    }
}
