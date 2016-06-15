import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.input.Mouse;

class Main {
	public static function main() {
		System.init({title: "Tween & Ease", width: 1024, height: 768}, function() new Main());
	}

	var lastTime:Float;
	var tween:Tween;
	var x:Int;
	
	static inline var SIZE = 30;
	static inline var MARGIN = 100;

	function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
		Mouse.get().notify(onMouseDown, null, null, null);
		x = MARGIN;
		lastTime = Scheduler.time();
	}
	
	function onMouseDown(_, _, _) {
		x = MARGIN;
		tween = new Tween(x, System.windowWidth() - SIZE - MARGIN, 1, easing.Quad.easeInOut, function(v) x = Std.int(v));
	}

	function update(): Void {
		var currentTime = Scheduler.time();
		var deltaTime = currentTime - lastTime;
		lastTime = currentTime;
		if (tween != null)
			tween.update(deltaTime);
	}

	function render(framebuffer: Framebuffer): Void {
		var g = framebuffer.g2;
		g.begin();
		g.color = kha.Color.White;
		g.fillRect(x, (System.windowHeight() - SIZE) / 2, SIZE, SIZE);
		g.end();				
	}
}
