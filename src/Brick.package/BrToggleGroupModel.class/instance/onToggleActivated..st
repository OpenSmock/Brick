as yet unclassified
onToggleActivated: aToggle
	self toggles
		select: [ :eachToggle | eachToggle ~~ aToggle ]
		thenDo: #deactivate