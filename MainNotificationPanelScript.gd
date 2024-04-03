extends Panel

func _on_notification_button_mouse_entered():
	$MainNotificationButton/MainCloseNotification.show()

func _on_notification_button_mouse_exited():
	$MainNotificationButton/MainCloseNotification.hide()
