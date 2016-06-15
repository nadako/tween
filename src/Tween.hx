class Tween {
	var start:Float;
	var delta:Float;
	var time:Float;
	var duration:Float;
	var set:Float->Float->Void;
	var ease:Float->Float;
	var finished:Bool;
	
	public function new(from:Float, to:Float, duration:Float, ease:Float->Float, set:Float->Float->Void) {
		this.start = from;
		this.delta = to - from;
		this.duration = duration;
		this.set = set;
		this.ease = ease;
		time = 0;
		finished = false;
	}
	
	public function update(dt:Float) {
		if (finished)
			return;
			
		time += dt;
		if (time >= duration) {
			set(1, start + delta);
			finished = true;
		} else {
			var t = time / duration;
			set(t, start + ease(t) * delta);
		}
	} 
}
