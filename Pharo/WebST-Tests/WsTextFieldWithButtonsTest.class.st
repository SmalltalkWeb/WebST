Class {
	#name : 'WsTextFieldWithButtonsTest',
	#superclass : 'WsMvcComponentTest',
	#category : 'WebST-Tests-Library',
	#package : 'WebST-Tests',
	#tag : 'Library'
}

{ #category : 'accessing' }
WsTextFieldWithButtonsTest class >> componentClass [

	^ WsTextFieldWithButtonsComponent 
]

{ #category : 'accessing' }
WsTextFieldWithButtonsTest class >> dataAttributes [

	^ { #placeholder -> 'Random text does not matter!' }
]

{ #category : 'asserting' }
WsTextFieldWithButtonsTest >> assertCustomAttributesApplied [
	self assert: self textDisplay placeholder equalsDataAttributeAt: #placeholder
]

{ #category : 'asserting' }
WsTextFieldWithButtonsTest >> assertDefaultAttributesApplied [
	self assert: self textDisplay placeholder equals: WsTextFieldWithButtonsComponent defaultPlaceholderAttribute.

]

{ #category : 'asserting' }
WsTextFieldWithButtonsTest >> assertViewModelLink [

	| newText1 newText2 input newText3 |
	input := component input.
	self assert: input value equals: model text.
	newText1 := 'new text'.
	model text: newText1.
	self assert: input value equals: newText1.
	newText2 := 'some text via UI'.
	input value: newText2.
	self assert: model text equals: newText1.
	self cancelButton click.
	self assert: model text equals: newText1.
	self assert: input value equals: newText1.
	input value: newText2.
	self assert: model text equals: newText1.
	self saveButton click.
	self assert: model text equals: newText2.
	self assert: input value equals: newText2.
	newText3 := 'new replacement text for change model test'.
	model text: newText3.
	self assert: input value equals: newText3.
	
]

{ #category : 'asserting' }
WsTextFieldWithButtonsTest >> cancelButton [
	^shadowRoot querySelector: '.cancelButton'
]

{ #category : 'asserting' }
WsTextFieldWithButtonsTest >> saveButton [

	^ shadowRoot querySelector: '.saveButton'
]

{ #category : 'accessing' }
WsTextFieldWithButtonsTest >> textDisplay [ 
	^self component viewFirstElementByCssClass: #textInput
]
