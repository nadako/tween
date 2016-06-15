package easing;

class Sine {
    // Modeled after quarter-cycle of sine wave
    public static function easeIn(p:Float):Float {
        return Math.sin((p - 1) * (Math.PI / 2)) + 1;
    }

    // Modeled after quarter-cycle of sine wave (different phase)
    public static function easeOut(p:Float):Float {
        return Math.sin(p * (Math.PI / 2));
    }

    // Modeled after half sine wave
    public static function easeInOut(p:Float):Float {
        return 0.5 * (1 - Math.cos(p * Math.PI));
    }
}
