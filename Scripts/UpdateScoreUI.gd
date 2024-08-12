extends RichTextLabel

func _ready():
	Signals.connect("updatescore", self, "update_score")

func update_score(score):
	self.text = String(score)




