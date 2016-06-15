import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.input.Mouse;
import kha.math.Vector2i;

import easing.*;

class Main {
	public static function main() {
		System.init({title: "Tween & Ease", width: 1024, height: 768}, function() new Main());
	}

	var lastTime:Float;
	var tween:Tween;
	var points:Array<Vector2i>;
	var easingIndex:Int;
	static var easings:Array<{function easeInOut(p:Float):Float;}> = [Back, Bounce, Circ, Cube, Elastic, Expo, Quad, Quart, Quint, Sine]; 
	
	static inline var SIZE = 10;
	static inline var MARGIN = 100;

	function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
		Mouse.get().notify(onMouseDown, null, null, null);
		easingIndex = 0;
		lastTime = Scheduler.time();
	}
	
	function onMouseDown(_, _, _) {
		var ww = System.windowWidth() - MARGIN * 2 - SIZE;
		var wh = System.windowHeight() - MARGIN * 2 - SIZE;
		var idx = easingIndex++;
		if (easingIndex >= easings.length)
			easingIndex = 0;
		var easing = easings[idx];
		trace(Type.getClassName(cast easing));
		points = [new Vector2i(MARGIN, wh)];
		tween = new Tween(wh, MARGIN, 1, easing.easeInOut, function(t, v) {
			var x = Std.int(MARGIN + ww * t); 
			var y = Std.int(v);
			points.push(new Vector2i(x, y));
		});
	}

	function update(): Void {
		var currentTime = Scheduler.time();
		var deltaTime = currentTime - lastTime;
		lastTime = currentTime;
		if (tween != null)
			tween.update(deltaTime);
	}

	function render(framebuffer: Framebuffer): Void {
		if (points == null)
			return;
		var g = framebuffer.g2;
		g.begin();
		g.color = kha.Color.White;
		for (point in points) {
			g.fillRect(point.x, point.y, SIZE, SIZE);
		}
		g.end();				
	}
}
