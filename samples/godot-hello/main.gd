extends Node2D
# Minimal sample for the Vapour docs: a square bouncing around a label.

var t := 0.0

func _process(delta: float) -> void:
	t += delta
	queue_redraw()

func _draw() -> void:
	var size := get_viewport_rect().size
	var c := size / 2.0
	draw_rect(Rect2(Vector2.ZERO, size), Color("#09090b"))
	var p := c + Vector2(sin(t * 2.0) * 160.0, cos(t * 3.0) * 80.0)
	draw_rect(Rect2(p - Vector2(24, 24), Vector2(48, 48)), Color("#3b6cff"))
	draw_string(ThemeDB.fallback_font, c + Vector2(-70, 140), "Hello, Vapour", HORIZONTAL_ALIGNMENT_LEFT, -1, 24)
