Class {
	#name : #BrTextEditorInserterExamples,
	#superclass : #BrTextEditorOperatorExamples,
	#category : #'Brick-Editor-Examples - Operators'
}

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> filter_insert_Hello123Symbols_onlyAlphaNumeric [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.	
	anEditor editor moveCursorTo: 0.

	anEditor inserter
		at: 0;
		string: 'Hello123$#^)';
		onlyAlphaNumeric;
		insert.

	self assert: anEditor text asString equals: ('Hello123', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 8 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> filter_insert_Hello123_onlyDigits [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.	
	anEditor editor moveCursorTo: 0.

	anEditor inserter
		at: 0;
		string: 'Hello123';
		onlyDigits;
		insert.

	self assert: anEditor text asString equals: ('123', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 3 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> filter_insert_Hello123_onlyLetters [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.	
	anEditor editor moveCursorTo: 0.

	anEditor inserter
		at: 0;
		string: 'Hello123';
		onlyLetters;
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 5 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_atCursorAt_0_and_1_selection_no [
	<gtExample>
	<description: '"Insertion at multiple cursors'>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor navigator
		addAt: 0;
		addAt: 1;
		apply.

	anEditor inserter
		atCursor;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', (self multilineText from: 1 to: 1) asString, 'Hello', (self multilineText from: 2 to: self multilineText size) asString).
	self assert: anEditor cursors allCursors equals: {
		BrTextEditorSingleCursor new position: 5.
		BrTextEditorSingleCursor new position: 11 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_0_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 0 to: 0.
	
	anEditor inserter
		at: 0;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 5 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_0_selection_0_to_1 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 0 to: 1.

	anEditor inserter
		at: 0;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', (self multilineText from: 2 to: self multilineText size) asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 5 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 10.
	
	anEditor editor select: 0 to: 1. "A"
	anEditor editor select: 8 to: 14. " river"

	anEditor inserter
		at: 0;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', (self multilineText from: 2 to: 7) asString, (self multilineText from: 14 to: self multilineText size) asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 12 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14_no_delete [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 10.
	anEditor editor select: 0 to: 1. "A"
	anEditor editor select: 8 to: 14. " river"

	anEditor inserter
		at: 0;
		string: 'Hello';
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 15 }.
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 5 to: 6.
		BlSelection from: 13 to: 19.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14_no_delete_no_selection [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 10.
	anEditor editor select: 0 to: 1. "A"
	anEditor editor select: 8 to: 14. " river"

	anEditor inserter
		at: 0;
		string: 'Hello';
		withoutSelectionDelete;
		withoutSelectionUpdate;
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 15 }.
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 0 to: 1.
		BlSelection from: 8 to: 14.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_10_selection_0_to_1_and_8_to_14_no_delete_no_selection_no_cursor [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 10.
	anEditor editor select: 0 to: 1. "A"
	anEditor editor select: 8 to: 14. " river"

	anEditor inserter
		at: 0;
		string: 'Hello';
		withoutSelectionDelete;
		withoutSelectionUpdate;
		withoutCursorUpdate;
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 10 }.
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 0 to: 1.
		BlSelection from: 8 to: 14.
	}.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_0_cursorAt_5_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 5.
	anEditor editor select: 0 to: 0.

	anEditor inserter
		at: 0;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: ('Hello', self multilineText asString).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 10 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_1_cursorAt_0_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 0.
	anEditor editor select: 0 to: 0.
	
	anEditor inserter
		at: 1;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: (self multilineText first asString, 'Hello', ((self multilineText from: 2 to: self multilineText size) asString)).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 0 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - insertion' }
BrTextEditorInserterExamples >> insert_Hello_at_1_cursorAt_1_selection_0_to_0 [
	<gtExample>
	| anEditor |
	
	anEditor := self editorOnMultilineText.
	anEditor editor moveCursorTo: 1.
	anEditor editor select: 0 to: 0.
	
	anEditor inserter
		at: 1;
		string: 'Hello';
		insert.

	self assert: anEditor text asString equals: (self multilineText first asString, 'Hello', ((self multilineText from: 2 to: self multilineText size) asString)).
	self assert: anEditor cursors allCursors equals: { BrTextEditorSingleCursor new position: 6 }.
	self assert: anEditor selection isEmpty.

	^ anEditor
]

{ #category : #'examples - indentation' }
BrTextEditorInserterExamples >> insert_indentation_selection_0_to_1 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor selecter
		from: 0 to: 1;
		select.

	anEditor inserter
		indentation;
		beforeSelectedLines;
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: (String tab, self multilineText asString).
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 1 to: 2.
	}.

	^ anEditor
]

{ #category : #'examples - indentation' }
BrTextEditorInserterExamples >> insert_indentation_selection_0_to_41 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor selecter
		from: 0 to: 41;
		select.

	anEditor inserter
		indentation;
		beforeSelectedLines;
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: (String tab, (self multilineText from: 1 to: 29) asString, String tab, (self multilineText from: 30 to: self multilineText size) asString).
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 1 to: 43.
	}.

	^ anEditor
]

{ #category : #'examples - indentation' }
BrTextEditorInserterExamples >> insert_indentation_selection_1_to_2 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor selecter
		from: 1 to: 2;
		select.

	anEditor inserter
		indentation;
		beforeSelectedLines;
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: (String tab, self multilineText asString).
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 2 to: 3.
	}.

	^ anEditor
]

{ #category : #'examples - indentation' }
BrTextEditorInserterExamples >> insert_indentation_selection_29_to_67 [
	<gtExample>
	| anEditor |

	anEditor := self editorOnMultilineText.
	anEditor selecter
		from: 29 to: 67;
		select.

	anEditor inserter
		indentation;
		beforeSelectedLines;
		withoutSelectionDelete;
		insert.

	self assert: anEditor text asString equals: (
		(self multilineText from: 1 to: 29) asString,
		String tab, (self multilineText from: 30 to: 42) asString,
		String tab, (self multilineText from: 43 to: self multilineText size) asString).
	self assert: anEditor selection allSelections equals: {
		BlSelection from: 30 to: 69.
	}.

	^ anEditor
]
