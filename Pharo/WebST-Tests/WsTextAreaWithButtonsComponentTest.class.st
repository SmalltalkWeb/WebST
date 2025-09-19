Class {
	#name : 'WsTextAreaWithButtonsComponentTest',
	#superclass : 'WsMvcComponentTest',
	#traits : 'WsTKeyboardEventsGenerator + WsTMouseEventsGenerator',
	#classTraits : 'WsTKeyboardEventsGenerator classTrait + WsTMouseEventsGenerator classTrait',
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

	^ { #checkSpelling -> false.
	#resizeDirections -> 'none'.
	#textHeight -> '640px'.
	#placeholder -> 'I do not care what type here!' }
]

{ #category : 'asserting' }
WsTextAreaWithButtonsComponentTest >> assertCustomAttributesApplied [
	self assert: self textArea spellcheck equalsDataAttributeAt: #checkSpelling.
	self assert: self textArea placeholder equalsDataAttributeAt: #placeholder.
	self assert: self textArea style height equalsDataAttributeAt: #height.
	self assert: self textArea style resize equalsDataAttributeAt: #resizeDirections.  
]

{ #category : 'asserting' }
WsTextAreaWithButtonsComponentTest >> assertDefaultAttributesApplied [
	self assert: self textArea spellcheck equals: WsTextAreaWithButtonsComponent defaultSpellcheckAttribute.
	self assert: self textArea placeholder equals: WsTextAreaWithButtonsComponent defaultPlaceholderAttribute.
	self assert: self textArea style height equals: WsTextAreaWithButtonsComponent defaultHeightAttribute.
	self assert: self textArea style resize equals: WsTextAreaWithButtonsComponent defaultResizeDirectionsAttribute.  
]

{ #category : 'asserting' }
WsTextAreaWithButtonsComponentTest >> assertViewModelLink [
	
	| savedString |
	{'some string to save'. 'multi-line string\nto save too'  } do: [: providedString |
	self typeString: providedString in: self textArea.
	self clickElement: self saveButton.
	self assert: self savedText equals: providedString].
	savedString := self savedText.
	self typeString: 'another string that will be cancelled' in: self textArea.
	self clickElement: self cancelButton.
	self assert: self savedText equals: savedString.
		
]

{ #category : 'accessing' }
WsTextAreaWithButtonsComponentTest >> cancelButton [ 
	^self component viewFirstElementByCssClass: #cancelButton
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
