extends StaticBody2D

@export var TimeActivated: String


func _process(_delta: float) -> void:
    var should_be_active = (Globals.currentTime == TimeActivated)
    
    var is_currently_disabled = $CollisionShape2D.disabled
    
    if should_be_active and is_currently_disabled:
        $CollisionShape2D.set_deferred("disabled", false)
        $TextureRect.visible = true 
        
    elif not should_be_active and not is_currently_disabled:
        $CollisionShape2D.set_deferred("disabled", true)
        $TextureRect.visible = false