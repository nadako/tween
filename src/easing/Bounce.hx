package easing;

class Bounce {
    public static function easeIn(p:Float):Float {
        return 1 - easeOut(1 - p);
    }

    public static function easeOut(p:Float):Float {
        if (p < 4 / 11)
            return (121 * p * p) / 16;
        else if (p < 8 / 11)
            return (363 / 40 * p * p) - (99 / 10 * p) + 17 / 5;
        else if (p < 9 / 10)
            return (4356 / 361 * p * p) - (35442 / 1805 * p) + 16061 / 1805;
        else
            return (54 / 5 * p * p) - (513 / 25 * p) + 268 / 25;
    }

    public static function easeInOut(p:Float):Float {
        if (p < 0.5)
            return 0.5 * easeIn(p * 2);
        else
            return 0.5 * easeOut(p * 2 - 1) + 0.5;
    }
}
