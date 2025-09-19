Class {
	#name : 'WsTextAreaWithButtonsComponentTest',
	#superclass : 'WsMvcComponentTest',
	#traits : 'WsTKeyboardEventsGenerator',
	#classTraits : 'WsTKeyboardEventsGenerator classTrait',
	#category : 'WebST-Tests-Library',
	#package : 'WebST-Tests',
	#tag : 'Library'
}

{ #category : 'accessing' }
WsTextAreaWithButtonsComponentTest class >> componentClass [
	^WsTextAreaWithButtonsComponent 
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponentTest class >> dataAttributes [

	^ { 
	#checkSpelling -> false asString.
	#resizeDirections -> 'none'.
	#textAreaHeight -> '640px'.
	#placeholder -> 'I do not care what type here!' }
]

{ #category : 'asserting' }
WsTextAreaWithButtonsComponentTest >> assertCustomAttributesApplied [
	self assert: self textArea spellcheck asString equalsDataAttributeAt: #checkSpelling.
	self assert: self textArea placeholder equalsDataAttributeAt: #placeholder.
	self assert: self textArea style height equalsDataAttributeAt: #textAreaHeight.
	self assert: self textArea resize equalsDataAttributeAt: #resizeDirections.  
]

{ #category : 'asserting' }
WsTextAreaWithButtonsComponentTest >> assertDefaultAttributesApplied [
	self assert: self textArea spellcheck asString equals: WsTextAreaWithButtonsComponent defaultCheckSpellingAttribute.
	self assert: self textArea placeholder equals: WsTextAreaWithButtonsComponent defaultPlaceholderAttribute.
	self assert: self textArea style height equals: WsTextAreaWithButtonsComponent defaultTextAreaHeightAttribute.
	self assert: self textArea resize equals: WsTextAreaWithButtonsComponent defaultTextAreaResizeDirectionsAttribute.  
]

{ #category : 'asserting' }
WsTextAreaWithButtonsComponentTest >> assertViewModelLink [

	| savedString |
	{ 'some string to save'. 'multi-line string\nto save too' } do: [
		:providedString |
		self textArea value: ''.
		self typeString: providedString in: self textArea.
		self saveButton click.
		self assert: self savedText equals: providedString ].
	savedString := self savedText.
	self
		typeString: 'another string that will be cancelled'
		in: self textArea.
	self cancelButton click.
	self assert: self savedText equals: savedString.
	self assert: self displayedText equals: savedString
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponentTest >> cancelButton [ 
	^self component viewFirstElementByCssClass: #cancelButton
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponentTest >> displayedText [
	^self textArea value
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponentTest >> saveButton [ 
	^self component viewFirstElementByCssClass: #saveButton
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponentTest >> savedText [
	^self component savedText
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponentTest >> textArea [
	^self component viewFirstElementByTag: #textArea
]
