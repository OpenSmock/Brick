event handling
handleCursorLeftBoundReached: anEvent
	| aTextEditElement aTextEditIndex |

	aTextEditElement := anEvent target.
	aTextEditElement removeCursor: anEvent cursorElement.
	
	aTextEditIndex := aTextEditElement parent children indexOf: aTextEditElement.
	
	(aTextEditIndex - 1 to: 1 by: -1)
		detect: [ :anElementIndex | (aTextEditElement parent children at: anElementIndex) hasFocusable ]
		ifFound: [ :anElementIndex |
			| aPreviousElement |
			aPreviousElement := aTextEditElement parent children at: anElementIndex.
			aPreviousElement dispatchEvent: (BlTextCursorEntersFromRightBound new) ]